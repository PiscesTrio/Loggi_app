import 'package:flutter_nb_net/flutter_net.dart';

import 'decoder.dart';
import 'request_log_interceptor.dart';

class ApiOptions {
  void init() {
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
    _acceptAllStatuses();
  }

  /// Lets a non-2xx response reach [MyHttpDecoder] instead of becoming a DioException.
  ///
  /// Dio's default validateStatus accepts only 2xx, so every error the backend now
  /// reports with a real status was turned into a DioException before the decoder
  /// ran. flutter_nb_net maps that to `Result.failure(msg: dioError.message)`, and
  /// DioException.message for a bad status is Dio's own English boilerplate - "The
  /// request returned an invalid status code of 409." - shown to the user in place
  /// of 「库存数量不足」.
  ///
  /// The envelope is the same shape on success and failure, so the decoder can read
  /// either. Widening this hands it the body and lets it raise a NetException
  /// carrying the backend's own code and message.
  ///
  /// Set directly on the live Dio, after create(): NetOptions has no builder method
  /// for it, and create() assigns a whole new BaseOptions, which would drop it.
  static void _acceptAllStatuses() {
    NetOptions.instance.dio.options.validateStatus = (status) => status != null;
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
  void setToken({required String token}) {
    NetOptions.instance.dio.options.headers["Authorization"] = "Bearer $token";
  }
}
