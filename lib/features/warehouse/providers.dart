import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/data/api/commodity_vo.dart';
import '../../app/data/api/inventory_movement_request.dart';
import '../../app/data/api/inventory_vo.dart';
import '../../app/data/api/warehouse_request.dart';
import '../../app/data/api/warehouse_vo.dart';
import '../../app/data/repositories/commodity_repository.dart';
import '../../app/data/repositories/warehouse_repository.dart';

/// The warehouse list.
class WarehouseListNotifier extends AsyncNotifier<List<WarehouseVo>> {
  @override
  Future<List<WarehouseVo>> build() =>
      ref.read(warehouseRepositoryProvider).list();

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(warehouseRepositoryProvider).list(),
    );
  }

  /// Adds a warehouse and reloads.
  ///
  /// Reloading is the point. The GetX controller this replaces fetched only in `onInit`, so
  /// 保存成功 appeared over a list that did not contain the row that had just been saved.
  Future<void> add(WarehouseRequest warehouse) async {
    await ref.read(warehouseRepositoryProvider).add(warehouse);
    await refresh();
  }
}

final warehouseListProvider =
    AsyncNotifierProvider<WarehouseListNotifier, List<WarehouseVo>>(
      WarehouseListNotifier.new,
    );

/// What one warehouse currently holds.
///
/// Keyed by warehouse id, which is the fix for a route that had been broken since the
/// screen was written: the id travelled as a GetX `arguments` on a nested navigator whose
/// key was never registered, and the page's constructor defaulted it to `''`. A family
/// provider makes the id part of the provider's identity — there is no path that reaches
/// this data without naming which warehouse it belongs to.
class InventoryNotifier extends FamilyAsyncNotifier<List<InventoryVo>, String> {
  @override
  Future<List<InventoryVo>> build(String warehouseId) =>
      ref.read(warehouseRepositoryProvider).inventoryOf(warehouseId);

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(warehouseRepositoryProvider).inventoryOf(arg),
    );
  }

  /// Records stock arriving or leaving, then reloads.
  ///
  /// Throws on failure rather than returning a bool. The caller needs to know why to tell
  /// the user anything useful — the dialog this replaces cleared its spinner and left the
  /// form open with no explanation.
  Future<void> move(
    InventoryMovementRequest movement, {
    required bool inbound,
  }) async {
    await ref
        .read(warehouseRepositoryProvider)
        .move(movement, inbound: inbound);
    await refresh();
  }
}

final inventoryProvider =
    AsyncNotifierProvider.family<InventoryNotifier, List<InventoryVo>, String>(
      InventoryNotifier.new,
    );

/// Every commodity, which is what an inbound movement can choose from.
///
/// Separate from [inventoryProvider] on purpose: receiving stock is not limited to what the
/// warehouse already holds, and a new warehouse holds nothing at all.
class CommodityListNotifier extends AsyncNotifier<List<CommodityVo>> {
  @override
  Future<List<CommodityVo>> build() =>
      ref.read(commodityRepositoryProvider).list();

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(commodityRepositoryProvider).list(),
    );
  }
}

final commodityListProvider =
    AsyncNotifierProvider<CommodityListNotifier, List<CommodityVo>>(
      CommodityListNotifier.new,
    );
