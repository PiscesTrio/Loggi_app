import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Overridden in `main()` once the instance has been awaited.
///
/// A preference is not a credential, so it does not belong in the keystore beside the JWT —
/// and it is not GetStorage either, which exists in this app only to hold the legacy token
/// until it is migrated away. Writing a new feature against the dependency that is being
/// removed makes removing it harder.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw StateError('sharedPreferencesProvider was not overridden'),
);

/// Which language the app is in, or null to follow the device.
///
/// Null is a real third state, not a missing value. "Follow the system" and "Japanese, and
/// keep it Japanese even if I hand this phone to someone in China" are different intentions,
/// and a provider that resolved the system locale eagerly could not tell them apart — it
/// would silently freeze whatever the device happened to say the first time.
class LocaleNotifier extends Notifier<Locale?> {
  static const _key = 'app_locale';

  @override
  Locale? build() {
    final tag = ref.read(sharedPreferencesProvider).getString(_key);
    return tag == null ? null : _parse(tag);
  }

  /// Pass null to follow the device again.
  Future<void> set(Locale? locale) async {
    state = locale;
    final prefs = ref.read(sharedPreferencesProvider);
    if (locale == null) {
      await prefs.remove(_key);
    } else {
      // The BCP-47 tag, not an index into the picker. An index is a reference to the order
      // of a list in a widget, which is exactly the kind of thing that gets reordered.
      await prefs.setString(_key, locale.toLanguageTag());
    }
  }

  static Locale _parse(String tag) {
    final parts = tag.split('-');
    return parts.length > 1
        ? Locale(parts.first, parts[1])
        : Locale(parts.first);
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale?>(
  LocaleNotifier.new,
);
