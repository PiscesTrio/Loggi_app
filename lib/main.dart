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
        .setBaseUrl("http://YOUR_API_HOST:8088/api") // replace with the real backend address
        .setHttpDecoder(MyHttpDecoder.getInstance())
        //  timeout
        .setConnectTimeout(const Duration(milliseconds: 3000))
        // allow log printing, defaults to true
        .enableLogger(true)
        .create();
  runApp(const MyApp());
}
