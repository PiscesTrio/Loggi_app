import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/settings/locale_provider.dart';
import 'package:loggi_app/features/settings/language_tile.dart';
import 'package:loggi_app/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The language choice, and the fact that it survives a restart.
///
/// The case worth writing is the third state. "Follow the device" and "Japanese" are
/// different intentions, and a provider that resolved the system locale eagerly would store
/// whatever the device said the first time and call it a choice — silently freezing a
/// preference the user never expressed.
Future<ProviderContainer> _container([
  Map<String, Object> seed = const {},
]) async {
  SharedPreferences.setMockInitialValues(seed);
  final prefs = await SharedPreferences.getInstance();
  return ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
  );
}

void main() {
  test('nothing stored means follow the device', () async {
    final container = await _container();
    expect(container.read(localeProvider), isNull);
  });

  test('a stored tag is the language', () async {
    final container = await _container({'app_locale': 'ja'});
    expect(container.read(localeProvider), const Locale('ja'));
  });

  test('a stored tag with a region keeps it', () async {
    final container = await _container({'app_locale': 'zh-CN'});
    expect(container.read(localeProvider), const Locale('zh', 'CN'));
  });

  test('a choice survives a restart', () async {
    final container = await _container();
    await container.read(localeProvider.notifier).set(const Locale('ja'));

    // A second container over the same store is what a restart looks like.
    final prefs = await SharedPreferences.getInstance();
    final restarted = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    expect(restarted.read(localeProvider), const Locale('ja'));
  });

  test('going back to the device clears the stored tag', () async {
    final container = await _container({'app_locale': 'ja'});
    await container.read(localeProvider.notifier).set(null);

    final prefs = await SharedPreferences.getInstance();
    // Absent, not the empty string or the device's current tag: the next start must ask the
    // device again rather than replay whatever it said today.
    expect(prefs.getString('app_locale'), isNull);
    final restarted = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    expect(restarted.read(localeProvider), isNull);
  });

  testWidgets(
    'the picker offers every supported language, each named in itself',
    (tester) async {
      final container = await _container();
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Scaffold(body: LanguageTile()),
          ),
        ),
      );

      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();

      // Named in itself, not translated: whoever needs this menu cannot read the language the
      // app is currently in.
      expect(find.text('日本語'), findsOneWidget);
      expect(find.text('中文'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      // One per supported locale, plus "follow the device".
      expect(
        find.byType(RadioListTile<Object>),
        findsNWidgets(AppLocalizations.supportedLocales.length + 1),
      );
    },
  );

  testWidgets('choosing a language stores it', (tester) async {
    final container = await _container();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: LanguageTile()),
        ),
      ),
    );

    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();
    await tester.tap(find.text('日本語'));
    await tester.pumpAndSettle();

    expect(container.read(localeProvider), const Locale('ja'));
  });
}
