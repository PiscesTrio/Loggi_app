import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key, required this.isLoggedIn});

  /// Decided in `main()` before the first frame.
  ///
  /// This used to be `TokenStorage().isLoggedIn().obs` read here, in build(). Two problems
  /// went with that: the read was synchronous, which secure storage cannot be, and wrapping
  /// it in an Rx implied the value could change while nothing ever changed it — logging out
  /// navigates, it does not update this flag.
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return (isLoggedIn?GetMaterialApp(
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
    ));


  }


}