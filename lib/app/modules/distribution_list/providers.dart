import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/distribution.dart';
import '../../data/repositories/distribution_repository.dart';
import '../driver_list/providers.dart';
import '../vehicle_list/providers.dart';

/// The delivery orders.
class DistributionListNotifier extends AsyncNotifier<List<Distribution>> {
  @override
  Future<List<Distribution>> build() =>
      ref.read(distributionRepositoryProvider).list();

  Future<void> refresh() async {
    state =
        await AsyncValue.guard(() => ref.read(distributionRepositoryProvider).list());
  }

  /// Advances an order, then refreshes everything the change touched.
  ///
  /// Approving an order takes a driver and a truck; completing it releases them. So the
  /// two fleet lists are stale the moment this succeeds — which the old code knew, and
  /// handled by reaching through globals:
  ///
  /// ```dart
  /// VehicleListController.to.updateData();
  /// DriverListController.to.updateData();
  /// ```
  ///
  /// `.to` is `Get.find()`: a compile-time dependency on a runtime registration. If the
  /// user had not yet opened the 车辆管理 tab, no controller existed and the call threw.
  /// `ref.invalidate` needs no instance — it marks the provider stale, and it is rebuilt
  /// if and when something is watching it.
  Future<void> advance(Distribution distribution) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(distributionRepositoryProvider).save(distribution);
      ref.invalidate(vehicleListProvider);
      ref.invalidate(driverListProvider);
      return ref.read(distributionRepositoryProvider).list();
    });
  }
}

final distributionListProvider =
    AsyncNotifierProvider<DistributionListNotifier, List<Distribution>>(
        DistributionListNotifier.new);
