import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/available_fleet_vo.dart';
import '../api/distribution_request.dart';
import '../api/distribution_track_request.dart';
import '../api/distribution_track_vo.dart';
import '../api/distribution_vo.dart';

import '../network/api_client.dart';
import '../network/network_providers.dart';

class DistributionRepository {
  const DistributionRepository(this._client);

  final ApiClient _client;

  Future<List<DistributionVo>> list() async {
    final data = await _client.get<dynamic>('/distribution');
    return decodeList(data, DistributionVo.fromJson);
  }

  /// Files an order.
  ///
  /// The request names the driver, vehicle and warehouse by id and carries no id of its
  /// own. Sending one was what made this call fail for the life of the project: the server
  /// read a non-null id as an existing row to update and refused.
  Future<DistributionVo> save(DistributionRequest order) async {
    final data = await _client.post<dynamic>(
      '/distribution',
      data: order.toJson(),
    );
    return decodeObject(data, DistributionVo.fromJson);
  }

  Future<AvailableFleetVo> available() async {
    final data = await _client.get<dynamic>('/distribution/can');
    return decodeObject(data, AvailableFleetVo.fromJson);
  }

  Future<List<DistributionTrackVo>> statusOf(String distributionId) async {
    final data = await _client.get<dynamic>(
      '/distribution/status',
      query: {'dis': distributionId},
    );
    return decodeList(data, DistributionTrackVo.fromJson);
  }

  Future<void> submitStatus(DistributionTrackRequest status) =>
      _client.post<dynamic>('/distribution/status', data: status.toJson());
}

final distributionRepositoryProvider = Provider<DistributionRepository>((ref) {
  return DistributionRepository(ref.watch(apiClientProvider));
});
