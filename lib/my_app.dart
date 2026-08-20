import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'app/theme/app_theme.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router/app_router.dart';
import 'app/settings/locale_provider.dart';

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
      // Null means "follow the device", which is MaterialApp's own default behaviour for
      // this parameter — so the three-way choice needs no special case here.
      locale: ref.watch(localeProvider),
      routerConfig: ref.watch(routerProvider),
      localizationsDelegates: const [
        // The app's own strings. Without this the other three localise Flutter's
        // widgets and nothing the user actually reads.
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // CN, not CH. CH is Switzerland; simplified Chinese is zh_CN. Flutter resolves by
      // language code first, so Material's own widgets were in Chinese regardless — what
      // the typo actually broke is region-dependent formatting, and the fallback for a
      // device that is not zh_*.
      //
      // ja is first, and that position is the decision: Flutter falls back to
      // supportedLocales.first when the device's language matches nothing, so this line
      // answers "what does a reader who is neither Chinese nor English-speaking see". The
      // data this app carries is Japanese — the warehouses, the addresses, the plates — so
      // Japanese is the only language in which the interface and its contents agree.
      supportedLocales: const [
        Locale('ja'),
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
      theme: AppTheme.light,
    );
  }
}
