import 'package:flutter/widgets.dart';

import '../../app/data/api/distribution_request.dart';
import '../../app/data/api/distribution_vo.dart';
import '../../l10n/l10n.dart';

/// The eight handling tags an order can carry.
///
/// These used to be Chinese phrases, and `distribution.care` stored the selected ones
/// comma-joined with a trailing comma. The value and the label were the same string, which is
/// why they read as display text — and translating them would have changed what the database
/// recorded. Server-side V9 replaced them with ISO 780 identifiers and gave each tag its own
/// row, so the value is now language-neutral and the label is a rendering of it.
///
/// The label table is keyed on the wire string rather than on an enum, because the generator
/// emits one enum type per model that mentions the set — [DistributionVoCareEnum] and
/// [DistributionRequestCareEnum] are distinct types naming the same eight tags. Both stringify
/// to the wire value, so keying on that writes the table once instead of once per type.
abstract final class CareTags {
  /// In the order the form has always offered them.
  static const all = <DistributionRequestCareEnum>[
    DistributionRequestCareEnum.FRAGILE,
    DistributionRequestCareEnum.KEEP_DRY,
    DistributionRequestCareEnum.KEEP_AWAY_FROM_SUNLIGHT,
    DistributionRequestCareEnum.PROTECT_FROM_HEAT,
    DistributionRequestCareEnum.DO_NOT_ROLL,
    DistributionRequestCareEnum.DO_NOT_STACK,
    DistributionRequestCareEnum.REFRIGERATE,
    DistributionRequestCareEnum.FLAMMABLE,
  ];

  static String labelOf(BuildContext context, String wireValue) {
    final l10n = context.l10n;
    return switch (wireValue) {
      'FRAGILE' => l10n.careFragile,
      'KEEP_DRY' => l10n.careKeepDry,
      'KEEP_AWAY_FROM_SUNLIGHT' => l10n.careNoSun,
      'PROTECT_FROM_HEAT' => l10n.careNoHeat,
      'DO_NOT_ROLL' => l10n.careNoTumble,
      'DO_NOT_STACK' => l10n.careNoStack,
      'REFRIGERATE' => l10n.careRefrigerate,
      'FLAMMABLE' => l10n.careFlammable,
      // A tag this build does not know about — a server ahead of this client. Showing the
      // identifier beats showing nothing, and it says plainly that it is untranslated.
      _ => wireValue,
    };
  }

  /// The tags on an order, as one line of readable text.
  /// The separator is localised. It was a hardcoded ideographic comma, which is right for
  /// Chinese and Japanese and wrong for English — "Fragile、Do not tumble" is what the
  /// English screen showed, found on the device the first time anyone rendered one.
  static String describe(
    BuildContext context,
    List<DistributionVoCareEnum>? tags,
  ) => (tags == null || tags.isEmpty)
      ? '-'
      : tags
            .map((t) => labelOf(context, t.value))
            .join(context.l10n.listSeparator);

  /// An order's tags in the shape a request carries them.
  ///
  /// Needed because the two directions have different generated types even though they name
  /// the same eight values; the status-update path reads an order and posts the whole thing
  /// back.
  ///
  /// A tag this build does not know is dropped, not mapped to a neighbour. Dropping loses it
  /// from the order on the next status update, which is bad; substituting any other tag would
  /// record a handling instruction nobody gave, which is worse. The real fix is for a status
  /// change to be a status change rather than a whole-order replace — noted rather than done,
  /// because it is a change to the endpoint, not to this table.
  static Set<DistributionRequestCareEnum> toRequest(
    List<DistributionVoCareEnum>? tags,
  ) {
    final byWire = {
      for (final r in DistributionRequestCareEnum.values) r.value: r,
    };
    return {
      for (final t in tags ?? const <DistributionVoCareEnum>[])
        ?byWire[t.value],
    };
  }
}
