import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/driver_vo.dart';
import '../api/vehicle_request.dart';
import '../api/vehicle_vo.dart';

import '../network/api_client.dart';
import '../network/network_providers.dart';

class FleetRepository {
  const FleetRepository(this._client);

  final ApiClient _client;

  Future<List<DriverVo>> drivers() async {
    final data = await _client.get<dynamic>('/driver');
    return decodeList(data, DriverVo.fromJson);
  }

  Future<List<VehicleVo>> vehicles() async {
    final data = await _client.get<dynamic>('/vehicle');
    return decodeList(data, VehicleVo.fromJson);
  }

  /// Adds a vehicle.
  ///
  /// Takes a request type rather than the vehicle itself. The API distinguishes the two
  /// now: a [VehicleVo] has an id and timestamps the server owns, and sending them back
  /// was how a create could be mistaken for an update.
  Future<void> addVehicle(VehicleRequest vehicle) =>
      _client.post<dynamic>('/vehicle', data: vehicle.toJson());
}

final fleetRepositoryProvider = Provider<FleetRepository>((ref) {
  return FleetRepository(ref.watch(apiClientProvider));
});
