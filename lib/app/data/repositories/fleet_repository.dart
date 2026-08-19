import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/driver.dart';
import '../models/vehicle.dart';
import '../network/api_client.dart';
import '../network/network_providers.dart';

/// Drivers and vehicles.
///
/// Calls [ApiClient] directly rather than going through `NbRequest`, and that is the
/// point: `NbRequest` folds every failure into `null`, and the controllers then did
/// `change(result, status: RxStatus.success())` — reporting **success with no data** for a
/// request that failed. A list that is empty because the server refused and a list that is
/// empty because there are no drivers rendered identically.
///
/// Here a failure is an [ApiException] and reaches the notifier as an error state.
class FleetRepository {
  const FleetRepository(this._client);

  final ApiClient _client;

  Future<List<Driver>> drivers() async {
    final data = await _client.get<dynamic>('/driver');
    return decodeList(data, Driver.fromJson);
  }

  Future<List<Vehicle>> vehicles() async {
    final data = await _client.get<dynamic>('/vehicle');
    return decodeList(data, Vehicle.fromJson);
  }

  Future<void> addVehicle(Vehicle vehicle) =>
      _client.post<dynamic>('/vehicle', data: vehicle.toJson());
}

final fleetRepositoryProvider = Provider<FleetRepository>((ref) {
  return FleetRepository(ref.watch(apiClientProvider));
});
