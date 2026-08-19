import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/data/api/commodity_chart_vo.dart';
import '../../app/modules/widgets/async_view.dart';
import '../../app/modules/widgets/indicator.dart';
import '../../app/modules/widgets/pie_chart_sample2.dart';
import '../../app/theme/color_palette.dart';
import '../../l10n/l10n.dart';
import '../shell/page_header.dart';
import 'providers.dart';

const _sliceColours = [
  ColorPalette.contentColorBlue,
  ColorPalette.contentColorYellow,
  ColorPalette.contentColorOrange,
  ColorPalette.contentColorGreen,
  ColorPalette.contentColorPurple,
  ColorPalette.contentColorPink,
  ColorPalette.contentColorRed,
  ColorPalette.contentColorCyan,
];

/// What moved in and what moved out.
class ChartPage extends ConsumerWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final series = ref.watch(movementSeriesProvider);

    return Scaffold(
      backgroundColor: ColorPalette.pacificBlue,
      body: SafeArea(
        child: ColoredBox(
          color: ColorPalette.aquaHaze,
          child: Column(
            children: [
              PageHeader(title: context.l10n.navChart),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () =>
                      ref.read(movementSeriesProvider.notifier).refresh(),
                  child: AsyncView(
                    value: series,
                    onRetry: () =>
                        ref.read(movementSeriesProvider.notifier).refresh(),
                    builder: (data) => Center(
                      // 360 wide, as this content has always been. The pie is an
                      // AspectRatio(1.3), so its height follows the width it is given —
                      // letting it span the full screen makes the box half again as tall and
                      // pushes the legend and the second chart down with it.
                      child: SizedBox(
                        width: 360,
                        child: ListView(
                          children: [
                            _Section(title: '入库', rows: data.inbound),
                            _Section(title: '出库', rows: data.outbound),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One pie and its legend.
///
/// Written once. The page it replaces had the whole thing twice, differing in the title and
/// which key of a map it looked up.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.rows});

  final String title;
  final List<CommodityChartVo> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Divider(height: 2),
        const SizedBox(height: 20),
        Center(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        PieChartSample2(data: rows),
        for (final (index, row) in rows.indexed)
          Indicator(
            // No `!` on either field. Every field of a generated model is nullable, and one
            // record without a name replaced the whole legend with an ErrorWidget while the
            // pie above it drew fine.
            value: row.value ?? 0,
            color: _sliceColours[index % _sliceColours.length],
            text: row.name ?? '未命名',
            isSquare: true,
          ),
      ],
    );
  }
}
