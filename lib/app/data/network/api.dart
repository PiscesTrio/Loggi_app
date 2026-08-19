import 'package:flutter/foundation.dart';

import '../api/commodity_chart_vo.dart';
import '../api/commodity_request.dart';
import '../api/commodity_vo.dart';
import '../api/inventory_movement_request.dart';
import '../api/inventory_vo.dart';
import '../api/login_dto.dart';
import '../api/login_vo.dart';
import '../api/page_vo_login_log_vo.dart';
import '../api/page_vo_system_log_vo.dart';
import '../api/warehouse_request.dart';
import '../api/warehouse_vo.dart';

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
  Future<List<WarehouseVo>?> requestGet4() =>
      _list('/warehouse', WarehouseVo.fromJson);

  Future<bool> saveWarehouse(WarehouseRequest data) => _write(
    () => _client.post<dynamic>('/warehouse', data: data.toJson()),
    '/warehouse',
  );

  Future<List<InventoryVo>?> getInventoryFromWarehouseId(String id) =>
      _list('/inventory/warehouse/$id', InventoryVo.fromJson);

  // ---- commodities -----------------------------------------------------------------
  Future<List<CommodityVo>?> getAllProducts() =>
      _list('/commodity', CommodityVo.fromJson);

  Future<bool> saveProduct(CommodityRequest data) => _write(
    () => _client.post<dynamic>('/commodity', data: data.toJson()),
    '/commodity',
  );

  /// The id moved into the path. It used to travel inside the body, which meant a caller
  /// chose which row an update applied to by editing a field - and a body without one
  /// updated nothing while answering 200.
  Future<bool> updateProduct(String id, CommodityRequest data) => _write(
    () => _client.put<dynamic>('/commodity/$id', data: data.toJson()),
    '/commodity/$id',
  );

  Future<bool> importAndExport(InventoryMovementRequest data, bool inOrOut) {
    final path = '/inventory/${inOrOut ? "in" : "out"}';
    return _write(() => _client.post<dynamic>(path, data: data.toJson()), path);
  }

  /// The direction is an enum name now, not a sign. It was `type=1` / `type=-1`, with the
  /// meaning of those numbers living in a private field of one backend service.
  Future<List<CommodityChartVo>?> getChartData(bool inOrOut) => _list(
    '/inventory/analyze',
    CommodityChartVo.fromJson,
    query: {'type': inOrOut ? 'IN' : 'OUT'},
  );

  // ---- auth and logs ---------------------------------------------------------------
  Future<LoginVo?> login(LoginDto data) => _one(
    () => _client.post<dynamic>('/admin/login/password', data: data.toJson()),
    '/admin/login/password',
    LoginVo.fromJson,
  );

  /// Both logs are paged. They grow by a row per login attempt and a row per audited
  /// request, so "all of them" stopped being an answer the server was willing to give.
  Future<PageVoLoginLogVo?> getLoginLog({int page = 0, int size = 20}) => _one(
    () =>
        _client.get<dynamic>('/loginlog', query: {'page': page, 'size': size}),
    '/loginlog',
    PageVoLoginLogVo.fromJson,
  );

  Future<PageVoSystemLogVo?> getSysLog({int page = 0, int size = 20}) => _one(
    () =>
        _client.get<dynamic>('/systemlog', query: {'page': page, 'size': size}),
    '/systemlog',
    PageVoSystemLogVo.fromJson,
  );
}
