import 'package:intl/intl.dart';

/// A timestamp as the screens show it.
///
/// These fields were strings on the wire until S09, so every screen rendered whatever the
/// server had already formatted — which made the display format a server decision, and let
/// one column's format drift from another's. They are instants now, and turning an instant
/// into text belongs to whoever is drawing it. One function, so the app agrees with itself.
String formatDateTime(DateTime? value) => value == null
    ? '-'
    : DateFormat('yyyy-MM-dd HH:mm:ss').format(value.toLocal());
