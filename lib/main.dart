import 'package:loggi_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nb_net/flutter_net.dart';

import 'package:get_storage/get_storage.dart';

import 'app/data/network/decoder.dart';
import 'app/data/network/request_log_interceptor.dart';


void main()async {
  await GetStorage.init();
  // ApiOptions().init();
   NetOptions.instance

        // baseUrl
        .setBaseUrl("http://YOUR_API_HOST:8088/api") // replace with the real backend address
        .setHttpDecoder(MyHttpDecoder.getInstance())
        //  timeout
        .setConnectTimeout(const Duration(milliseconds: 3000))
        // Off, and replaced by RequestLogInterceptor: this logger hard-codes
        // requestHeader/requestBody and wrote the Bearer token into logcat.
        .enableLogger(false)
        .addInterceptor(RequestLogInterceptor())
        .create();
  runApp(const MyApp());
}
