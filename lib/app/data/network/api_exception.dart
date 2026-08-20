import 'package:dio/dio.dart';

/// How a request failed before it ever reached the server, or in a way the server could not
/// describe.
///
/// These are the app's own classifications: a timeout has no `errorCode`, because there was no
/// response to carry one. The enum replaces the Chinese sentences this file used to build —
/// which was the last place in the app deciding what a person reads without knowing their
/// language, for the same reason the network layer has no BuildContext.
enum ApiFailure {
  timeout,
  offline,
  cancelled,
  badCertificate,

  /// A response arrived and was not the envelope this API is documented to send.
  unreadableResponse,

  /// Anything else Dio raised.
  unknown,
}

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
    this.message,
    this.errorCode,
    this.failure,
    this.statusCode,
    this.code,
    this.cause,
  });

  /// What the server said, in the server's language.
  ///
  /// Kept, and no longer the primary thing: it is the fallback for a code this build does not
  /// know, and it is what appears in logs. It used to be the *only* thing, which meant every
  /// error message in the app was Chinese whatever language the reader had chosen.
  final String? message;

  /// The server's own name for what went wrong — `INSUFFICIENT_STOCK`, `DRIVER_UNAVAILABLE`.
  ///
  /// Null when the failure never reached the server, or came from one too old to send it.
  final String? errorCode;

  /// Set instead of [errorCode] when the app classified the failure itself.
  final ApiFailure? failure;

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
  /// Classifies rather than phrases. Dio's own text — "The request returned an invalid status
  /// code of 401 ... the request contains bad syntax" — is English, and in that example also
  /// wrong about what 401 means; the sentences that replaced it were Chinese, which was right
  /// for one of the app's three languages.
  factory ApiException.fromDio(DioException e) => ApiException(
    failure: switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => ApiFailure.timeout,
      DioExceptionType.connectionError => ApiFailure.offline,
      DioExceptionType.cancel => ApiFailure.cancelled,
      DioExceptionType.badCertificate => ApiFailure.badCertificate,
      _ => ApiFailure.unknown,
    },
    statusCode: e.response?.statusCode,
    cause: e,
  );

  @override
  String toString() =>
      'ApiException($statusCode/$code ${errorCode ?? failure?.name ?? '-'}): '
      '${message ?? ''}';
}
