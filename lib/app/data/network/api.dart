import 'package:flutter/foundation.dart';

import '../models/index.dart';
import '../models/inventory_record.dart';
import '../models/login_log.dart';
import '../models/syslog.dart';
import 'api_client.dart';
import 'api_exception.dart';
import 'container_access.dart';
import 'network_providers.dart';

/// The endpoints, on the app's own Dio client.
///
/// The nineteen methods keep the signatures they had, so the forty call sites did not
/// change. What changed is underneath: `flutter_nb_net`'s global `NetOptions.instance`
/// singleton is gone, and with it the reason none of this could be tested — a global that
/// nothing can replace cannot be given a fake server.
///
/// The package had to go for a second reason, found while trying to add freezed: every
/// version of it requires `freezed_annotation ^2.x`, the modern freezed line requires
/// `^3.x`, and the 2.x line no longer resolves on this Dart SDK at all (it wants an
/// `analyzer` that depends on a `_macros` package the SDK has removed). So the dependency
/// was not merely legacy, it was blocking the next slice.
///
/// The failure contract is deliberately unchanged: a failed call still returns `null` or
/// `false`. That is a real defect — a caller cannot tell "no results" from "the server
/// refused you", which is why several screens still render `A error occurred: null` — but
/// fixing it means changing what every one of those call sites does with the answer, and
/// that belongs with the state-management rewrite. This slice swaps the client and nothing
/// else, so the screens can be compared before and after.
class NbRequest {
  ApiClient get _client => appContainer.read(apiClientProvider);

  /// Logs what actually went wrong.
  ///
  /// The old code printed `msg` too — but `msg` was whatever flutter_nb_net had put there,
  /// which for a non-2xx was Dio's English boilerplate and for a business error was null,
  /// because the decoder read a key the backend has never sent. This prints what the
  /// server said.
  void _report(String path, ApiException e) {
    debugPrint('$path failed: ${e.statusCode ?? '-'} ${e.message}');
  }

  Future<List<T>?> _list<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? query,
  }) async {
    // Returned after the try rather than inside it: `T` is unbounded, so the analyzer
    // cannot rule out a `T` that is itself a Future, and returning one from inside a try
    // means the catch never sees its failure.
    final List<T> result;
    try {
      final data = await _client.get<dynamic>(path, query: query);
      result = decodeList(data, fromJson);
    } on ApiException catch (e) {
      _report(path, e);
      return null;
    }
    return result;
  }

  Future<T?> _one<T>(
    Future<dynamic> Function() call,
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final T result;
    try {
      final data = await call();
      result = decodeObject(data, fromJson);
    } on ApiException catch (e) {
      _report(path, e);
      return null;
    }
    return result;
  }

  Future<bool> _write(Future<dynamic> Function() call, String path) async {
    try {
      await call();
      return true;
    } on ApiException catch (e) {
      _report(path, e);
      return false;
    }
  }

  // ---- warehouses ------------------------------------------------------------------
  Future<List<Warehouse>?> requestGet4() => _list('/warehouse', Warehouse.fromJson);

  Future<bool> saveWarehouse(Warehouse data) =>
      _write(() => _client.post<dynamic>('/warehouse', data: data.toJson()), '/warehouse');

  Future<List<Inventory>?> getInventoryFromWarehouseId(String id) =>
      _list('/inventory/warehouse/$id', Inventory.fromJson);

  // ---- commodities -----------------------------------------------------------------
  Future<List<Product>?> getAllProducts() => _list('/commodity', Product.fromJson);

  Future<bool> saveProduct(Product data) =>
      _write(() => _client.post<dynamic>('/commodity', data: data.toJson()), '/commodity');

  Future<bool> updateProduct(Product data) =>
      _write(() => _client.put<dynamic>('/commodity', data: data.toJson()), '/commodity');

  Future<bool> importAndExport(InventoryRecord data, bool inOrOut) {
    final path = '/inventory/${inOrOut ? "in" : "out"}';
    return _write(() => _client.post<dynamic>(path, data: data.toJson()), path);
  }

  Future<List<CommdityVo>?> getChartData(bool inOrOut) => _list(
        '/inventory/analyze',
        CommdityVo.fromJson,
        query: {'type': inOrOut ? 1 : -1},
      );

  // ---- distribution ----------------------------------------------------------------
  Future<List<Distribution>?> getDistribution() =>
      _list('/distribution', Distribution.fromJson);

  Future<Distribution?> updateDistribution(Distribution data) => _one(
        () => _client.post<dynamic>('/distribution', data: data.toJson()),
        '/distribution',
        Distribution.fromJson,
      );

  Future<Available?> findAvailable() => _one(
        () => _client.get<dynamic>('/distribution/can'),
        '/distribution/can',
        Available.fromJson,
      );

  Future<List<DistributionStatus>?> getStatus(String disId) => _list(
        '/distribution/status',
        DistributionStatus.fromJson,
        query: {'dis': disId},
      );

  Future<bool> submitStatus(DistributionStatus data) => _write(
        () => _client.post<dynamic>('/distribution/status', data: data.toJson()),
        '/distribution/status',
      );

  // ---- fleet -----------------------------------------------------------------------
  Future<List<Vehicle>?> getVehicles() => _list('/vehicle', Vehicle.fromJson);

  Future<bool> saveVehicle(Vehicle data) =>
      _write(() => _client.post<dynamic>('/vehicle', data: data.toJson()), '/vehicle');

  Future<List<Driver>?> getDrivers() => _list('/driver', Driver.fromJson);

  // ---- auth and logs ---------------------------------------------------------------
  Future<LoginResp?> login(LoginDto data) => _one(
        // Was "/admin/login?type=password". The backend split that one endpoint in two:
        // the `type` string had no @RequestParam, so a caller who omitted it reached
        // type.equals("email") on a null, and the NPE was reported as a wrong password.
        () => _client.post<dynamic>('/admin/login/password', data: data.toJson()),
        '/admin/login/password',
        LoginResp.fromJson,
      );

  Future<List<LoginLog>?> getLoginLog() => _list('/loginlog', LoginLog.fromJson);

  Future<List<SysLog>?> getSysLog() => _list('/systemlog', SysLog.fromJson);
}
