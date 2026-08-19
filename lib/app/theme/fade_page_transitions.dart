import 'package:flutter/material.dart';

/// A plain cross-fade between pages.
///
/// The app ran on `GetMaterialApp(defaultTransition: Transition.fadeIn)` until S13 replaced
/// GetX with go_router. Nothing replaced that setting, so every route in the app quietly
/// switched to the platform default — a slide in from the right on Android. It was reported
/// on the one screen where the meaning is wrong (filing an order, which slides up), but the
/// change was app-wide.
///
/// Flutter ships no pure-fade builder: `FadeUpwardsPageTransitionsBuilder` fades *and*
/// slides, which is a different animation. Ten lines is cheaper than accepting the wrong one.
class FadePageTransitionsBuilder extends PageTransitionsBuilder {
  const FadePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}

/// Every platform, because the app is the same app on each.
const fadePageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: FadePageTransitionsBuilder(),
    TargetPlatform.iOS: FadePageTransitionsBuilder(),
    TargetPlatform.macOS: FadePageTransitionsBuilder(),
    TargetPlatform.windows: FadePageTransitionsBuilder(),
    TargetPlatform.linux: FadePageTransitionsBuilder(),
    TargetPlatform.fuchsia: FadePageTransitionsBuilder(),
  },
);
