import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/delivery_points.dart';
import '../../data/models/distribution.dart';
import '../../data/models/distribution_status.dart';
import '../../data/models/driver.dart';
import '../../data/models/vehicle.dart';
import '../../data/models/warehouse.dart';
import '../../data/network/api_exception.dart';
import '../../data/repositories/distribution_repository.dart';
import '../../data/repositories/warehouse_repository.dart';
import '../distribution_list/providers.dart';
import 'state.dart';

/// Raised when the form loads but there is nobody free to dispatch.
///
/// Its own type because it is not a request failure — the request succeeded and the answer
/// was "none". The old code detected it inside the controller and reacted by popping the
/// route and showing a toast, which is a screen's decision taken in a place that has no
/// screen; it reached the router through the global container to do it.
class NoFleetAvailable implements Exception {
  const NoFleetAvailable();
}

class ApplyFormNotifier extends AutoDisposeAsyncNotifier<ApplyFormState> {
  @override
  Future<ApplyFormState> build() async {
    // In parallel. The old version nested the warehouse request inside the availability
    // one and applied its result in a `then`, so `change(result, success)` could fire
    // before the warehouses arrived — the form was declared ready while its warehouse
    // dropdown was still the placeholder, and the draft's origin coordinates came from
    // whatever that placeholder held.
    final (available, warehouses) = await (
      ref.read(distributionRepositoryProvider).available(),
      ref.read(warehouseRepositoryProvider).list(),
    ).wait;

    final drivers = available.drivers ?? const <Driver>[];
    final vehicles = available.vehicles ?? const <Vehicle>[];
    if (drivers.isEmpty || vehicles.isEmpty) {
      // `available.drivers!.isEmpty` was the old check — a force unwrap on a field the
      // model declares nullable, one malformed response away from a crash inside a null
      // check.
      throw const NoFleetAvailable();
    }

    final now = DateTime.now();
    final warehouse = warehouses.isEmpty ? null : warehouses.first;
    return ApplyFormState(
      // No id: the server generates it, and sending an empty string made Hibernate treat
      // the payload as an existing row to update.
      draft: Distribution(
        urgent: false,
        status: 0,
        driver: drivers.first.name,
        did: drivers.first.id,
        vid: vehicles.first.id,
        number: vehicles.first.number,
        wid: warehouse?.name,
        fromLat: warehouse?.lat,
        fromLng: warehouse?.lng,
        time: _formatTime(now),
      ),
      drivers: drivers,
      vehicles: vehicles,
      warehouses: warehouses,
      selectedDriver: drivers.first,
      selectedVehicle: vehicles.first,
      selectedWarehouse: warehouse,
      dateTime: now,
    );
  }

  static String _formatTime(DateTime value) =>
      DateFormat('yyyy-MM-dd kk:mm:ss').format(value);

  /// Applies an edit to the loaded form.
  ///
  /// A no-op while the form is still loading or has failed, which is the honest reading of
  /// "the user changed a field on a form that is not on screen".
  void _edit(ApplyFormState Function(ApplyFormState) change) {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncValue.data(change(current));
  }

  void selectDriver(Driver driver) => _edit((s) => s.copyWith(
        selectedDriver: driver,
        draft: s.draft.copyWith(driver: driver.name, did: driver.id),
      ));

  void selectVehicle(Vehicle vehicle) => _edit((s) => s.copyWith(
        selectedVehicle: vehicle,
        draft: s.draft.copyWith(number: vehicle.number, vid: vehicle.id),
      ));

  void selectWarehouse(Warehouse warehouse) => _edit((s) => s.copyWith(
        selectedWarehouse: warehouse,
        // Name, not id: `wid` carries the warehouse name here, which is what the status
        // timeline renders.
        draft: s.draft.copyWith(
          wid: warehouse.name,
          fromLat: warehouse.lat,
          fromLng: warehouse.lng,
        ),
      ));

  /// The destination comes from [kDeliveryPoints], so its coordinates are known up front
  /// and no geocoding round-trip is needed.
  void selectDeliveryPoint(DeliveryPoint? point) => _edit((s) => s.copyWith(
        selectedDeliveryPoint: point,
        draft: s.draft.copyWith(
          address: point?.address,
          toLat: point?.lat,
          toLng: point?.lng,
        ),
      ));

  void setDateTime(DateTime value) => _edit((s) => s.copyWith(
        dateTime: value,
        draft: s.draft.copyWith(time: _formatTime(value)),
      ));

  void setCares(List<String> cares) => _edit((s) => s.copyWith(
        cares: cares,
        draft: s.draft.copyWith(care: cares.isEmpty ? '' : '${cares.join(',')},'),
      ));

  void setPhone(String phone) =>
      _edit((s) => s.copyWith(draft: s.draft.copyWith(phone: phone)));

  void setUrgent(bool urgent) =>
      _edit((s) => s.copyWith(draft: s.draft.copyWith(urgent: urgent)));

  /// Creates the order and opens its status timeline.
  ///
  /// Throws [ApiException] rather than returning false. The old `submitDis` returned a
  /// bool, and the view's failure branch could only clear a spinner — which is why a
  /// rejected order left the form open saying nothing.
  Future<void> submit() async {
    final current = state.valueOrNull;
    if (current == null) return;

    final repository = ref.read(distributionRepositoryProvider);
    final saved = await repository.save(current.draft);
    await repository.submitStatus(DistributionStatus(
      disId: saved.id,
      lat: saved.fromLat,
      lng: saved.fromLng,
      status: 0,
      location: saved.wid ?? current.selectedWarehouse?.name,
    ));
    ref.invalidate(distributionListProvider);
  }
}

final applyFormProvider =
    AsyncNotifierProvider.autoDispose<ApplyFormNotifier, ApplyFormState>(
        ApplyFormNotifier.new);
