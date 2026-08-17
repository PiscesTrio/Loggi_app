import 'package:flutter_nb_net/flutter_net.dart';

import 'decoder.dart';

class ApiOptions {
  init() {
    NetOptions.instance

        // baseUrl
        .setBaseUrl("http://YOUR_API_HOST:8088/api") // replace with the real backend address
        .setHttpDecoder(MyHttpDecoder.getInstance())
        //  connect timeout
        .setConnectTimeout(const Duration(milliseconds: 3000))
        // enable request logging (default: true)
        .enableLogger(true)
        .create();
  }

  setToken({required String token}) {
    // "Bearer " is the standard scheme, and the server now requires it: it strips exactly this
    // prefix and verifies what remains. Previously the token was sent bare and carried its own
    // "logistics:" prefix, which the server treated as evidence the token was genuine — a
    // transport convention standing in for a signature check.
    NetOptions.instance
    .addHeaders({"Authorization": "Bearer $token"})
    .create();
  }
}
