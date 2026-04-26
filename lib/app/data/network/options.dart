import 'package:flutter_nb_net/flutter_net.dart';

import 'decoder.dart';

class ApiOptions {
  init() {
    NetOptions.instance

        // baseUrl
        .setBaseUrl("http://YOUR_API_HOST:8088/api") // 请替换为实际后端地址
        .setHttpDecoder(MyHttpDecoder.getInstance())
        //  超时时间
        .setConnectTimeout(const Duration(milliseconds: 3000))
        // 允许打印log，默认未 true
        .enableLogger(true)
        .create();
  }

  setToken({required String token}) {
    NetOptions.instance
    .addHeaders({"Authorization": token})
    .create();
  }
}
