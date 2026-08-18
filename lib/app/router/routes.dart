/// Every path in the app, written once.
///
/// Replaces `app_routes.dart`, which was a flat list of thirteen paths with no structure —
/// `/op`, `/loginlog`, `/transport` were all siblings even though two of them only ever
/// appeared inside the settings tab. A path that says where it lives is the difference
/// between a deep link that works and one that lands on a screen with no way back.
class Routes {
  const Routes._();

  static const String login = '/login';

  /// Tab 0. Also the shell's landing location.
  static const String base = '/base';
  static const String baseProductDetail = 'product';
  static const String baseWarehouseInventory = 'warehouse';

  /// Tab 1.
  static const String transport = '/transport';
  static const String transportDistributionStatus = 'status';
  static const String transportDistributionApply = 'apply';

  /// Tab 2.
  static const String chart = '/chart';

  /// Tab 3.
  static const String settings = '/settings';
  static const String settingsOperationLog = 'operation-log';
  static const String settingsLoginLog = 'login-log';

  // Absolute forms, for callers that push rather than declare.
  static const String productDetail = '$base/$baseProductDetail';
  static const String warehouseInventory = '$base/$baseWarehouseInventory';
  static const String distributionStatus = '$transport/$transportDistributionStatus';
  static const String distributionApply = '$transport/$transportDistributionApply';
  static const String operationLog = '$settings/$settingsOperationLog';
  static const String loginLog = '$settings/$settingsLoginLog';
}
