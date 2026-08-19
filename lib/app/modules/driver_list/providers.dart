import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/api/driver_vo.dart';

import '../../data/repositories/fleet_repository.dart';

/// The driver list.
///
/// Replaces `DriverListController extends GetxController with StateMixin<List<DriverVo>>`,
/// and with it two things that were not merely verbose:
///
/// * `static DriverListController get to => Get.find()` — a global handle other modules
///   reached into, so `distribution_list` refreshed this list by calling
///   `DriverListController.to.updateData()`. That is a compile-time dependency on a runtime
///   registration: if the controller had not been created yet, the call threw. A provider
///   is refreshed with `ref.invalidate`, which needs no instance to exist.
/// * `change(result, status: RxStatus.success())` on a `result` that was null whenever the
///   request failed — success and failure produced the same screen.
class DriverListNotifier extends AsyncNotifier<List<DriverVo>> {
  @override
  Future<List<DriverVo>> build() => ref.read(fleetRepositoryProvider).drivers();

  /// Re-fetches, leaving the current list on screen until the new one arrives.
  Future<void> refresh() async {
    state = await AsyncValue.guard(() => ref.read(fleetRepositoryProvider).drivers());
  }
}

final driverListProvider =
    AsyncNotifierProvider<DriverListNotifier, List<DriverVo>>(DriverListNotifier.new);
