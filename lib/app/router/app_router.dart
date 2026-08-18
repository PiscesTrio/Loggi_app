import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_provider.dart';
import '../data/models/distribution.dart';
import '../modules/base_mangement_page/base_mangement_page_binding.dart';
import '../modules/base_mangement_page/base_mangement_page_view.dart';
import '../modules/chart/bindings.dart';
import '../modules/chart/view.dart';
import '../modules/distribution_apply/bindings.dart';
import '../modules/distribution_apply/view.dart';
import '../modules/distribution_list/bindings.dart';
import '../modules/distribution_status/bindings.dart';
import '../modules/distribution_status/view.dart';
import '../modules/driver_list/bindings.dart';
import '../modules/login/bindings.dart';
import '../modules/login/view.dart';
import '../modules/login_log/bindings.dart';
import '../modules/login_log/view.dart';
import '../modules/operate_log/bindings.dart';
import '../modules/operate_log/view.dart';
import '../modules/ProductDetailMin/bindings.dart';
import '../modules/ProductDetailMin/view.dart';
import '../modules/ProductTableMinPage/bindings.dart';
import '../modules/system_setting/bindings.dart';
import '../modules/system_setting/view.dart';
import '../modules/transport_management_page/bindings.dart';
import '../modules/transport_management_page/view.dart';
import '../modules/vehicle_list/bindings.dart';
import '../modules/WarehouseInventory/bindings.dart';
import '../modules/WarehouseInventory/view.dart';
import '../modules/WarehouseListMin/bindings.dart';
import 'routes.dart';
import 'shell_scaffold.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _baseKey = GlobalKey<NavigatorState>(debugLabel: 'base');
final _transportKey = GlobalKey<NavigatorState>(debugLabel: 'transport');
final _chartKey = GlobalKey<NavigatorState>(debugLabel: 'chart');
final _settingsKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

/// Registers a screen's dependencies before building it.
///
/// The screens are still `GetView<SomeController>` and still resolve their controller
/// through `Get.find`, so something has to have run the binding. `GetPage(binding:)` used
/// to; go_router has no equivalent, because it does not own a DI container.
///
/// A list rather than one binding, because a screen that hosts inner tabs owns their
/// dependencies too — see the `/base` and `/transport` routes below.
///
/// This is the seam between the two systems, and it is why navigation could be replaced
/// without also rewriting thirty-seven controllers: the screens do not know the difference.
/// It disappears module by module as each one moves to Riverpod.
Widget _withBindings(List<Bindings> bindings, Widget Function() page) {
  for (final binding in bindings) {
    binding.dependencies();
  }
  return page();
}

/// The router.
///
/// Replaces `app_pages.dart` plus three hand-written `onGenerateRoute` switches. A route
/// used to exist in two places — the flat `AppPages.routes` list and whichever tab's switch
/// actually reached it — and only the switch knew which tab it belonged to. Here the tree
/// says it: a path's position is its place in the UI.
///
/// It also removes the placeholder arguments that flat list needed to satisfy constructors.
/// `AppPages` contained `DistributionStatusPage(argument: Distribution())`,
/// `WarehouseinventoryPage(warehouseId: '')` and `ProductdetailminPage(arguments: {})` —
/// entries that compiled, were reachable by name, and would have rendered an empty screen,
/// because the real values only ever arrived through `Get.toNamed(arguments:)` from the
/// nested navigators. Path parameters and `extra` carry them now, and a route with no
/// argument does not build.
final routerProvider = Provider<GoRouter>((ref) {
  // GoRouter listens to this rather than to Riverpod, so a sign-in or a 401 re-runs
  // `redirect` immediately instead of at the next navigation.
  final refresh = ValueNotifier<AuthState>(ref.read(authProvider));
  ref.onDispose(refresh.dispose);
  ref.listen<AuthState>(authProvider, (_, next) => refresh.value = next);

  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: Routes.base,
    refreshListenable: refresh,
    redirect: (context, state) {
      final auth = ref.read(authProvider);

      // Before the keystore has been read the answer is not "signed out", it is "not known
      // yet". Redirecting on a guess is what produced a login screen flashing past on
      // startup for a user who was already signed in.
      if (!auth.isResolved) {
        return null;
      }

      final atLogin = state.matchedLocation == Routes.login;
      if (!auth.isSignedIn) {
        return atLogin ? null : Routes.login;
      }
      return atLogin ? Routes.base : null;
    },
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (_, _) => _withBindings([LoginBinding()], () => LoginPage()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => HomeShellScaffold(shell: shell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _baseKey,
            routes: [
              GoRoute(
                path: Routes.base,
                // The inner tabs are part of this screen, not routes of their own, so their
                // controllers are this route's to register. They used to be registered by
                // the `GetPageRoute(binding:)` of the hand-written nested Navigator that
                // hosted them; removing the Navigator removed that too, and the tab rendered
                // a red "controller not found" box. Found on the device — neither the
                // analyzer nor a unit test can see a dependency resolved by type at runtime.
                builder: (_, _) => _withBindings(
                  [
                    BaseManagementPageBinding(),
                    ProducttableminpageBinding(),
                    WarehouselistminBinding(),
                  ],
                  () => BaseManagementPageView(),
                ),
                routes: [
                  GoRoute(
                    path: Routes.baseProductDetail,
                    builder: (_, state) => _withBindings(
                      [ProductdetailminBinding()],
                      () => ProductdetailminPage(
                          arguments: state.extra as Map<String, dynamic>),
                    ),
                  ),
                  GoRoute(
                    // A path parameter, not `extra`: a warehouse id is part of the address
                    // of what is being shown, so this location survives a restart and can
                    // be linked to. `extra` cannot — it is dropped on a cold start.
                    path: '${Routes.baseWarehouseInventory}/:id',
                    builder: (_, state) => _withBindings(
                      [WarehouseinventoryBinding()],
                      () => WarehouseinventoryPage(
                          warehouseId: state.pathParameters['id']!),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _transportKey,
            routes: [
              GoRoute(
                path: Routes.transport,
                builder: (_, _) => _withBindings(
                  [
                    TransportManagementPageBinding(),
                    DistributionListBinding(),
                    VehicleListBinding(),
                    DriverListBinding(),
                  ],
                  () => TransportManagementPagePage(),
                ),
                routes: [
                  GoRoute(
                    // `extra`, because this screen needs a whole Distribution the caller
                    // already holds, and re-fetching it by id would be a second request for
                    // data that is already on screen.
                    path: Routes.transportDistributionStatus,
                    builder: (_, state) => _withBindings(
                      [DistributionStatusBinding()],
                      () => DistributionStatusPage(
                          argument: state.extra as Distribution),
                    ),
                  ),
                  GoRoute(
                    path: Routes.transportDistributionApply,
                    builder: (_, _) => _withBindings(
                      [DistributionApplyBinding()],
                      () => DistributionApplyPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _chartKey,
            routes: [
              GoRoute(
                path: Routes.chart,
                builder: (_, _) =>
                    _withBindings([ChartBinding()], () => ChartPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsKey,
            routes: [
              GoRoute(
                path: Routes.settings,
                builder: (_, _) => _withBindings(
                    [SystemSettingBinding()], () => SystemSettingPage()),
                routes: [
                  GoRoute(
                    path: Routes.settingsOperationLog,
                    builder: (_, _) => _withBindings(
                        [OperateLogBinding()], () => OperateLogPage()),
                  ),
                  GoRoute(
                    path: Routes.settingsLoginLog,
                    builder: (_, _) => _withBindings(
                        [LoginLogBinding()], () => LoginLogPage()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
