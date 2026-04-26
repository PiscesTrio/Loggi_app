import 'package:loggi_app/app/data/network/options.dart';
import 'package:loggi_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nb_net/flutter_net.dart';

import 'package:get_storage/get_storage.dart';

import 'app/data/network/decoder.dart';


void main()async {
  await GetStorage.init();
  // ApiOptions().init();
   NetOptions.instance

        // baseUrl
        .setBaseUrl("http://YOUR_API_HOST:8088/api") // 请替换为实际后端地址
        .setHttpDecoder(MyHttpDecoder.getInstance())
        //  超时时间
        .setConnectTimeout(const Duration(milliseconds: 3000))
        // 允许打印log，默认未 true
        .enableLogger(true)
        .create();
  runApp(const MyApp());
}
