import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/network/api_exception.dart';
import 'package:loggi_app/features/errors/error_messages.dart';
import 'package:loggi_app/l10n/app_localizations.dart';

/// Every failure the server can report, said in every language the app offers.
///
/// The set of codes is read from `tool/openapi.json` — the document the server generates from
/// its own handlers, committed here so the models can be regenerated without one running. So
/// this is a contract test in the literal sense: adding an `ErrorCode` on the server and
/// refreshing that file turns this red until the app can say the new one.
///
/// That is the property worth having. A code with no entry does not crash and does not look
/// broken — `apiErrorMessage` falls back to the server's own Chinese sentence, which reads
/// perfectly well to whoever wrote it and is untranslated to everyone else.
Future<BuildContext> _context(WidgetTester tester, Locale locale) async {
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

List<String> serverErrorCodes() {
  final doc = jsonDecode(
    File('tool/openapi.json').readAsStringSync(),
  ) as Map<String, dynamic>;
  final schemas = (doc['components'] as Map)['schemas'] as Map<String, dynamic>;
  for (final schema in schemas.values) {
    final props = (schema as Map)['properties'] as Map<String, dynamic>?;
    final errorCode = props?['errorCode'] as Map<String, dynamic>?;
    if (errorCode?['enum'] case final List<dynamic> values) {
      return values.cast<String>();
    }
  }
  throw StateError('tool/openapi.json declares no errorCode enum — refresh it');
}

void main() {
  final codes = serverErrorCodes();

  test(
    'the document actually declares codes, so the loop below is not vacuous',
    () {
      expect(codes, isNotEmpty);
      expect(codes, contains('INSUFFICIENT_STOCK'));
    },
  );

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('every server error code has a sentence in $locale', (
      tester,
    ) async {
      final context = await _context(tester, locale);
      final generic = AppLocalizations.of(context).errorGeneric;

      for (final code in codes) {
        final shown = apiErrorMessage(context, ApiException(errorCode: code));
        expect(
          shown,
          isNot(code),
          reason: '$code is shown as its own identifier in $locale',
        );
        expect(
          shown,
          isNot(generic),
          reason: '$code falls through to the generic line',
        );
        expect(shown, isNotEmpty);
      }
    });

    testWidgets('every transport failure has a sentence in $locale', (
      tester,
    ) async {
      final context = await _context(tester, locale);
      for (final failure in ApiFailure.values) {
        final shown = apiErrorMessage(context, ApiException(failure: failure));
        expect(shown, isNotEmpty, reason: '$failure in $locale');
        if (failure != ApiFailure.unknown) {
          // `unknown` is the one that is *meant* to reach the generic line: Dio raised
          // something this app has not classified, so there is nothing specific to say.
          expect(
            shown,
            isNot(AppLocalizations.of(context).errorGeneric),
            reason: '$failure in $locale',
          );
        }
      }
    });
  }

  testWidgets('a code from a newer server falls back to what the server said', (
    tester,
  ) async {
    final context = await _context(tester, const Locale('en'));
    // Not the reader's language, and better than "something went wrong" — it names the thing.
    expect(
      apiErrorMessage(
        context,
        const ApiException(
          errorCode: 'SOMETHING_ADDED_LATER',
          message: '仓库已封存',
        ),
      ),
      '仓库已封存',
    );
  });

  testWidgets('a failure with nothing to go on still says something', (
    tester,
  ) async {
    final context = await _context(tester, const Locale('ja'));
    expect(
      apiErrorMessage(context, const ApiException()),
      AppLocalizations.of(context).errorGeneric,
    );
    expect(
      apiErrorMessage(context, StateError('a bug in the app')),
      AppLocalizations.of(context).errorGeneric,
    );
  });
}
