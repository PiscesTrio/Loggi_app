import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/commodity_request.dart';
import '../api/commodity_vo.dart';

import '../network/api_client.dart';
import '../network/network_providers.dart';

class CommodityRepository {
  const CommodityRepository(this._client);

  final ApiClient _client;

  Future<List<CommodityVo>> list() async {
    final data = await _client.get<dynamic>('/commodity');
    return decodeList(data, CommodityVo.fromJson);
  }

  Future<void> add(CommodityRequest commodity) =>
      _client.post<dynamic>('/commodity', data: commodity.toJson());

  /// Updates one commodity, named by id in the path.
  ///
  /// The id used to travel inside the body, which meant a caller chose which row an update
  /// applied to by editing a field — and a body without one updated nothing while answering
  /// 200.
  Future<void> update(String id, CommodityRequest commodity) =>
      _client.put<dynamic>('/commodity/$id', data: commodity.toJson());
}

final commodityRepositoryProvider = Provider<CommodityRepository>((ref) {
  return CommodityRepository(ref.watch(apiClientProvider));
});
