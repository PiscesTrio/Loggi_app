import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loggi_app/my_app.dart';

import 'app/config/app_config.dart';
import 'app/data/network/legacy_bridge.dart';
import 'app/data/network/network_providers.dart';

/// Starts the app.
///
/// Networking used to be configured here, inline, as a second copy of the block in
/// `ApiOptions.init()` — which was commented out at the call site and therefore dead. One
/// of the two had the base URL, the timeout and the interceptor list; the other had the
/// same three, slightly differently. Both are gone: `AppConfig` holds the values and
/// `network_providers.dart` assembles the client.
Future<void> main() async {
  // Real-device automation channel, off by default: only a build passing
  // --dart-define=ENABLE_FLUTTER_DRIVER=true opens it, so release builds never do.
  //
  // Either branch initialises the binding, and only one of them may: a binding can be
  // installed once per isolate, and enableFlutterDriverExtension installs its own
  // (_DriverBinding). Calling ensureInitialized() first — which is the obvious way to
  // write this, since main() is now async and needs a binding before awaiting anything —
  // makes the driver build die on `_debugInitializedType == null` before reaching runApp,
  // leaving the app on its splash screen with the failure only in logcat. Found on the
  // device; no test builds with the driver extension, so nothing else could have found it.
  //
  // Trade-off to know before using the driver: with the extension enabled it swallows real
  // keyboard input, so typing on the device by hand stops working. That is what makes the
  // driver's own enterText work; to type by hand instead, inject through adb rather than
  // turning text-entry emulation off, which would break enterText in the other direction.
  if (const bool.fromEnvironment('ENABLE_FLUTTER_DRIVER')) {
    enableFlutterDriverExtension();
  } else {
    WidgetsFlutterBinding.ensureInitialized();
  }

  AppConfig.assertValid();
  // Still needed: the legacy token lives here until it is migrated, and other GetX code
  // uses it.
  await GetStorage.init();

  final container = ProviderContainer();
  appContainer = container;

  // Read once, before the first frame. The old code decided which screen to show from a
  // synchronous `TokenStorage().isLoggedIn()`; secure storage is asynchronous, and doing
  // that read here means the first frame is already correct rather than flashing login and
  // then replacing it. It also runs the migration off the old plaintext store exactly once.
  final token = await container.read(tokenStorageProvider).read();

  configureLegacyNetworking(token);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(isLoggedIn: token != null),
    ),
  );
}
