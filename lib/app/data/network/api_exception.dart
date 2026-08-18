import 'package:dio/dio.dart';

/// A failed request, in terms the app can act on.
///
/// One type for every way a call can fail, so a caller writes one `catch` instead of
/// knowing which of `DioException`, `NetException`, `TypeError` or a null return it is
/// facing today. That mattered: the old client mapped a non-2xx response to
/// `DioException`, whose `message` is Dio's English boilerplate, and separately mapped a
/// business error to `NetException` — and both were then flattened to `return null` by
/// `api.dart`, so the screens saw neither.
class ApiException implements Exception {
  const ApiException({
    required this.message,
    this.statusCode,
    this.code,
    this.cause,
  });

  /// Text meant to be shown. When the backend sent one, this is it.
  final String message;

  /// The HTTP status, when there was a response.
  final int? statusCode;

  /// The business code from the `{code, status, msg, data}` envelope, when present.
  /// Usually equals [statusCode]; the two disagree only if the contract drifts, which is
  /// worth being able to see rather than collapsing.
  final int? code;

  final Object? cause;

  bool get isUnauthorized => statusCode == 401 || code == 401;

  bool get isRateLimited => statusCode == 429 || code == 429;

  /// Builds one from a transport-level failure.
  ///
  /// The messages are deliberately plain and in the app's language. Dio's own text —
  /// "The request returned an invalid status code of 401 ... the request contains bad
  /// syntax" — is English, and in that example also wrong about what 401 means.
  factory ApiException.fromDio(DioException e) {
    final status = e.response?.statusCode;
    final message = switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        '连接超时，请检查网络后重试',
      DioExceptionType.connectionError => '无法连接到服务器',
      DioExceptionType.cancel => '请求已取消',
      DioExceptionType.badCertificate => '服务器证书无效',
      _ => '请求失败，请稍后重试',
    };
    return ApiException(message: message, statusCode: status, cause: e);
  }

  @override
  String toString() => 'ApiException($statusCode/$code): $message';
}
