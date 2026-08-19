import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/data/api/commodity_chart_vo.dart';
import '../../app/data/repositories/analytics_repository.dart';

/// Both series the chart draws.
///
/// A type with two named fields, replacing a `Map<String, List<…>>` keyed by the literals
/// "in" and "out". The map made the screen's two questions — is this loaded, and which
/// series is this — into one lookup that could answer null for either reason, and the view
/// unwrapped it with `!` on every frame until the data arrived.
class MovementSeries {
  const MovementSeries({required this.inbound, required this.outbound});

  final List<CommodityChartVo> inbound;
  final List<CommodityChartVo> outbound;
}

class MovementSeriesNotifier extends AsyncNotifier<MovementSeries> {
  @override
  Future<MovementSeries> build() => _load();

  Future<void> refresh() async {
    state = await AsyncValue.guard(_load);
  }

  /// Both directions at once.
  ///
  /// They used to be chained: fetch inbound, then fetch outbound, then report success. The
  /// two requests have nothing to do with each other, so the second waited on the first for
  /// no reason — and an earlier version of that chain did not return the inner future at
  /// all, so it reported success while the outbound request was still in flight.
  Future<MovementSeries> _load() async {
    final repository = ref.read(analyticsRepositoryProvider);
    final results = await Future.wait([
      repository.movementsBy(MovementDirection.inbound),
      repository.movementsBy(MovementDirection.outbound),
    ]);
    return MovementSeries(inbound: results[0], outbound: results[1]);
  }
}

final movementSeriesProvider =
    AsyncNotifierProvider<MovementSeriesNotifier, MovementSeries>(
      MovementSeriesNotifier.new,
    );
