import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

/// Where the JWT lives.
///
/// Three things changed from the version in `utils/token_storage.dart`:
///
/// * **Encrypted at rest.** GetStorage writes an unencrypted JSON file in the app's
///   directory. This uses the Android Keystore / iOS Keychain, so the credential is not
///   simply readable by anything that can read the filesystem.
/// * **`String?`, not `String`.** The old `getToken()` declared a non-nullable return and
///   handed back `box.read("token")`, which is null when nobody has logged in. The type
///   said the value was always there; the storage said otherwise, and the app crashed at
///   whichever call site got there first.
/// * **No `"not logged in"` sentinel.** Logging out wrote that literal string as the token.
///   Every reader then had to know it, and a reader who did not know it saw a logged-in
///   user holding a token made of prose. Absence is spelled `null`.
class TokenStorage {
  TokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const String _tokenKey = 'auth_token';

  /// The GetStorage key the old implementation used, read once for migration.
  static const String _legacyKey = 'token';

  /// The literal the old implementation wrote on logout.
  static const String _legacySignedOutSentinel = 'not logged in';

  /// The token, or null when nobody is signed in.
  ///
  /// Falls back to the old GetStorage location once and moves what it finds, so an
  /// existing install does not get silently signed out by this change. The legacy entry is
  /// removed on the way through — leaving a plaintext copy of a credential behind would
  /// undo the point of the move.
  Future<String?> read() async {
    final current = await _storage.read(key: _tokenKey);
    if (current != null) {
      return current;
    }
    return _migrateLegacyToken();
  }

  Future<void> write(String token) =>
      _storage.write(key: _tokenKey, value: token);

  Future<void> clear() => _storage.delete(key: _tokenKey);

  Future<bool> isLoggedIn() async => (await read()) != null;

  Future<String?> _migrateLegacyToken() async {
    final box = GetStorage();
    final legacy = box.read(_legacyKey);
    if (legacy is! String ||
        legacy.isEmpty ||
        legacy == _legacySignedOutSentinel) {
      // Also clears the sentinel, so the string stops existing anywhere.
      await box.remove(_legacyKey);
      return null;
    }
    await write(legacy);
    await box.remove(_legacyKey);
    return legacy;
  }
}
