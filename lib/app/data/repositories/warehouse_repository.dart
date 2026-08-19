import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/inventory.dart';
import '../models/warehouse.dart';
import '../network/api_client.dart';
import '../network/network_providers.dart';

class WarehouseRepository {
  const WarehouseRepository(this._client);

  final ApiClient _client;

  Future<List<Warehouse>> list() async {
    final data = await _client.get<dynamic>('/warehouse');
    return decodeList(data, Warehouse.fromJson);
  }

  Future<List<Inventory>> inventoryOf(String warehouseId) async {
    final data = await _client.get<dynamic>('/inventory/warehouse/$warehouseId');
    return decodeList(data, Inventory.fromJson);
  }
}

final warehouseRepositoryProvider = Provider<WarehouseRepository>((ref) {
  return WarehouseRepository(ref.watch(apiClientProvider));
});
