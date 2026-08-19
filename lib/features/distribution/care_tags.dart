import 'package:flutter/widgets.dart';

import '../../l10n/l10n.dart';

/// The eight handling tags an order can carry.
///
/// The Chinese token is the *value*: `distribution.care` stores these comma-joined, the seed
/// data writes them literally, and the server compares against them. The label is what the
/// form shows. They were the same string until now, which is why they read as display text —
/// translating them would have changed what gets recorded.
abstract final class CareTags {
  /// In the order the form has always offered them.
  static const wireValues = <String>[
    '易碎',
    '防潮',
    '防晒',
    '防高温',
    '禁止翻滚',
    '禁止堆码',
    '冷藏',
    '易燃',
  ];

  static String labelOf(BuildContext context, String wireValue) {
    final l10n = context.l10n;
    return switch (wireValue) {
      '易碎' => l10n.careFragile,
      '防潮' => l10n.careKeepDry,
      '防晒' => l10n.careNoSun,
      '防高温' => l10n.careNoHeat,
      '禁止翻滚' => l10n.careNoTumble,
      '禁止堆码' => l10n.careNoStack,
      '冷藏' => l10n.careRefrigerate,
      '易燃' => l10n.careFlammable,
      // An order filed before this list existed, or by something else. Showing the stored
      // value beats showing nothing.
      _ => wireValue,
    };
  }
}
