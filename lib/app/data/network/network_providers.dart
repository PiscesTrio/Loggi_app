import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../config/app_config.dart';
import '../auth/token_storage.dart';
import 'api_client.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/envelope_interceptor.dart';
import 'request_log_interceptor.dart';

/// The one place a [Dio] is built, and the only way anything gets one.
///
/// `flutter_nb_net` exposed `NetOptions.instance`, a global mutable singleton. That is why
/// the token had to be written onto it by hand from two screens, why calling `create()`
/// twice appended a second copy of every interceptor — one POST appeared in the log three
/// times and was reported as three requests — and why the network layer could not be tested
/// without a server. A provider hands out the same instance to everyone and a different one
/// to a test.
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  // encryptedSharedPreferences is opt-in on this line of the plugin: without it the Android
  // implementation falls back to plain SharedPreferences with only the value encrypted by a
  // Keystore-held key, which is weaker than it sounds. With it, both keys and values go
  // through EncryptedSharedPreferences.
  //
  // Pinned to 9.2.4 rather than 11.x, which requires compileSdk 37 while this project
  // compiles against 36 — and 36 is also the highest AGP 9.1.0 recommends. Raising
  // compileSdk past the toolchain's supported ceiling to satisfy one plugin would undo the
  // version work S11 did; the 9.x line does the same job inside it.
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
});

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage(ref.watch(secureStorageProvider));
});

/// Set by whoever owns navigation, so a 401 can send the user to sign in without this
/// layer knowing what a route is. Null until then, and harmless if never set.
final onUnauthorizedProvider = StateProvider<void Function()?>((ref) => null);

final dioProvider = Provider<Dio>((ref) {
  AppConfig.assertValid();

  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      sendTimeout: AppConfig.sendTimeout,
      // Non-2xx bodies must reach the envelope interceptor. Dio's default rejects them
      // first, and its DioException message is English boilerplate — for a 401 it even
      // says the request "contains bad syntax", which is a different error entirely.
      validateStatus: (status) => status != null,
      contentType: Headers.jsonContentType,
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(
      ref.watch(tokenStorageProvider),
      onUnauthorized: () => ref.read(onUnauthorizedProvider)?.call(),
    ),
    const EnvelopeInterceptor(),
    // Retries only what is safe to repeat. A GET can be sent twice with no consequence;
    // re-sending the POST that creates a distribution order creates two.
    RetryInterceptor(
      dio: dio,
      retries: 2,
      retryDelays: const [
        Duration(milliseconds: 300),
        Duration(milliseconds: 900),
      ],
      retryEvaluator: (error, attempt) {
        final method = error.requestOptions.method.toUpperCase();
        if (method != 'GET' && method != 'HEAD') {
          return false;
        }
        return switch (error.type) {
          DioExceptionType.connectionTimeout ||
          DioExceptionType.receiveTimeout ||
          DioExceptionType.sendTimeout ||
          DioExceptionType.connectionError => true,
          // 5xx is worth another try; a 4xx will say the same thing again.
          _ => (error.response?.statusCode ?? 0) >= 500,
        };
      },
    ),
    // Last, so it observes what actually goes out. It prints method, path and status and
    // nothing else — the logger it replaced hard-coded requestHeader/requestBody and put
    // the Bearer token into logcat 22 times per session.
    if (kDebugMode) RequestLogInterceptor(),
  ]);

  return dio;
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(dioProvider));
});
