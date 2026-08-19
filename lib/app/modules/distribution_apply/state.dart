import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/api/distribution_request.dart';
import '../../data/api/driver_summary.dart';
import '../../data/api/vehicle_summary.dart';
import '../../data/api/warehouse_vo.dart';

import '../../data/delivery_points.dart';

part 'state.freezed.dart';

/// Everything the apply form is holding at once.
///
/// The controller this replaces kept seven separate `Rx` fields beside a
/// `StateMixin<Available>` — the draft order, the selected driver, vehicle, warehouse and
/// delivery point, the date, the cares list, and the warehouse list. Seven observables
/// that are only ever meaningful together: selecting a driver has to change both
/// `selectedDriver` (so the dropdown shows it) and the draft (so the request carries it),
/// and nothing made those two writes one event.
///
/// One value, replaced as a whole.
///
/// The draft is a [DistributionRequest] rather than an order. Since S10 those are
/// different types, and the difference is the point: a request names the driver, vehicle
/// and warehouse by id and has no id of its own, while an order carries an id the server
/// assigned and the rows it points at. This form is composing a request, so it holds one —
/// which also means the copied driver name and plate it used to maintain by hand are gone,
/// because a request never carried them.
///
/// Drivers and vehicles are summaries rather than whole rows, because that is what
/// `/distribution/can` answers with and all a dropdown needs: an id to send and a name to
/// show. Asking for the rest would be asking the server for a driver's address to render a
/// list of names.
@freezed
abstract class ApplyFormState with _$ApplyFormState {
  const factory ApplyFormState({
    required DistributionRequest draft,
    required List<DriverSummary> drivers,
    required List<VehicleSummary> vehicles,
    required List<WarehouseVo> warehouses,
    DriverSummary? selectedDriver,
    VehicleSummary? selectedVehicle,
    WarehouseVo? selectedWarehouse,
    DeliveryPoint? selectedDeliveryPoint,
    required DateTime dateTime,
    @Default(<String>[]) List<String> cares,
  }) = _ApplyFormState;
}
