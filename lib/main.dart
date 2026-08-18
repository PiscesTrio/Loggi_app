import 'package:loggi_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_nb_net/flutter_net.dart';

import 'package:get_storage/get_storage.dart';

import 'app/data/network/decoder.dart';
import 'app/data/network/request_log_interceptor.dart';


void main()async {
  // Real-device automation channel, off by default: only a build passing
  // --dart-define=ENABLE_FLUTTER_DRIVER=true opens it, so release builds never
  // do. Must run before runApp.
  //
  // Trade-off to know before using it: with the extension enabled, the driver
  // swallows real keyboard input, so typing on the device by hand stops
  // working. That is what makes the driver's own enterText work; to type by
  // hand instead, inject through adb rather than turning text-entry emulation
  // off, which would break enterText in the other direction.
  if (const bool.fromEnvironment('ENABLE_FLUTTER_DRIVER')) {
    enableFlutterDriverExtension();
  }
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
  // Non-2xx bodies go to MyHttpDecoder rather than becoming a DioException whose
  // message is Dio's English boilerplate. See ApiOptions._acceptAllStatuses for
  // why this is set after create() instead of through the builder.
  NetOptions.instance.dio.options.validateStatus = (status) => status != null;
  runApp(const MyApp());
}
