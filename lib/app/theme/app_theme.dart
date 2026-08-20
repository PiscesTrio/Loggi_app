import 'package:flutter/material.dart';

import 'color_palette.dart';
import 'fade_page_transitions.dart';

/// The app's theme, in one place.
///
/// It used to be `ThemeData(useMaterial3: true)` and nothing else, so every colour, radius,
/// shadow and font was written at the point of use — including the page background, which
/// four screens each set on their own `Scaffold` after the screens before them had painted
/// it on a `Container` that sized itself to its child.
///
/// Seeded from the brand colour rather than listed by hand: Material 3 derives a coherent
/// scheme from one seed, and the parts this app actually pins — the page background, the
/// surface the cards sit on — are overridden explicitly so that seeding does not quietly
/// restyle screens that already look the way they should.
abstract final class AppTheme {
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: ColorPalette.pacificBlue,
      primary: ColorPalette.pacificBlue,
      surface: ColorPalette.aquaHaze,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      // The page colour. Every full-screen page in this app sits on it; setting it here is
      // what lets those pages stop saying so individually.
      scaffoldBackgroundColor: ColorPalette.aquaHaze,
      pageTransitionsTheme: fadePageTransitionsTheme,
    );
  }
}
