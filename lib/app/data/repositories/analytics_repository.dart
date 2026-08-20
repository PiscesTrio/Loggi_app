import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/commodity_chart_vo.dart';
import '../network/api_client.dart';
import '../network/network_providers.dart';

/// Which direction the chart is summarising.
///
/// A type rather than a bool. The call was `getChartData(true)` / `getChartData(false)`, and
/// which way round that went was written down nowhere — the parameter was named `inOrOut`.
enum MovementDirection {
  inbound('IN', '入库'),
  outbound('OUT', '出库');

  const MovementDirection(this.wireValue, this.label);

  /// What the API expects. It was `type=1` / `type=-1` until S09, with the meaning of those
  /// numbers living in a private field of one backend service.
  final String wireValue;
  final String label;
}

class AnalyticsRepository {
  const AnalyticsRepository(this._client);

  final ApiClient _client;

  Future<List<CommodityChartVo>> movementsBy(
    MovementDirection direction,
  ) async {
    final data = await _client.get<dynamic>(
      '/inventory/analyze',
      query: {'type': direction.wireValue},
    );
    return decodeList(data, CommodityChartVo.fromJson);
  }
}

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  return AnalyticsRepository(ref.watch(apiClientProvider));
});
