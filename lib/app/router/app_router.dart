import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../features/product/product_detail_page.dart';
import '../../features/product/product_list_page.dart';
import '../../features/warehouse/inventory_page.dart';
import '../../features/warehouse/warehouse_list_page.dart';
import '../auth/auth_provider.dart';
import '../data/api/commodity_vo.dart';
import '../data/api/distribution_vo.dart';
import '../modules/base_mangement_page/base_mangement_page_binding.dart';
import '../modules/base_mangement_page/base_mangement_page_view.dart';
import '../modules/chart/bindings.dart';
import '../modules/chart/view.dart';
import '../modules/distribution_apply/view.dart';
import '../modules/distribution_list/view.dart';
import '../modules/distribution_status/view.dart';
import '../modules/driver_list/view.dart';
import '../modules/login/bindings.dart';
import '../modules/login/view.dart';
import '../modules/login_log/bindings.dart';
import '../modules/login_log/view.dart';
import '../modules/operate_log/bindings.dart';
import '../modules/operate_log/view.dart';
import '../modules/system_setting/bindings.dart';
import '../modules/system_setting/view.dart';
import '../modules/transport_management_page/bindings.dart';
import '../modules/transport_management_page/view.dart';
import '../modules/vehicle_list/view.dart';
import 'routes.dart';
import 'shell_scaffold.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

// Outer: one per bottom tab.
final _baseKey = GlobalKey<NavigatorState>(debugLabel: 'base');
final _transportKey = GlobalKey<NavigatorState>(debugLabel: 'transport');
final _chartKey = GlobalKey<NavigatorState>(debugLabel: 'chart');
final _settingsKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

// Inner: one per tab-inside-a-tab. These are the navigators that used to be written by
// hand as `Navigator(key: Get.nestedKey(4))` and so on.
final _productsKey = GlobalKey<NavigatorState>(debugLabel: 'products');
final _warehousesKey = GlobalKey<NavigatorState>(debugLabel: 'warehouses');
final _distributionKey = GlobalKey<NavigatorState>(debugLabel: 'distribution');
final _vehiclesKey = GlobalKey<NavigatorState>(debugLabel: 'vehicles');
final _driversKey = GlobalKey<NavigatorState>(debugLabel: 'drivers');

/// Registers a screen's dependencies before building it.
///
/// The screens are still `GetView<SomeController>` and still resolve their controller
/// through `Get.find`, so something has to have run the binding. `GetPage(binding:)` used
/// to; go_router has no equivalent, because it does not own a DI container.
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
/// Replaces `app_pages.dart` plus five hand-written `onGenerateRoute` switches keyed by
/// `Get.nestedKey(4)`, `(5)`, `(6)`, `(69)` and `(70)`. A route used to exist in two
/// places — the flat `AppPages.routes` list and whichever switch actually reached it — and
/// only the switch knew which navigator it belonged to.
///
/// **The nesting is not cosmetic.** Which navigator a page is pushed onto decides how much
/// of the screen it covers, and the five old navigators were not all at the same depth:
///
/// * `(4)`, `(5)`, `(6)` sat in the `Expanded` *below* a page's header and inner tab bar,
///   so 商品详情, 仓库库存 and 配送申请 rendered in the content area with the chrome above
///   them still visible.
/// * `(69)`, `(70)` *were* the tab's whole content, so 配送详情 and the two log screens
///   covered everything, header included.
///
/// A first attempt flattened all of them into children of the four outer branches. The
/// three in the first group came up with no header, no tabs, and their first row jammed
/// against the status bar. Two shells, nested the way the old navigators were, is what
/// keeps that distinction.
///
/// It also removes the placeholder arguments the flat list needed to satisfy constructors:
/// `DistributionStatusPage(argument: Distribution())`,
/// `WarehouseinventoryPage(warehouseId: '')` and `ProductdetailminPage(arguments: {})` —
/// entries that compiled, were reachable by name, and would have rendered an empty screen.
final routerProvider = Provider<GoRouter>((ref) {
  // GoRouter listens to this rather than to Riverpod, so a sign-in or a 401 re-runs
  // `redirect` immediately instead of at the next navigation.
  final refresh = ValueNotifier<AuthState>(ref.read(authProvider));
  ref.onDispose(refresh.dispose);
  ref.listen<AuthState>(authProvider, (_, next) => refresh.value = next);

  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: Routes.baseProducts,
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
      return atLogin ? Routes.baseProducts : null;
    },
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (_, _) => _withBindings([LoginBinding()], () => LoginPage()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => HomeShellScaffold(shell: shell),
        branches: [
          // ---- Tab 0: 基础管理 --------------------------------------------------
          StatefulShellBranch(
            navigatorKey: _baseKey,
            routes: [
              StatefulShellRoute.indexedStack(
                // This builder supplies the header and the 商品/仓库 tab bar; `inner` goes
                // where the old IndexedStack of two Navigators used to sit.
                builder: (_, _, inner) => _withBindings([
                  BaseManagementPageBinding(),
                ], () => BaseManagementPageView(shell: inner)),
                branches: [
                  StatefulShellBranch(
                    navigatorKey: _productsKey,
                    routes: [
                      GoRoute(
                        path: Routes.baseProducts,
                        builder: (_, _) => const ProductListPage(),
                        routes: [
                          GoRoute(
                            path: Routes.segmentProductDetail,
                            builder: (_, state) => ProductDetailPage(
                              product: state.extra as CommodityVo,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _warehousesKey,
                    routes: [
                      GoRoute(
                        path: Routes.baseWarehouses,
                        builder: (_, _) => const WarehouseListPage(),
                        routes: [
                          GoRoute(
                            // A path parameter, not `extra`: a warehouse id is part of the
                            // address of what is being shown, so this location survives a
                            // cold start. `extra` does not.
                            path: Routes.segmentWarehouseInventory,
                            builder: (_, state) => InventoryPage(
                              warehouseId: state.pathParameters['id']!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // ---- Tab 1: 运输管理 --------------------------------------------------
          StatefulShellBranch(
            navigatorKey: _transportKey,
            initialLocation: Routes.transportDistribution,
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (_, _, inner) => _withBindings([
                  TransportManagementPageBinding(),
                ], () => TransportManagementPagePage(shell: inner)),
                branches: [
                  StatefulShellBranch(
                    navigatorKey: _distributionKey,
                    routes: [
                      GoRoute(
                        path: Routes.transportDistribution,
                        // No binding: this screen and the two beside it read
                        // their state from providers now, so there is nothing to
                        // register before building them.
                        builder: (_, _) => const DistributionListPage(),
                        routes: [
                          GoRoute(
                            path: Routes.segmentDistributionApply,
                            // Slides up, as it did before S13. Filing an order is a task
                            // begun and finished on top of the list, not a place further in
                            // — go_router's default slide from the right says the opposite.
                            pageBuilder: (_, state) => CustomTransitionPage(
                              key: state.pageKey,
                              child: const DistributionApplyPage(),
                              transitionsBuilder: (_, animation, _, child) =>
                                  SlideTransition(
                                    position:
                                        Tween<Offset>(
                                          begin: const Offset(0, 1),
                                          end: Offset.zero,
                                        ).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOutCubic,
                                          ),
                                        ),
                                    child: child,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _vehiclesKey,
                    routes: [
                      GoRoute(
                        path: Routes.transportVehicles,
                        builder: (_, _) => const VehicleListPage(),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _driversKey,
                    routes: [
                      GoRoute(
                        path: Routes.transportDrivers,
                        builder: (_, _) => const DriverListPage(),
                      ),
                    ],
                  ),
                ],
              ),
              // A sibling of the inner shell, not a child of one: this page paints its own
              // scrim over the whole tab, which is what it did when it was pushed onto
              // Get.nestedKey(70). Dimming only the content area would leave a bright
              // header above a modal.
              GoRoute(
                path: Routes.distributionStatus,
                builder: (_, state) => DistributionStatusPage(
                  argument: state.extra as DistributionVo,
                ),
              ),
            ],
          ),
          // ---- Tab 2: 图表分析 --------------------------------------------------
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
          // ---- Tab 3: 系统设置 --------------------------------------------------
          StatefulShellBranch(
            navigatorKey: _settingsKey,
            routes: [
              GoRoute(
                path: Routes.settings,
                builder: (_, _) => _withBindings([
                  SystemSettingBinding(),
                ], () => SystemSettingPage()),
                routes: [
                  GoRoute(
                    path: Routes.segmentOperationLog,
                    builder: (_, _) => _withBindings([
                      OperateLogBinding(),
                    ], () => OperateLogPage()),
                  ),
                  GoRoute(
                    path: Routes.segmentLoginLog,
                    builder: (_, _) => _withBindings([
                      LoginLogBinding(),
                    ], () => LoginLogPage()),
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
