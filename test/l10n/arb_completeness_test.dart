import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The ARB files themselves, checked as data.
///
/// `flutter gen-l10n` reports a key missing from a language and stops there. It cannot see any
/// of the four failures that actually happened in this project:
///
///  * `fieldDescription` was the literal `"Description"` in **both** files — the Chinese was
///    never written, and no tool said so because the key existed in both.
///  * five `track*` keys held the Japanese source text verbatim in `app_zh.arb`, because S17
///    copied the strings across without translating them. The English side was fine.
///  * fourteen keys were added and wired to nothing, so B1 added a second set for the same
///    strings without knowing the first existed.
///  * `app_zh.arb` and `app_ja.arb` share a script. A value copied from one to the other is
///    invisible in a way that copying into English never is.
///
/// None of these is a compile error, and a screenshot only catches them in the language the
/// person taking it happens to read.
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
  final ja = load('lib/l10n/app_ja.arb');
  final all = {'zh': zh, 'en': en, 'ja': ja};

  test('every language carries the same keys', () {
    for (final e in all.entries) {
      expect(e.value.keys.toSet(), zh.keys.toSet(), reason: e.key);
    }
  });

  test(
    'no entry is identical across languages, unless it is the same word',
    () {
      // Chinese and Japanese genuinely share vocabulary, so identity between those two is
      // sometimes correct. Every case is listed rather than waved through: the list is short,
      // and a translation someone forgot looks exactly like a word that happens to coincide.
      const sameInChineseAndJapanese = <String>{
        'tabCommodities', // 商品管理
        'tabDistributions', // 配送管理
        'logModuleCommodity', // 商品管理
        'logModuleDistribution', // 配送管理
        'deliveryStatusInTransit', // 配送中
        'fleetStatusBusy', // 配送中
        'fieldName', // 名称
        'fieldQuantity', // 数量
        'fieldCommodityName', // 商品名
        'logSignInSucceeded', // 成功
        'genderMale', // 男性
        'genderFemale', // 女性
        'listSeparator', // 、 — the ideographic comma, used by both
      };

      final pairs = [
        ('zh', 'en', zh, en, const <String>{}),
        ('en', 'ja', en, ja, const <String>{}),
        ('zh', 'ja', zh, ja, sameInChineseAndJapanese),
      ];
      for (final (a, b, ma, mb, allowed) in pairs) {
        final same = <String>[
          for (final k in ma.keys)
            if (ma[k] == mb[k] && !allowed.contains(k)) '$k = ${ma[k]}',
        ];
        expect(same, isEmpty, reason: 'byte-identical in $a and $b');
      }
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

  test('the Japanese file contains no simplified-only characters', () {
    // The mirror of the kana check, and the reason it is needed: kana catch Japanese leaking
    // into Chinese, but nothing catches Chinese leaking into Japanese, because Japanese uses
    // Han characters too. Each of these has a different Japanese form (车/車, 时/時, 单/単), so
    // one appearing here means the value was copied rather than translated. 28 of them are in
    // active use in app_zh.arb, so the check has something to catch.
    final simplifiedOnly = RegExp(
      '[车库单确认记录择请输应图页时间发关闭进级为门问题这个们说读线'
      '业务员责设账错误汇总电话历标签删机导岁绩养产权网络继续检报统计换语义汉]',
    );
    final offenders = <String>[
      for (final e in ja.entries)
        if (simplifiedOnly.hasMatch(e.value)) '${e.key} = ${e.value}',
    ];
    expect(offenders, isEmpty, reason: 'Chinese text in the Japanese ARB');
  });

  test('no entry is empty', () {
    for (final lang in all.entries) {
      for (final e in lang.value.entries) {
        expect(e.value.trim(), isNotEmpty, reason: '${lang.key}/${e.key}');
      }
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
    // review and keep in step, in three languages, for a string nobody displays.
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

  test('placeholders match across languages', () {
    // A translation that drops {location} compiles, because gen-l10n generates the method from
    // the template file only — the other language's string is just interpolated into it. The
    // placeholder simply never appears and the screen silently says less than it should.
    final ph = RegExp(r'\{(\w+)\}');
    Set<String?> names(String s) =>
        ph.allMatches(s).map((m) => m.group(1)).toSet();

    for (final k in zh.keys) {
      final want = names(zh[k]!);
      for (final lang in all.entries) {
        expect(names(lang.value[k]!), want, reason: '$k in ${lang.key}');
      }
    }
  });
}
