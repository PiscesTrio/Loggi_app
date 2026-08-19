import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Logs what a request was and how it ended. Nothing else.
///
/// It exists because the alternative leaked credentials. `flutter_nb_net`'s
/// `enableLogger(true)` installs PrettyDioLogger with `requestHeader: true` and
/// `requestBody: true` hard-coded and no way to narrow it, so every request wrote
/// its `Authorization: Bearer <jwt>` header into logcat, and the login response
/// wrote the token again as part of its body — measured, 22 occurrences of a
/// single session's token after one login.
///
/// logcat is device-wide and survives the app, so that is a real credential in a
/// real log, not a theoretical one. Method, path and status are enough to debug
/// with; a header or a body is never printed here, which is why there is no
/// switch to get them back.
///
/// Only active in debug builds — [kReleaseMode] strips this out entirely rather
/// than relying on nobody reading a release log.
class RequestLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!kReleaseMode) {
      debugPrint('--> ${options.method} ${options.uri.path}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      debugPrint(
        '<-- ${response.statusCode} '
        '${response.requestOptions.method} ${response.requestOptions.uri.path}',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!kReleaseMode) {
      // err.message, not err.response — a failing response body can carry the
      // same things a successful one does.
      debugPrint(
        '<-- ${err.response?.statusCode ?? 'no response'} '
        '${err.requestOptions.method} ${err.requestOptions.uri.path} '
        '(${err.type.name})',
      );
    }
    handler.next(err);
  }
}
