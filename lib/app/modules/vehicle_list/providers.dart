import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/vehicle.dart';
import '../../data/repositories/fleet_repository.dart';

/// The vehicle list. See `driver_list/providers.dart` for what this replaces.
class VehicleListNotifier extends AsyncNotifier<List<Vehicle>> {
  @override
  Future<List<Vehicle>> build() => ref.read(fleetRepositoryProvider).vehicles();

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => ref.read(fleetRepositoryProvider).vehicles());
  }

  /// Adds a vehicle and reloads.
  ///
  /// Throws on failure rather than returning false. The caller needs to know *why* to tell
  /// the user anything useful, and a bool cannot carry it — which is why the old dialog's
  /// failure branch did nothing but clear a spinner, leaving the form open with no
  /// explanation.
  Future<void> add(Vehicle vehicle) async {
    await ref.read(fleetRepositoryProvider).addVehicle(vehicle);
    await refresh();
  }
}

final vehicleListProvider =
    AsyncNotifierProvider<VehicleListNotifier, List<Vehicle>>(VehicleListNotifier.new);

/// The vehicle being typed into the add-vehicle dialog.
///
/// Scoped to the dialog rather than living on the list's controller, where it used to sit
/// next to the list itself — two unrelated pieces of state in one object, so a rebuild of
/// either touched both.
final vehicleDraftProvider =
    StateProvider.autoDispose<Vehicle>((ref) => const Vehicle(type: '货车'));
