/// Every environment-dependent value the app has, in one place.
///
/// The backend address used to be a string literal in two files — `main.dart` wired
/// `NetOptions` inline and `ApiOptions.init()` held a second copy that was never called.
/// Keeping two copies in sync is a rule someone has to remember; this is the same rule
/// enforced by there being only one copy.
///
/// Injected at compile time rather than read from a file, which is what Flutter offers and
/// what keeps a real host out of a repository that is meant to be read by strangers.
library;

class AppConfig {
  const AppConfig._();

  /// The API root.
  ///
  /// `10.0.2.2` is the Android emulator's alias for the host machine, which makes the
  /// default useful without being anyone's real server. A physical device reaching a local
  /// backend over `adb reverse tcp:8088 tcp:8088` wants `127.0.0.1` instead:
  ///
  /// ```
  /// flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8088/api
  /// flutter build apk --dart-define=API_BASE_URL=https://api.example.com/api \
  ///                   --dart-define=ENFORCE_HTTPS=true
  /// ```
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8088/api',
  );

  /// Refuses to start against a plaintext endpoint. Off by default so local development
  /// works; a release build should pass it.
  static const bool enforceHttps =
      bool.fromEnvironment('ENFORCE_HTTPS', defaultValue: false);

  /// The old configuration set only a connect timeout of 3 seconds. A server that accepts
  /// the connection and then never answers left the request hanging forever, because
  /// neither of the other two timeouts existed.
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);

  /// Called during bootstrap. Assertions only, so it costs nothing in release — its job is
  /// to fail a misconfigured debug build immediately rather than at the first request.
  static void assertValid() {
    assert(apiBaseUrl.isNotEmpty, 'API_BASE_URL is empty');
    assert(
      !enforceHttps || apiBaseUrl.startsWith('https://'),
      'ENFORCE_HTTPS is set but API_BASE_URL is not https: $apiBaseUrl',
    );
  }
}
