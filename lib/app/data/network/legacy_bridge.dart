/// Keeps the old `flutter_nb_net` stack working while the new one is introduced.
///
/// This slice builds the replacement — a single injected Dio, interceptors, secure token
/// storage — but does not rewrite the nineteen `NbRequest` methods or the screens that call
/// them. Doing both at once would mean one commit in which every screen is untested and the
/// only way to find out is to run all of them. So both stacks exist for now, reading the
/// credential from the same place, and screens move across one slice at a time.
///
/// This file is the seam, and it is meant to be deleted. When the last `NbRequest` caller
/// is gone, so is this, along with `decoder.dart`, `options.dart` and the dependency.
library;

import 'package:flutter_nb_net/flutter_net.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/app_config.dart';
import '../auth/token_storage.dart';
import 'decoder.dart';
import 'network_providers.dart';
import 'request_log_interceptor.dart';


/// The container built in `main()`, so GetX controllers — which have no `ref` — can reach
/// the same providers as the rest of the app.
///
/// A global, which is what the old code was criticised for. The difference is that this one
/// is a temporary adapter with a name that says so, rather than the architecture.
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

/// Configures the legacy client, once, with the same base URL as the new one.
///
/// The base URL used to be a literal in two files — `main.dart` and `ApiOptions.init()` —
/// and the second copy was dead code that still had to be kept in sync by hand. Both now
/// read [AppConfig].
void configureLegacyNetworking(String? token) {
  NetOptions.instance
      .setBaseUrl(AppConfig.apiBaseUrl)
      .setHttpDecoder(MyHttpDecoder.getInstance())
      .setConnectTimeout(AppConfig.connectTimeout)
      .enableLogger(false)
      .addInterceptor(RequestLogInterceptor())
      .create();

  // Must come after create(): it assigns a fresh BaseOptions, which would drop this.
  NetOptions.instance.dio.options.validateStatus = (status) => status != null;
  NetOptions.instance.dio.options.receiveTimeout = AppConfig.receiveTimeout;
  NetOptions.instance.dio.options.sendTimeout = AppConfig.sendTimeout;

  setLegacyToken(token);
}

/// Mirrors the credential onto the legacy client.
///
/// Written straight onto the live Dio rather than through `NetOptions.addHeaders().create()`:
/// `create()` re-applies the whole builder including `interceptors.addAll(...)`, so each
/// call appended another copy of every interceptor. Three copies were on the chain at one
/// point, and a single POST was logged three times — which was reported as three requests
/// before the duplication was found.
void setLegacyToken(String? token) {
  final headers = NetOptions.instance.dio.options.headers;
  if (token == null) {
    headers.remove('Authorization');
  } else {
    headers['Authorization'] = 'Bearer $token';
  }
}

/// Signs in: one write, both stacks.
Future<void> saveToken(String token) async {
  await tokenStorage.write(token);
  setLegacyToken(token);
}

/// Signs out. Clearing the header matters as much as clearing the store — the old logout
/// wrote the string "not logged in" as the token and left it on the client, so the next
/// request went out with `Authorization: Bearer not logged in`.
Future<void> clearToken() async {
  await tokenStorage.clear();
  setLegacyToken(null);
}
