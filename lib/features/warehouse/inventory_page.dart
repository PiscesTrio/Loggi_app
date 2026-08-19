import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/data/api/inventory_vo.dart';
import '../../app/modules/widgets/async_view.dart';
import '../../app/theme/color_palette.dart';
import 'providers.dart';
import 'widgets/inventory_record_dialog.dart';

/// How the table is ordered.
///
/// Sorting used to happen by calling `.sort` on the controller's list in place, from inside
/// the view's `onSort`. Two things wrong with that: the widget was reordering the model, and
/// an in-place sort of the list an Rx already holds reports no change to anything comparing
/// old with new. The order is a value here, and the sorted list is derived from it.
class _Order {
  const _Order(this.column, {required this.ascending});

  final int column;
  final bool ascending;

  List<InventoryVo> apply(List<InventoryVo> rows) {
    // A copy. The list came from the provider and sorting it in place would reorder what
    // everything else is holding.
    final sorted = [...rows];
    sorted.sort(
      (a, b) =>
          column == 0 ? _compare(a.name, b.name) : _compare(a.count, b.count),
    );
    return sorted;
  }

  // Every field on a generated model is nullable, so one row without a count is enough to
  // throw out of a tap on a column header. Missing values sort last.
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

/// What one warehouse holds, and the two ways to change it.
class InventoryPage extends ConsumerWidget {
  const InventoryPage({super.key, required this.warehouseId});

  /// Comes from the route path. It used to arrive as a GetX `arguments` on a nested
  /// navigator whose key was never registered, with the constructor defaulting it to `''`
  /// — so this screen had never once been opened with the id it was written to take.
  final String warehouseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(inventoryProvider(warehouseId));

    return Scaffold(
      // The page colour, painted across the whole page. The screens this replaces set
      // it on a Container that sized itself to its child, so it covered the table and
      // stopped — the rest of the area showed the shell's colour through, which is why
      // the old screenshots have a seam down the middle of the background.
      backgroundColor: ColorPalette.aquaHaze,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        splashColor: ColorPalette.bondyBlue,
        backgroundColor: ColorPalette.pacificBlue,
        child: const Icon(Icons.arrow_back, color: ColorPalette.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _DirectionButton(
                direction: InventoryDirection.inbound,
                warehouseId: warehouseId,
              ),
              _DirectionButton(
                direction: InventoryDirection.outbound,
                warehouseId: warehouseId,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: AsyncView(
              value: inventory,
              onRetry: () =>
                  ref.read(inventoryProvider(warehouseId).notifier).refresh(),
              builder: (rows) => _InventoryTable(rows: rows),
            ),
          ),
        ],
      ),
    );
  }
}

class _DirectionButton extends ConsumerWidget {
  const _DirectionButton({required this.direction, required this.warehouseId});

  final InventoryDirection direction;
  final String warehouseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Elevated, as both of these were. An outlined button is a different affordance and
    // these are the screen's two primary actions.
    return ElevatedButton(
      onPressed: () => _open(context, ref),
      child: Text(direction.label),
    );
  }

  /// Inbound picks from every commodity, outbound from what this warehouse holds.
  ///
  /// Both lists are read once, here, rather than watched by the dialog — a dialog that
  /// rebuilt on the list refreshing would rebuild while the user was typing into it.
  Future<void> _open(BuildContext context, WidgetRef ref) async {
    final List<InventoryOption> options;
    if (direction.isInbound) {
      final commodities = await ref.read(commodityListProvider.future);
      options = [
        for (final c in commodities)
          if (c.id != null)
            InventoryOption(commodityId: c.id!, name: c.name ?? '-'),
      ];
    } else {
      final stock = await ref.read(inventoryProvider(warehouseId).future);
      options = [
        for (final row in stock)
          if (row.commodityId != null)
            InventoryOption(
              commodityId: row.commodityId!,
              name: row.name ?? '-',
            ),
      ];
    }
    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      builder: (_) => InventoryRecordDialog(
        direction: direction,
        warehouseId: warehouseId,
        options: options,
      ),
    );
  }
}

class _InventoryTable extends ConsumerWidget {
  const _InventoryTable({required this.rows});

  final List<InventoryVo> rows;

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
          sortColumnIndex: order?.column,
          sortAscending: order?.ascending ?? true,
          columns: [
            DataColumn(label: const Text('名称'), onSort: sort),
            DataColumn(label: const Text('数量'), onSort: sort),
          ],
          rows: [
            for (final row in order?.apply(rows) ?? rows)
              DataRow(
                cells: [
                  DataCell(Text(row.name ?? '-')),
                  DataCell(_CountChip(count: row.count)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _CountChip extends StatelessWidget {
  const _CountChip({required this.count});

  final int? count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(32, 108, 190, 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          '${count ?? 0}',
          maxLines: 1,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            color: ColorPalette.white,
          ),
        ),
      ),
    );
  }
}
