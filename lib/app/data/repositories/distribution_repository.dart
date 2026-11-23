import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/available_fleet_vo.dart';
import '../api/distribution_request.dart';
import '../api/distribution_status_change.dart';
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

  /// Moves an existing order to [status]: approving it, or marking it delivered.
  ///
  /// This used to be [save] with the next status filled in. A create carries no id, so the
  /// server filed a second order with the new status and the one on screen stayed under
  /// review — every approval doubled the list and approved nothing. The order is named in
  /// the path now, and the server refuses a move its state machine does not allow with
  /// `INVALID_STATUS_TRANSITION`.
  Future<DistributionVo> changeStatus(
    String id,
    DistributionStatusChangeStatusEnum status,
  ) async {
    final data = await _client.patch<dynamic>(
      '/distribution/${Uri.encodeComponent(id)}/status',
      data: DistributionStatusChange(status: status).toJson(),
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
