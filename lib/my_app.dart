import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router/app_router.dart';

/// One app, one router.
///
/// There were two `GetMaterialApp`s here, identical except for `initialRoute`, chosen by an
/// `Obx` around a local `RxBool` that nothing ever updated — so the twenty-odd lines of
/// theme, locale and delegate configuration existed twice and could drift, and the login
/// state they switched on could not actually change while the app ran.
///
/// `MaterialApp.router` has no `initialRoute` to branch on: where the user lands is the
/// router's `redirect`, which reads the one source of truth and re-runs whenever it moves.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Application',
      routerConfig: ref.watch(routerProvider),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(useMaterial3: true),
    );
  }
}
