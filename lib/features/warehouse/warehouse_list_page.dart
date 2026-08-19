import '../../l10n/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/modules/widgets/async_view.dart';
import '../../app/modules/widgets/warehouse_card.dart';
import '../../app/theme/color_palette.dart';
import 'providers.dart';
import 'widgets/add_warehouse_dialog.dart';

/// The warehouses.
class WarehouseListPage extends ConsumerWidget {
  const WarehouseListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final warehouses = ref.watch(warehouseListProvider);

    return Scaffold(
      // The page colour, painted across the whole page. The screens this replaces set
      // it on a Container that sized itself to its child, so it covered the table and
      // stopped — the rest of the area showed the shell's colour through, which is why
      // the old screenshots have a seam down the middle of the background.
      backgroundColor: ColorPalette.aquaHaze,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => const AddWarehouseDialog(),
        ),
        splashColor: ColorPalette.bondyBlue,
        backgroundColor: ColorPalette.pacificBlue,
        child: const Icon(Icons.add, color: ColorPalette.white),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(warehouseListProvider.notifier).refresh(),
        child: AsyncView(
          value: warehouses,
          onRetry: () => ref.read(warehouseListProvider.notifier).refresh(),
          emptyMessage: context.l10n.emptyWarehouses,
          builder: (rows) => ListView.builder(
            itemCount: rows.length,
            itemBuilder: (context, index) =>
                WarehouseCard(warehouse: rows[index], iconIndex: index),
          ),
        ),
      ),
    );
  }
}
