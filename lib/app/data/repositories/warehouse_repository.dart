import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/inventory_vo.dart';
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
}

final warehouseRepositoryProvider = Provider<WarehouseRepository>((ref) {
  return WarehouseRepository(ref.watch(apiClientProvider));
});
