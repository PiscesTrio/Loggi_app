import 'package:dio/dio.dart';

import '../../auth/token_storage.dart';

/// Attaches the credential, and drops it when the server says it is no longer good.
///
/// Before this, `Authorization` was set by hand from two screens — `login/controller.dart`
/// after a successful sign-in and `home_controller.dart` on startup. Every future entry
/// point had to remember to do the same, and forgetting produced an app that looked signed
/// in and got 401s. Attaching the header is a property of the client, not of a screen.
///
/// `QueuedInterceptor`, not `Interceptor`: its handlers run one at a time. Several requests
/// in flight when a 401 arrives would otherwise each read, clear and re-read the token
/// concurrently, and the surviving state depends on which finished last.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(this._tokens, {this.onUnauthorized});

  final TokenStorage _tokens;

  /// Called after the token has been cleared, so the app can send the user to sign in.
  /// Kept as a callback rather than a navigation call: this file should not know that a
  /// router exists.
  final void Function()? onUnauthorized;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokens.read();
    if (token != null) {
      // "Bearer " is the scheme the server strips before verifying. The token used to be
      // sent bare, carrying its own "logistics:" prefix that the server read as evidence
      // the token was genuine — a transport convention standing in for a signature check.
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // Because validateStatus accepts every status, a 401 arrives here as a *response*.
    if (response.statusCode == 401) {
      await _clearOnce(response.requestOptions);
    }
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // ...and then again as an *error*, because the envelope interceptor rejects it. Both
    // hooks are kept — a transport-level 401, or a different interceptor order, reaches
    // only one of them — so the guard below is what makes it happen once.
    if (err.response?.statusCode == 401) {
      await _clearOnce(err.requestOptions);
    }
    handler.next(err);
  }

  /// Marks the request rather than the interceptor.
  ///
  /// A flag on the interceptor would be shared by every request in flight, so two
  /// concurrent 401s would clear once between them. The mark belongs to the request that
  /// caused it. Clearing twice would be harmless; calling [onUnauthorized] twice is not —
  /// that is two navigations to the sign-in screen for one expired token.
  Future<void> _clearOnce(RequestOptions options) async {
    if (options.extra[_handledKey] == true) {
      return;
    }
    options.extra[_handledKey] = true;
    await _tokens.clear();
    onUnauthorized?.call();
  }

  static const String _handledKey = 'auth_interceptor_401_handled';
}
