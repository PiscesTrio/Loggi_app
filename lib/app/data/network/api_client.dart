import 'package:dio/dio.dart';

import 'api_exception.dart';

/// A thin wrapper over [Dio] that returns payloads and throws [ApiException].
///
/// It exists to give repositories one shape to call and one failure type to catch. The
/// envelope interceptor has already stripped `{code, status, msg, data}` by the time a
/// response reaches here, so `T` is whatever was inside `data`.
///
/// What it replaces is `NbRequest`, where each of nineteen methods repeated
/// `appResp.when(success: ..., failure: (msg, code) { debugPrint(...); return null; })`.
/// That shape does not merely duplicate code, it destroys information: the message and the
/// code are printed and then a bare `null` is returned, so no caller can tell "no results"
/// from "the server refused you" — which is why several screens still render
/// `A error occurred: null`.
class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Dio get raw => _dio;

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) =>
      _send<T>(() => _dio.get<dynamic>(path, queryParameters: query, cancelToken: cancelToken));

  Future<T> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) =>
      _send<T>(() => _dio.post<dynamic>(path,
          data: data, queryParameters: query, cancelToken: cancelToken));

  Future<T> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) =>
      _send<T>(() => _dio.put<dynamic>(path,
          data: data, queryParameters: query, cancelToken: cancelToken));

  Future<T> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) =>
      _send<T>(() => _dio.delete<dynamic>(path,
          data: data, queryParameters: query, cancelToken: cancelToken));

  /// Runs a request and normalises everything that can go wrong into [ApiException].
  ///
  /// Including the cast: a payload of an unexpected shape is a contract problem, and
  /// letting a raw `TypeError` out of the network layer sends whoever debugs it looking at
  /// Dart internals instead of at the two systems that disagree.
  Future<T> _send<T>(Future<Response<dynamic>> Function() call) async {
    try {
      final response = await call();
      return response.data as T;
    } on DioException catch (e) {
      final api = e.error;
      throw api is ApiException ? api : ApiException.fromDio(e);
    } on TypeError catch (e) {
      throw ApiException(message: '服务器返回的数据格式不正确', cause: e);
    }
  }
}

/// Decodes a payload that is either a single object or a list of them.
///
/// Kept as free functions rather than methods so the client stays unaware of the model
/// layer; the repositories that know their own types call these.
List<T> decodeList<T>(dynamic data, T Function(Map<String, dynamic>) fromJson) {
  if (data is! List) {
    throw ApiException(message: '服务器返回的数据格式不正确（期望列表）');
  }
  return data
      .whereType<Map>()
      .map((e) => fromJson(Map<String, dynamic>.from(e)))
      .toList();
}

T decodeObject<T>(dynamic data, T Function(Map<String, dynamic>) fromJson) {
  if (data is! Map) {
    throw ApiException(message: '服务器返回的数据格式不正确（期望对象）');
  }
  return fromJson(Map<String, dynamic>.from(data));
}
