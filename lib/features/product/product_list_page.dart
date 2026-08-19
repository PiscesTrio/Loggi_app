import '../../app/theme/status_colors.dart';
import '../../l10n/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/data/api/commodity_vo.dart';
import '../../app/modules/widgets/async_view.dart';
import '../../app/router/routes.dart';
import '../../app/theme/color_palette.dart';
import '../warehouse/providers.dart';
import 'widgets/add_product_dialog.dart';

/// How the table is ordered. See `warehouse/inventory_page.dart` for why this is a value.
class _Order {
  const _Order(this.column, {required this.ascending});

  final int column;
  final bool ascending;

  List<CommodityVo> apply(List<CommodityVo> rows) {
    final sorted = [...rows];
    sorted.sort(
      (a, b) => switch (column) {
        1 => _compare(a.price, b.price),
        2 => _compare(a.count, b.count),
        _ => _compare(a.name, b.name),
      },
    );
    return sorted;
  }

  int _compare<T extends Comparable<Object>>(T? a, T? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return ascending ? a.compareTo(b) : b.compareTo(a);
  }
}

/// Null until a column header is tapped: the rows arrive in the server's order and
/// stay in it. The screens this replaces showed a sort arrow from the first frame
/// while having sorted nothing — the indicator described an order the list was not in.
final _orderProvider = StateProvider.autoDispose<_Order?>((ref) => null);

/// The commodities.
class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commodities = ref.watch(commodityListProvider);

    return Scaffold(
      // The page colour, painted across the whole page. The screens this replaces set
      // it on a Container that sized itself to its child, so it covered the table and
      // stopped — the rest of the area showed the shell's colour through, which is why
      // the old screenshots have a seam down the middle of the background.
      backgroundColor: ColorPalette.aquaHaze,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => const AddProductDialog(),
        ),
        splashColor: ColorPalette.bondyBlue,
        backgroundColor: ColorPalette.pacificBlue,
        tooltip: context.l10n.addProductTitle,
        child: const Icon(Icons.add, color: ColorPalette.white),
      ),
      body: AsyncView(
        value: commodities,
        onRetry: () => ref.read(commodityListProvider.notifier).refresh(),
        emptyMessage: context.l10n.emptyCommodities,
        builder: (rows) => _ProductTable(rows: rows),
      ),
    );
  }
}

class _ProductTable extends ConsumerWidget {
  const _ProductTable({required this.rows});

  final List<CommodityVo> rows;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(_orderProvider);
    void sort(int column, bool ascending) =>
        ref.read(_orderProvider.notifier).state = _Order(
          column,
          ascending: ascending,
        );

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topLeft,
        child: DataTable(
          showCheckboxColumn: false,
          sortColumnIndex: order?.column,
          sortAscending: order?.ascending ?? true,
          columns: [
            DataColumn(label: Text(context.l10n.fieldName), onSort: sort),
            DataColumn(label: Text(context.l10n.fieldPrice), onSort: sort),
            DataColumn(label: Text(context.l10n.fieldStock), onSort: sort),
          ],
          rows: [
            for (final row in order?.apply(rows) ?? rows)
              DataRow(
                onSelectChanged: (_) =>
                    context.push(Routes.productDetail, extra: row),
                cells: [
                  DataCell(Text(row.name ?? '-')),
                  DataCell(_Chip(text: '${row.price ?? 0}', accent: false)),
                  DataCell(_Chip(text: '${row.count ?? 0}', accent: true)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text, required this.accent});

  final String text;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Two pixels either side and no fixed height, which is what the cell this replaces
      // used — the chip is as wide as its number and no wider.
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: accent ? StatusColors.stockBadge : StatusColors.priceBadge,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        maxLines: 1,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 14,
          color: ColorPalette.white,
        ),
      ),
    );
  }
}
