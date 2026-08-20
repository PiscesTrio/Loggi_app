import 'package:intl/intl.dart';

/// Timestamps as the screens show them.
///
/// These fields were strings on the wire until S09, so every screen rendered whatever the
/// server had already formatted — which made the display format a server decision, and let
/// one column's format drift from another's. They are instants now, and turning an instant
/// into text belongs to whoever is drawing it.
///
/// Two formats, both declared here. A log line wants the second; a card does not, and the
/// difference is a layout judgement rather than an accident of which endpoint answered.

/// To the second. For logs, audit trails and detail screens.
String formatDateTime(DateTime? value) => value == null
    ? '-'
    : DateFormat('yyyy-MM-dd HH:mm:ss').format(value.toLocal());

/// To the minute. For cards, where the seconds are noise.
String formatDateMinute(DateTime? value) => value == null
    ? '-'
    : DateFormat('yyyy-MM-dd HH:mm').format(value.toLocal());
