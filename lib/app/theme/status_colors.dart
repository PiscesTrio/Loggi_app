import 'package:flutter/material.dart';

/// The colours that carry a meaning rather than a mood.
///
/// These were bare literals — `Color.fromRGBO(255, 0, 0, 1)` in five widgets for "busy or
/// failed", `Color.fromRGBO(4, 202, 4, 1)` in four for "idle or succeeded", and the same
/// black-at-6% shadow copied under every card. Written out at each site they read as
/// arbitrary; named here they say what they are for, and there is one place to change when
/// someone decides red-on-white is not the right way to say "on a run".
abstract final class StatusColors {
  /// A driver on a run, a vehicle out, a sign-in that failed.
  static const busy = Color.fromRGBO(255, 0, 0, 1);

  /// A driver free, a vehicle in the yard, a sign-in that worked.
  static const idle = Color.fromRGBO(4, 202, 4, 1);

  /// A delivery under way.
  static const inTransit = Color.fromRGBO(0, 132, 255, 1);

  /// A stock figure.
  static const stockBadge = Color.fromRGBO(32, 108, 190, 1);

  /// A price.
  static const priceBadge = Color.fromRGBO(4, 173, 182, 1);
}

/// The soft drop shadow under every card in this app.
///
/// Written out under each one — the same offset, blur and black-at-6% — so a card that
/// wanted to look like its neighbours had to copy nine lines to do it.
const cardShadow = BoxShadow(
  offset: Offset(0, 3),
  blurRadius: 6,
  color: Color(0x0F000000),
);
