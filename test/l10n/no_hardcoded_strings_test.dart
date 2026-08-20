import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// No screen may contain a CJK string literal.
///
/// B1 moved the last one out of the screens and A3 took the network layer with it, so the
/// number is zero everywhere and this keeps it there.
///
/// It was a ratchet at 10 for a while: the network layer builds its messages where there is no
/// BuildContext, so until the server sent an `errorCode` there was nothing for it to hand up
/// instead of a sentence. The ratchet asserted equality rather than `<=` precisely so that the
/// day the count fell to zero would be a failing build asking for this paragraph. A ratchet set at
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
    'lib/features/settings/language_tile.dart':
        'Language names, written in themselves — 日本語, 中文, English. Deliberately not '
        'localised: the person who needs the language menu is the person who cannot '
        'read the language the app is currently in, so a list of names in that '
        'language is a list they cannot use.',
    'lib/assets/svg/svg_strings.dart': 'An Inkscape sodipodi:docname inside an embedded SVG document. Never rendered.',
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
    for (final entity in Directory('lib').listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      final path = entity.path.replaceAll(r'\', '/');
      if (isGenerated(path) || allowed.containsKey(path)) continue;

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
          offenders.add('$path:${i + 1}  ${m.group(2)}');
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
