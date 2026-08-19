import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/delivery_points.dart';
import '../../data/models/distribution.dart';
import '../../data/models/driver.dart';
import '../../data/models/vehicle.dart';
import '../../data/models/warehouse.dart';

part 'state.freezed.dart';

/// Everything the apply form is holding at once.
///
/// The controller this replaces kept seven separate `Rx` fields beside a
/// `StateMixin<Available>` — the draft order, the selected driver, vehicle, warehouse and
/// delivery point, the date, the cares list, and the warehouse list. Seven observables
/// that are only ever meaningful together: selecting a driver has to change both
/// `selectedDriver` (so the dropdown shows it) and two fields of the draft (so the request
/// carries it), and nothing made those two writes one event.
///
/// One value, replaced as a whole.
@freezed
abstract class ApplyFormState with _$ApplyFormState {
  const factory ApplyFormState({
    required Distribution draft,
    required List<Driver> drivers,
    required List<Vehicle> vehicles,
    required List<Warehouse> warehouses,
    Driver? selectedDriver,
    Vehicle? selectedVehicle,
    Warehouse? selectedWarehouse,
    DeliveryPoint? selectedDeliveryPoint,
    required DateTime dateTime,
    @Default(<String>[]) List<String> cares,
  }) = _ApplyFormState;
}
