import 'package:loggi_app/app/utils/TokenStorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLoggedIn = TokenStorage().isLoggedIn().obs;
    return Obx(()=>isLoggedIn.value?GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.HOME,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, //指定本地化的字符串和一些其他的值
        GlobalWidgetsLocalizations.delegate, //定义 widget 默认的文本方向，从左到右或从右到左。
        GlobalCupertinoLocalizations
            .delegate, //对应的 Cupertino 风格（Cupertino 风格组件即 iOS 风格组件）
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(useMaterial3: true),
    ):GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, //指定本地化的字符串和一些其他的值
        GlobalWidgetsLocalizations.delegate, //定义 widget 默认的文本方向，从左到右或从右到左。
        GlobalCupertinoLocalizations
            .delegate, //对应的 Cupertino 风格（Cupertino 风格组件即 iOS 风格组件）
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(useMaterial3: true),
    ),);
    

  }


}