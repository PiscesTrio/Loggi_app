import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/api/distribution_request.dart';
import 'package:loggi_app/app/data/api/distribution_vo.dart';
import 'package:loggi_app/app/data/api/system_log_vo.dart';
import 'package:loggi_app/app/data/api/vehicle_vo.dart';
import 'package:loggi_app/features/distribution/care_tags.dart';
import 'package:loggi_app/features/fleet/fleet_labels.dart';
import 'package:loggi_app/features/log/log_labels.dart';
import 'package:loggi_app/l10n/app_localizations.dart';

/// The tables that turn a wire value into something a person reads.
///
/// Server-side V9 replaced 男性 / 货车 / 易碎 with identifiers, so every one of these values
/// now needs a label per language. The failure mode is not a crash: a missing entry falls
/// through to `_ => wireValue` and the screen shows LIGHT_TRUCK, which looks deliberate
/// enough that nobody notices until someone who reads the language does.
///
/// So the cases below are mostly completeness checks. They are what makes adding a ninth
/// care tag on the server, regenerating, and forgetting the ARB entry a red build rather
/// than an English word in a Japanese interface.
Future<BuildContext> _context(WidgetTester tester, [Locale? locale]) async {
  late BuildContext captured;
  await tester.pumpWidget(
    MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) {
          captured = context;
          return const SizedBox();
        },
      ),
    ),
  );
  return captured;
}

/// Every language the app ships, so a completeness check covers all of them.
///
/// Without the locale loop these tests only ever exercised whichever language the test binding
/// happened to pick — English — so a Chinese entry left untranslated passed. Found by breaking
/// the Chinese ARB on purpose and watching the suite stay green.

void main() {
  testWidgets(
    'every care tag the server can send has a label, in every language',
    (tester) async {
      for (final locale in AppLocalizations.supportedLocales) {
        final context = await _context(tester, locale);

        for (final tag in DistributionRequestCareEnum.values) {
          final label = CareTags.labelOf(context, tag.value);
          // Falling through to the identifier is the bug this catches. It is not an exception
          // and not a blank — it is the wire value rendered as if it were a word.
          expect(
            label,
            isNot(tag.value),
            reason: '${tag.value} is untranslated in $locale',
          );
          expect(label, isNotEmpty);
        }
      }
    },
  );

  testWidgets('the form offers every tag the request type allows', (
    tester,
  ) async {
    // CareTags.all is a hand-ordered list, so it can fall behind the enum it is drawn from.
    // Order is a design decision; membership is not.
    expect(CareTags.all.toSet(), DistributionRequestCareEnum.values.toSet());
  });

  testWidgets(
    'every vehicle type has a label in every language, and its own drawing',
    (tester) async {
      final indices = <int>{};

      for (final locale in AppLocalizations.supportedLocales) {
        final context = await _context(tester, locale);
        for (final type in VehicleVoTypeEnum.values) {
          expect(
            vehicleTypeLabel(context, type.value),
            isNot(type.value),
            reason: '${type.value} is untranslated in $locale',
          );
          indices.add(vehicleTypeIndex(type.value));
        }
      }
      // Three types, three pictures. A copy-paste in the index table would send two types to
      // the same drawing, which no label assertion can see.
      expect(indices.length, VehicleVoTypeEnum.values.length);
    },
  );

  testWidgets(
    'an unknown value degrades to itself rather than to a wrong one',
    (tester) async {
      final context = await _context(tester);

      // A server ahead of this build. Showing the identifier is the intended fallback; the
      // thing that must not happen is silently taking a branch.
      expect(vehicleTypeLabel(context, 'ROAD_TRAIN'), 'ROAD_TRAIN');
      expect(CareTags.labelOf(context, 'KEEP_UPRIGHT'), 'KEEP_UPRIGHT');
      expect(genderLabel(context, null), '-');
    },
  );

  testWidgets('gender picks the avatar branch by identifier', (tester) async {
    for (final locale in AppLocalizations.supportedLocales) {
      final context = await _context(tester, locale);
      expect(genderLabel(context, 'MALE'), isNot('MALE'), reason: '$locale');
      expect(
        genderLabel(context, 'FEMALE'),
        isNot('FEMALE'),
        reason: '$locale',
      );
    }

    expect(isMale('MALE'), isTrue);
    expect(isMale('FEMALE'), isFalse);
    // Unset is drawn as male, which is what the old code did and is a real decision left
    // as it was; it is asserted so that changing it is deliberate.
    expect(isMale(null), isTrue);
  });

  testWidgets('every audit module has a label, in every language', (
    tester,
  ) async {
    for (final locale in AppLocalizations.supportedLocales) {
      final context = await _context(tester, locale);

      for (final module in SystemLogVoModuleEnum.values) {
        final label = logModuleLabel(context, module);
        expect(
          label,
          isNot(module.value),
          reason: '${module.value} is untranslated in $locale',
        );
        expect(label, isNotEmpty);
      }
    }
  });

  testWidgets('every operation kind has a label, in every language', (
    tester,
  ) async {
    for (final locale in AppLocalizations.supportedLocales) {
      final context = await _context(tester, locale);

      for (final type in SystemLogVoBusinessTypeEnum.values) {
        final label = businessTypeLabel(context, type);
        expect(
          label,
          isNot(type.value),
          reason: '${type.value} is untranslated in $locale',
        );
        expect(label, isNotEmpty);
      }
    }
  });

  test('an order round-trips its tags into a request', () {
    // The status-update path reads an order and posts the whole thing back. The two
    // directions are different generated types naming the same values, so the conversion
    // is hand-written and can silently drop or substitute.
    final tags = [
      DistributionVoCareEnum.FRAGILE,
      DistributionVoCareEnum.REFRIGERATE,
      DistributionVoCareEnum.DO_NOT_STACK,
    ];

    expect(CareTags.toRequest(tags), {
      DistributionRequestCareEnum.FRAGILE,
      DistributionRequestCareEnum.REFRIGERATE,
      DistributionRequestCareEnum.DO_NOT_STACK,
    });
    expect(CareTags.toRequest(null), isEmpty);
    expect(CareTags.toRequest(const []), isEmpty);
  });
}
