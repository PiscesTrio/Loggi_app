/// Lets GetX controllers reach the Riverpod container.
///
/// The controllers have no `ref` — they are `GetxController`s, and they will be until
/// S14 onward moves them module by module. Until then something has to bridge the two,
/// and this is it: one global, set once during bootstrap, named so nobody mistakes it
/// for the architecture.
///
/// It replaces `legacy_bridge.dart`, which also configured `flutter_nb_net`'s
/// `NetOptions.instance` singleton and mirrored the token onto it. That package is gone,
/// so the mirroring is gone with it — there is one client now, and one place the
/// credential lives.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/token_storage.dart';
import 'network_providers.dart';

ProviderContainer? _container;

ProviderContainer get appContainer {
  final c = _container;
  if (c == null) {
    throw StateError('bootstrap() must run before anything reads appContainer');
  }
  return c;
}

set appContainer(ProviderContainer c) => _container = c;

TokenStorage get tokenStorage => appContainer.read(tokenStorageProvider);
