import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// No screen may contain a CJK string literal.
///
/// B1 moved the last one out, so the number is zero and this keeps it there. A ratchet set at
/// the count of the day would let the next few slip back in; zero is the only threshold that
/// does not need explaining later.
///
/// `flutter analyze` cannot do this — a string literal is valid Dart wherever it appears — and
/// a screenshot only catches it in the language you happen to read, which is how the tracking
/// timeline stayed Japanese inside a Chinese interface for the life of the project.
void main() {
  /// Files allowed to hold CJK, each for a stated reason.
  ///
  /// This list is the interesting part of the test. Every entry is a decision about what is
  /// *content* rather than *interface*, and adding one should be as deliberate as it looks.
  const allowed = <String, String>{
    'lib/app/data/delivery_points.dart':
        'Japanese street addresses. Content the user reads, not interface: '
        'translating an address changes where the parcel goes.',
    'lib/app/data/map/map_tile_source.dart':
        'Required attribution. 出典：国土地理院 is the wording the tile licence '
        'obliges us to show, in the language it obliges us to show it in.',
    'lib/assets/svg/svg_strings.dart': 'An Inkscape sodipodi:docname inside an embedded SVG document. Never rendered.',
  };

  /// The network layer, which builds its messages where there is no BuildContext.
  ///
  /// A ratchet rather than an exemption: the count may fall and may not rise. Phase A3 of the
  /// localisation plan takes it to zero by giving BizException an errorCode, at which point
  /// these strings stop being written here at all and the UI maps the code. Until then, a new
  /// hardcoded message in this layer is still a regression and this still catches it.
  const pending = <String, int>{
    'lib/app/data/network/api_client.dart': 3,
    'lib/app/data/network/api_exception.dart': 5,
    'lib/app/data/network/interceptors/envelope_interceptor.dart': 2,
  };

  /// Generated or derived files, which are not anybody's to edit.
  bool isGenerated(String path) =>
      path.contains('/data/api/') ||
      path.contains('app_localizations') ||
      path.endsWith('.g.dart') ||
      path.endsWith('.freezed.dart');

  test('no screen holds a CJK string literal', () {
    // Han, hiragana and katakana. Han alone would not separate Chinese from Japanese, which is
    // the point: both are display text and neither belongs in a widget.
    final cjk = RegExp(r'''(['"])([^'"\n]*[一-鿿぀-ヿ][^'"\n]*)\1''');

    final offenders = <String>[];
    final counted = <String, int>{};
    for (final entity in Directory('lib').listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      final path = entity.path.replaceAll(r'\', '/');
      if (isGenerated(path) || allowed.containsKey(path)) continue;
      final budget = pending[path];

      final lines = entity.readAsLinesSync();
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i].trim();
        // Comments may say anything; they are not shown to anyone.
        if (line.startsWith('//') ||
            line.startsWith('*') ||
            line.startsWith('/*')) {
          continue;
        }
        for (final m in cjk.allMatches(lines[i].split('//').first)) {
          if (budget != null) {
            counted[path] = (counted[path] ?? 0) + 1;
          } else {
            offenders.add('$path:${i + 1}  ${m.group(2)}');
          }
        }
      }
    }

    expect(
      offenders,
      isEmpty,
      reason:
          'Put the string in lib/l10n/app_*.arb and read it through context.l10n. '
          'If it is genuinely content rather than interface, add the file to `allowed` '
          'above with the reason.',
    );

    // The ratchet. Equality, not <=: a count that fell is a good thing that should still be
    // written down, so the number in this file always says what is actually there.
    expect(
      counted,
      pending,
      reason: "the network layer's hardcoded-message count changed; update `pending`",
    );
  });

  test('every allowed file exists and still holds CJK', () {
    // An exemption for a file that no longer needs one is an exemption nobody will notice
    // being wrong later.
    for (final entry in allowed.entries) {
      final file = File(entry.key);
      expect(
        file.existsSync(),
        isTrue,
        reason: '${entry.key} is gone; drop its exemption',
      );
      expect(
        RegExp(r'[一-鿿぀-ヿ]').hasMatch(file.readAsStringSync()),
        isTrue,
        reason: '${entry.key} no longer holds CJK; drop its exemption',
      );
    }
  });
}
