import 'package:loggi_app/app/utils/token_storage.dart';
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
      initialRoute: AppPages.home,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, //Supplies localized strings and other values
        GlobalWidgetsLocalizations.delegate, //Defines the default text direction for widgets, LTR or RTL.
        GlobalCupertinoLocalizations
            .delegate, //The Cupertino counterpart (Cupertino widgets are the iOS-style ones)
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(useMaterial3: true),
    ):GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, //Supplies localized strings and other values
        GlobalWidgetsLocalizations.delegate, //Defines the default text direction for widgets, LTR or RTL.
        GlobalCupertinoLocalizations
            .delegate, //The Cupertino counterpart (Cupertino widgets are the iOS-style ones)
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(useMaterial3: true),
    ),);
    

  }


}