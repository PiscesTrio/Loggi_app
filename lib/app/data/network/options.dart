import 'package:flutter_nb_net/flutter_net.dart';

import 'decoder.dart';
import 'request_log_interceptor.dart';

class ApiOptions {
  init() {
    NetOptions.instance

        // baseUrl
        .setBaseUrl("http://YOUR_API_HOST:8088/api") // replace with the real backend address
        .setHttpDecoder(MyHttpDecoder.getInstance())
        //  connect timeout
        .setConnectTimeout(const Duration(milliseconds: 3000))
        // Off, and replaced by RequestLogInterceptor: this logger hard-codes
        // requestHeader/requestBody and wrote the Bearer token into logcat.
        .enableLogger(false)
        .addInterceptor(RequestLogInterceptor())
        .create();
  }

  /// Sets the credential on the live client.
  ///
  /// "Bearer " is the standard scheme, and the server requires it: it strips exactly
  /// this prefix and verifies what remains. Previously the token was sent bare and
  /// carried its own "logistics:" prefix, which the server treated as evidence the
  /// token was genuine — a transport convention standing in for a signature check.
  ///
  /// Writes the header straight onto the Dio instance rather than going through
  /// addHeaders().create(). NetOptions.create() re-applies the whole builder,
  /// including `_dio.interceptors.addAll(...)`, so each call appended ANOTHER copy of
  /// every interceptor. main() plus the two setToken callers (login and home) left
  /// three copies on the chain, and every request was then logged three times.
  ///
  /// That is not a cosmetic bug: it made one POST look like three in the log, and it
  /// was reported as such before the duplication was found. A logger that multiplies
  /// what it reports is worse than no logger.
  setToken({required String token}) {
    NetOptions.instance.dio.options.headers["Authorization"] = "Bearer $token";
  }
}
