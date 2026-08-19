import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/inventory_movement_request.dart';
import '../api/inventory_vo.dart';
import '../api/warehouse_request.dart';
import '../api/warehouse_vo.dart';

import '../network/api_client.dart';
import '../network/network_providers.dart';

class WarehouseRepository {
  const WarehouseRepository(this._client);

  final ApiClient _client;

  Future<List<WarehouseVo>> list() async {
    final data = await _client.get<dynamic>('/warehouse');
    return decodeList(data, WarehouseVo.fromJson);
  }

  Future<List<InventoryVo>> inventoryOf(String warehouseId) async {
    final data = await _client.get<dynamic>('/inventory/warehouse/$warehouseId');
    return decodeList(data, InventoryVo.fromJson);
  }

  /// Adds a warehouse.
  ///
  /// A [WarehouseRequest], not a [WarehouseVo]: a request has no id and no timestamps, which
  /// are the server's to assign.
  Future<void> add(WarehouseRequest warehouse) =>
      _client.post<dynamic>('/warehouse', data: warehouse.toJson());

  /// Records stock arriving or leaving.
  ///
  /// One method for both directions because the request body is identical — only the path
  /// differs. The direction used to be a `type` field carrying 1 or -1, with the meaning of
  /// those numbers living in a private field of one backend service.
  Future<void> move(InventoryMovementRequest movement, {required bool inbound}) =>
      _client.post<dynamic>('/inventory/${inbound ? 'in' : 'out'}',
          data: movement.toJson());
}

final warehouseRepositoryProvider = Provider<WarehouseRepository>((ref) {
  return WarehouseRepository(ref.watch(apiClientProvider));
});
