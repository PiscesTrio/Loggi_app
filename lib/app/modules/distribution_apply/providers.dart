import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/distribution_request.dart';
import '../../data/api/distribution_track_request.dart';
import '../../data/api/driver_summary.dart';
import '../../data/api/vehicle_summary.dart';
import '../../data/api/warehouse_vo.dart';

import '../../data/delivery_points.dart';
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

    final drivers = available.drivers ?? const <DriverSummary>[];
    final vehicles = available.vehicles ?? const <VehicleSummary>[];
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
      // The copied driver name and plate are gone: a request names rows by id, and the
      // screen reads the name from the driver it selected. Keeping a second copy in the
      // draft was how the two drifted.
      draft: DistributionRequest(
        driverId: drivers.first.id ?? '',
        vehicleId: vehicles.first.id ?? '',
        warehouseId: warehouse?.id,
        phone: '',
        address: '',
        urgent: false,
        time: now,
        status: DistributionRequestStatusEnum.REVIEWING,
        fromLat: warehouse?.lat ?? 0,
        fromLng: warehouse?.lng ?? 0,
        toLat: 0,
        toLng: 0,
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

  /// Applies an edit to the loaded form.
  ///
  /// A no-op while the form is still loading or has failed, which is the honest reading of
  /// "the user changed a field on a form that is not on screen".
  void _edit(ApplyFormState Function(ApplyFormState) change) {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncValue.data(change(current));
  }

  void selectDriver(DriverSummary driver) => _edit(
    (s) => s.copyWith(
      selectedDriver: driver,
      draft: s.draft.copyWith(driverId: driver.id ?? ''),
    ),
  );

  void selectVehicle(VehicleSummary vehicle) => _edit(
    (s) => s.copyWith(
      selectedVehicle: vehicle,
      draft: s.draft.copyWith(vehicleId: vehicle.id ?? ''),
    ),
  );

  /// The origin is named by id now. It used to be the warehouse NAME, because the tracking
  /// timeline rendered that column verbatim - so a column called `wid` held a name, and the
  /// migration that turned it into a foreign key had to resolve every row by name to find
  /// out what it pointed at.
  void selectWarehouse(WarehouseVo warehouse) => _edit(
    (s) => s.copyWith(
      selectedWarehouse: warehouse,
      draft: s.draft.copyWith(
        warehouseId: warehouse.id,
        fromLat: warehouse.lat ?? 0,
        fromLng: warehouse.lng ?? 0,
      ),
    ),
  );

  /// The destination comes from [kDeliveryPoints], so its coordinates are known up front
  /// and no geocoding round-trip is needed.
  void selectDeliveryPoint(DeliveryPoint? point) => _edit(
    (s) => s.copyWith(
      selectedDeliveryPoint: point,
      draft: s.draft.copyWith(
        address: point?.address ?? '',
        toLat: point?.lat ?? 0,
        toLng: point?.lng ?? 0,
      ),
    ),
  );

  /// No formatting. The field is a DateTime on the wire since S09; the string the client
  /// used to build was a presentation decision being made in a request body.
  void setDateTime(DateTime value) => _edit(
    (s) => s.copyWith(
      dateTime: value,
      draft: s.draft.copyWith(time: value),
    ),
  );

  void setCares(List<DistributionRequestCareEnum> cares) => _edit(
    (s) => s.copyWith(
      cares: cares,
      // Was '${cares.join(',')},' — a comma-joined string with a trailing comma, which the
      // server stored verbatim in one column. The list is the list now; nothing serialises
      // it on the way out and nothing has to parse it on the way back.
      draft: s.draft.copyWith(care: cares.toSet()),
    ),
  );

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
    await repository.submitStatus(
      DistributionTrackRequest(
        distributionId: saved.id ?? '',
        lat: saved.fromLat ?? 0,
        lng: saved.fromLng ?? 0,
        status: DistributionTrackRequestStatusEnum.REVIEWING,
        // The warehouse name, which is what the timeline renders. It is read from the
        // association now rather than from a column that held a name.
        location: saved.warehouse?.name ?? current.selectedWarehouse?.name,
      ),
    );
    ref.invalidate(distributionListProvider);
  }
}

final applyFormProvider =
    AsyncNotifierProvider.autoDispose<ApplyFormNotifier, ApplyFormState>(
      ApplyFormNotifier.new,
    );
