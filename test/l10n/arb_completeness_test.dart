import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The ARB files themselves, checked as data.
///
/// `flutter gen-l10n` reports a key missing from a language and stops there. It cannot see the
/// two failures that actually happened in this project:
///
///  * `fieldDescription` was the literal `"Description"` in **both** files — the Chinese was
///    never written, and no tool said so because the key existed in both.
///  * five `track*` keys held the Japanese source text verbatim in `app_zh.arb`, because S17
///    copied the strings across without translating them. The English side was fine.
///
/// Both are invisible to a compiler and to a screenshot in the language you happen to read.
void main() {
  Map<String, String> load(String path) {
    final raw =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    return {
      for (final e in raw.entries)
        if (!e.key.startsWith('@')) e.key: e.value as String,
    };
  }

  final zh = load('lib/l10n/app_zh.arb');
  final en = load('lib/l10n/app_en.arb');

  test('every language carries the same keys', () {
    expect(zh.keys.toSet(), en.keys.toSet());
  });

  test(
    'no entry is identical across languages unless it is a technical token',
    () {
      // A shared value is nearly always a translation someone forgot rather than one that
      // genuinely coincides. The exceptions are tokens that are the same word everywhere.
      const shared = <String>{};

      final same = <String>[
        for (final k in zh.keys)
          if (zh[k] == en[k] && !shared.contains(k)) '$k = ${zh[k]}',
      ];
      expect(
        same,
        isEmpty,
        reason: 'untranslated: these are byte-identical in zh and en',
      );
    },
  );

  test('the Chinese file contains no kana', () {
    // The domain data is Japanese and some screens were written in it, so Japanese source
    // strings reached app_zh.arb by being copied rather than translated. Kana are the giveaway
    // — Han characters alone cannot distinguish the two languages, which is exactly why this
    // went unnoticed.
    final kana = RegExp(r'[぀-ヿ]');
    final offenders = <String>[
      for (final e in zh.entries)
        if (kana.hasMatch(e.value)) '${e.key} = ${e.value}',
    ];
    expect(offenders, isEmpty, reason: 'Japanese text in the Chinese ARB');
  });

  test('no entry is empty', () {
    for (final e in {...zh.entries, ...en.entries}) {
      expect(e.value.trim(), isNotEmpty, reason: e.key);
    }
  });

  test('every key is used by a screen', () {
    // The failure this catches has happened three times in this project. S17 added
    // logAccount, trackAssigned and a dozen others to the ARB and wired none of them up, so
    // the screens went on rendering hardcoded strings while the entries sat there looking
    // done — and when B1 came to migrate those screens it added a *second* set of keys for
    // the same strings, because nothing said the first set existed.
    //
    // An unused entry is not harmless: it is a translation someone will be asked to write,
    // review and keep in step for a string nobody displays.
    final src = StringBuffer();
    for (final f in Directory('lib').listSync(recursive: true)) {
      if (f is File &&
          f.path.endsWith('.dart') &&
          !f.path.contains('app_localizations')) {
        src.write(f.readAsStringSync());
      }
    }
    final code = src.toString();
    final unused = [
      for (final k in zh.keys)
        if (!RegExp(r'\bl10n\.' + k + r'\b').hasMatch(code)) k,
    ];
    expect(unused, isEmpty, reason: 'ARB keys no screen references');
  });

  test('placeholders match between languages', () {
    // A translation that drops {location} compiles, because gen-l10n generates the method from
    // the template file only — the other language's string is just interpolated into it.
    final ph = RegExp(r'\{(\w+)\}');
    for (final k in zh.keys) {
      final a = ph.allMatches(zh[k]!).map((m) => m.group(1)).toSet();
      final b = ph.allMatches(en[k]!).map((m) => m.group(1)).toSet();
      expect(b, a, reason: '$k: zh has $a, en has $b');
    }
  });
}
