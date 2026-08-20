import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/settings/locale_provider.dart';
import '../../l10n/l10n.dart';

/// One offer in the language picker. Null means "follow the device".
typedef _Choice = ({Locale? locale, String? name});

/// The language choice: follow the device, or pick one.
///
/// Every language is written in itself — 日本語, 中文, English — and none of them is
/// translated. That is the convention everywhere, and the reason is practical rather than
/// stylistic: the person who needs this menu is the person who cannot read the language the
/// app is currently in, so a list of language names *in that language* is a list they cannot
/// use. Only "follow the device" is localised, because it is a sentence rather than a name.
class LanguageTile extends ConsumerWidget {
  const LanguageTile({super.key});

  /// The order the picker offers, matching the order `supportedLocales` declares.
  ///
  /// A list rather than a map keyed by Locale: Locale overrides `==`, which a const map may
  /// not have as a key type.
  static const _choices = <_Choice>[
    (locale: null, name: null), // the sentence, read from the ARB
    (locale: Locale('ja'), name: '日本語'),
    (locale: Locale('zh', 'CN'), name: '中文'),
    (locale: Locale('en', 'US'), name: 'English'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(localeProvider);
    return ListTile(
      title: Text(context.l10n.settingsLanguage),
      subtitle: Text(_nameOf(context, current)),
      onTap: () => _pick(context, ref, current),
    );
  }

  static String _nameOf(BuildContext context, Locale? locale) {
    if (locale == null) return context.l10n.settingsLanguageSystem;
    for (final choice in _choices) {
      if (choice.locale == locale) return choice.name!;
    }
    return locale.toLanguageTag();
  }

  Future<void> _pick(
    BuildContext context,
    WidgetRef ref,
    Locale? current,
  ) async {
    // `null` is a real choice here and is also RadioGroup's "nothing selected", so a
    // sentinel stands in for it while the dialog is open.
    const system = Object();

    final chosen = await showDialog<Object>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(context.l10n.settingsLanguage),
        children: [
          RadioGroup<Object>(
            groupValue: current ?? system,
            onChanged: (value) => Navigator.pop(context, value),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final choice in _choices)
                  RadioListTile<Object>(
                    value: choice.locale ?? system,
                    title: Text(
                      choice.name ?? context.l10n.settingsLanguageSystem,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );

    if (chosen == null) return; // dismissed without choosing
    await ref
        .read(localeProvider.notifier)
        .set(identical(chosen, system) ? null : chosen as Locale);
  }
}
