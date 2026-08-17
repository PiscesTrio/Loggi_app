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
    NetOptions.instance
    .addHeaders({"Authorization": token})
    .create();
  }
}
