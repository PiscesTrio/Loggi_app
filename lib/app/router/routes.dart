/// Every path in the app, written once.
///
/// The shape mirrors the screens: two of the four tabs have their own tab bar inside them,
/// so their paths have two levels. That is not decoration — it is what decides whether a
/// pushed page covers the tab's header and inner tabs or renders below them, because a
/// route is pushed onto the navigator of the branch it belongs to.
class Routes {
  const Routes._();

  static const String login = '/login';

  // ---- Tab 0: 基础管理 — inner tabs 商品管理 / 仓库管理 -----------------------------
  static const String baseProducts = '/base/products';
  static const String baseWarehouses = '/base/warehouses';

  /// Relative to [baseProducts]; renders inside the 商品管理 tab.
  static const String segmentProductDetail = 'detail';

  /// Relative to [baseWarehouses]; renders inside the 仓库管理 tab.
  static const String segmentWarehouseInventory = ':id';

  // ---- Tab 1: 运输管理 — inner tabs 配送 / 车辆 / 驾驶员 ---------------------------
  static const String transportDistribution = '/transport/distribution';
  static const String transportVehicles = '/transport/vehicles';
  static const String transportDrivers = '/transport/drivers';

  /// Relative to [transportDistribution]; renders inside the 配送管理 tab.
  static const String segmentDistributionApply = 'apply';

  /// A sibling of the inner tab bar rather than a child of one, so it covers the whole
  /// transport tab the way it always did — it paints its own scrim, and dimming only the
  /// content area while the header stayed bright would look like a mistake.
  static const String distributionStatus = '/transport/status';

  // ---- Tab 2 / Tab 3 -------------------------------------------------------------
  static const String chart = '/chart';
  static const String settings = '/settings';

  /// Relative to [settings]. These cover the whole settings tab, which is what they did
  /// before: their navigator was the tab itself, not a region inside it.
  static const String segmentOperationLog = 'operation-log';
  static const String segmentLoginLog = 'login-log';

  // ---- Absolute forms, for callers that push ---------------------------------------
  static const String productDetail = '$baseProducts/$segmentProductDetail';
  static const String warehouseInventory = baseWarehouses;
  static const String distributionApply =
      '$transportDistribution/$segmentDistributionApply';
  static const String operationLog = '$settings/$segmentOperationLog';
  static const String loginLog = '$settings/$segmentLoginLog';
}
