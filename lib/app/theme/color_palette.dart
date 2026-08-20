import 'package:flutter/material.dart';

/// The app's own colours.
///
/// This used to hold three unrelated sets in one mixin: these, the chart's slice colours,
/// and a dark palette — `menuBackground`, `itemsBackground`, `pageBackground`,
/// `mainTextColor1..3`, `mainGridLineColor`, `borderColor`, `gridLinesColor` — that came in
/// with an fl_chart sample and was never referenced by anything. Thirteen entries in total
/// that nothing used, sitting next to the ones every screen reads.
mixin ColorPalette {
  /// The page behind everything.
  static const Color aquaHaze = Color(0xffeff5f4);

  /// The brand colour: headers, the seed of the ColorScheme, the floating buttons.
  static const Color pacificBlue = Color(0xff00b7b7);
  static const Color bondyBlue = Color(0xff0096a5);

  static const Color white = Color(0xffffffff);

  /// Headings.
  static const Color timberGreen = Color(0xff1a2e35);

  /// Body text and field content.
  static const Color nileBlue = Color(0xff1a535c);

  /// Destructive actions.
  static const Color mandy = Color(0xffe75757);
}

/// The colours a pie slice can be, in the order they are handed out.
///
/// Kept apart from the app's palette because they answer a different question: these are
/// picked to be distinguishable from each other, not to match the brand.
abstract final class ChartPalette {
  static const slices = <Color>[
    Color(0xFF2196F3),
    Color(0xFFFFC300),
    Color(0xFFFF683B),
    Color(0xFF3BFF49),
    Color(0xFF6E1BFF),
    Color(0xFFFF3AF2),
    Color(0xFFE80054),
    Color(0xFF50E4FF),
  ];
}
