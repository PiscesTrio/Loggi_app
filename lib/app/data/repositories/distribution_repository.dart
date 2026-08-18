import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/available.dart';
import '../models/distribution.dart';
import '../models/distribution_status.dart';
import '../network/api_client.dart';
import '../network/network_providers.dart';

/// Delivery orders and their status timeline.
class DistributionRepository {
  const DistributionRepository(this._client);

  final ApiClient _client;

  Future<List<Distribution>> list() async {
    final data = await _client.get<dynamic>('/distribution');
    return decodeList(data, Distribution.fromJson);
  }

  /// Creates or advances an order.
  ///
  /// The server generates the id, so a new order must not carry one — sending `id: ""`
  /// made Hibernate treat the payload as an existing row to update and fail with
  /// StaleObjectStateException. See `distribution_apply/providers.dart`.
  Future<Distribution> save(Distribution distribution) async {
    final data = await _client.post<dynamic>('/distribution',
        data: distribution.toJson());
    return decodeObject(data, Distribution.fromJson);
  }

  Future<Available> available() async {
    final data = await _client.get<dynamic>('/distribution/can');
    return decodeObject(data, Available.fromJson);
  }

  Future<List<DistributionStatus>> statusOf(String distributionId) async {
    final data = await _client.get<dynamic>('/distribution/status',
        query: {'dis': distributionId});
    return decodeList(data, DistributionStatus.fromJson);
  }

  Future<void> submitStatus(DistributionStatus status) =>
      _client.post<dynamic>('/distribution/status', data: status.toJson());
}

final distributionRepositoryProvider = Provider<DistributionRepository>((ref) {
  return DistributionRepository(ref.watch(apiClientProvider));
});
