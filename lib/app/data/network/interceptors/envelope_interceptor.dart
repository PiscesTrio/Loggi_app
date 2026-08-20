import 'package:dio/dio.dart';

import '../api_exception.dart';

/// Unwraps the backend's `{code, status, msg, data}` envelope, or fails with what it said.
///
/// Every response from this API is that shape, on success and on failure alike, so the
/// unwrapping belongs in one place rather than in each of the twenty-odd call sites that
/// used to do it. What each call site gets back is `data`.
///
/// The failure half is the part that was broken for the life of the project. The decoder
/// read the message from `response.data['errorMsg']` — a key the backend has never sent;
/// the envelope field is `msg` — so every message the server took the trouble to write was
/// replaced by a generic fallback, one key name away from the user.
class EnvelopeInterceptor extends Interceptor {
  const EnvelopeInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final body = response.data;

    // Not every body is an envelope. An unmapped path answered by the servlet container, a
    // gateway's HTML error page, an empty 204 — all reach here, and `body['code']` on a
    // String throws NoSuchMethodError, which is not a failure any caller can interpret.
    if (body is! Map) {
      final status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        // A successful response that is not an envelope is passed through untouched rather
        // than rejected: nothing in this API does that today, and refusing it would be a
        // rule invented here.
        handler.next(response);
        return;
      }
      handler.reject(
        _asError(
          response,
          ApiException(message: '服务器返回了无法解析的响应', statusCode: status),
        ),
        true,
      );
      return;
    }

    final code = body['code'];
    // Any 2xx, not only 200. The envelope's code mirrors the HTTP status, and since S10 a
    // POST that creates a row answers 201 — so an inventory movement that the server had
    // recorded came back through here as a failure, and the screen reported 请求出错 over
    // a write that had already happened. Testing 200 exactly encoded an assumption about
    // which success codes the API uses; this tests what success means.
    if (code is int && code >= 200 && code < 300) {
      // Replaces the envelope with its payload, so callers never see the wrapper.
      response.data = body['data'];
      handler.next(response);
      return;
    }

    final message = body['msg'];
    handler.reject(
      _asError(
        response,
        ApiException(
          message: message is String && message.isNotEmpty ? message : '请求出错',
          statusCode: response.statusCode,
          code: code is int ? code : null,
        ),
      ),
      true,
    );
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // A transport failure never reached the envelope, so there is nothing to unwrap; it
    // still has to arrive as the same type as everything else.
    if (err.error is ApiException) {
      handler.next(err);
      return;
    }

    // A non-2xx that Dio rejected before this interceptor saw it may still carry an
    // envelope — that is where the backend puts its message.
    final body = err.response?.data;
    if (body is Map && body['msg'] is String) {
      handler.next(
        _asError(
          err.response!,
          ApiException(
            message: body['msg'] as String,
            statusCode: err.response?.statusCode,
            code: body['code'] is int ? body['code'] as int : null,
            cause: err,
          ),
        ),
      );
      return;
    }

    handler.next(
      _asError(err.response, ApiException.fromDio(err), original: err),
    );
  }

  DioException _asError(
    Response? response,
    ApiException api, {
    DioException? original,
  }) {
    return DioException(
      requestOptions: response?.requestOptions ?? original!.requestOptions,
      response: response,
      type: original?.type ?? DioExceptionType.badResponse,
      error: api,
      message: api.message,
    );
  }
}
