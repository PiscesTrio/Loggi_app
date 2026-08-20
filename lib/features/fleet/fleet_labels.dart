/// Display names for the two fleet fields that stopped being free text in V9.
///
/// `vehicle.type` held 货车 / 卡车 / 重卡 and `driver.gender` held 男性 / 女性 — not display
/// text that happened to be Chinese, but values this client compared against to choose an icon
/// and an avatar. A UI in another language could not be built on top of them without either
/// translating the database or leaving the interface half-Chinese.
///
/// Keyed on the wire string rather than on a generated enum: the generator emits a separate
/// type per model that mentions the set (`VehicleVoTypeEnum`, `VehicleSummaryTypeEnum`,
/// `VehicleRequestTypeEnum` are three types for one closed set of three values), and all of
/// them stringify to the wire value. One table beats three identical ones.
library;

import 'package:flutter/widgets.dart';

import '../../l10n/l10n.dart';

/// Which of the three vehicle drawings to show.
///
/// Was `switch (type) { case "货车": return 0; ... }` inside the card widget, so the drawing a
/// vehicle got depended on a Chinese string matching character for character.
int vehicleTypeIndex(String? wire) => switch (wire) {
  'LIGHT_TRUCK' => 0,
  'TRUCK' => 1,
  'HEAVY_TRUCK' => 2,
  // A type this build does not know. The van is the smallest thing in the fleet, so it is
  // the least misleading picture to draw for something unidentified.
  _ => 0,
};

String vehicleTypeLabel(BuildContext context, String? wire) {
  final l10n = context.l10n;
  return switch (wire) {
    'LIGHT_TRUCK' => l10n.vehicleTypeLightTruck,
    'TRUCK' => l10n.vehicleTypeTruck,
    'HEAVY_TRUCK' => l10n.vehicleTypeHeavyTruck,
    null => '-',
    _ => wire,
  };
}

/// Whether to draw the male avatar.
///
/// Was `driver.gender == null || driver.gender == "男性"`. After the field became an enum the
/// analyser reported that comparison as `unrelated_type_equality_checks` — an info, not an
/// error, so it would have compiled and been false for every driver in the fleet, sending all
/// of them down the female branch. A silent wrong answer, which is the failure mode this whole
/// change exists to remove.
bool isMale(String? wire) => wire == null || wire == 'MALE';

String genderLabel(BuildContext context, String? wire) {
  final l10n = context.l10n;
  return switch (wire) {
    'MALE' => l10n.genderMale,
    'FEMALE' => l10n.genderFemale,
    null => '-',
    _ => wire,
  };
}
