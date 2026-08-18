import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/network/network_providers.dart';

/// Whether anyone is signed in, and whether we know yet.
///
/// [unknown] is the state before the keystore has been read. It exists because the answer
/// is genuinely unavailable for a moment and the router must not act on a guess: treating
/// "not yet read" as "signed out" sends a returning user to the login screen and then
/// yanks them away from it, which is the flicker that made the old code read the token
/// synchronously in `build`.
enum AuthStatus { unknown, signedIn, signedOut }

class AuthState {
  const AuthState(this.status);

  const AuthState.unknown() : status = AuthStatus.unknown;

  final AuthStatus status;

  bool get isSignedIn => status == AuthStatus.signedIn;

  bool get isResolved => status != AuthStatus.unknown;
}

/// The single source of truth for the session.
///
/// There was no such thing before. `my_app.dart` read the token in `build()` and wrapped
/// the result in an `Rx` that nothing ever updated; `home_view.dart` kept its own
/// `GetStorage` handle; logging out wrote a sentinel string and navigated by hand. Three
/// places each held part of the answer, and none of them could tell the others.
class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Resolved by whoever bootstraps; see `restore`.
    return const AuthState.unknown();
  }

  /// Reads the stored credential once, at startup.
  Future<void> restore() async {
    final token = await ref.read(tokenStorageProvider).read();
    state = AuthState(token == null ? AuthStatus.signedOut : AuthStatus.signedIn);
  }

  Future<void> signIn(String token) async {
    // One client now, so one write. This used to also push the credential onto
    // flutter_nb_net's global Dio, and the two could disagree.
    await ref.read(tokenStorageProvider).write(token);
    state = const AuthState(AuthStatus.signedIn);
  }

  /// Signs out and forgets the credential.
  ///
  /// Called both by the user and by [AuthInterceptor] when the server rejects a token, so
  /// an expired session behaves exactly like a deliberate logout instead of leaving the app
  /// in a signed-in state that fails every request.
  Future<void> signOut() async {
    await ref.read(tokenStorageProvider).clear();
    state = const AuthState(AuthStatus.signedOut);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
