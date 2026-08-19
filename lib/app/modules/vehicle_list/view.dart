import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/network/api_exception.dart';
import '../../theme/color_palette.dart';
import '../widgets/async_view.dart';
import '../widgets/toast.dart';
import '../widgets/vehicle_card_min.dart';
import 'providers.dart';

class VehicleListPage extends ConsumerWidget {
  const VehicleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehicleListProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => const _AddVehicleDialog(),
        ),
        splashColor: ColorPalette.bondyBlue,
        backgroundColor: ColorPalette.pacificBlue,
        child: const Icon(Icons.add, color: ColorPalette.white),
      ),
      body: Container(
        color: ColorPalette.aquaHaze,
        child: RefreshIndicator(
          onRefresh: () => ref.read(vehicleListProvider.notifier).refresh(),
          child: AsyncView(
            value: vehicles,
            onRetry: () => ref.invalidate(vehicleListProvider),
            emptyMessage: '暂无车辆',
            builder: (data) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) => VehicleMinCard(vehicle: data[index]),
            ),
          ),
        ),
      ),
    );
  }
}

/// The add-vehicle form.
///
/// Pulled out of the list screen's build method, where it lived as a 90-line closure inside
/// `showDialog`, reading and writing the list controller's own fields. Its draft state is
/// now its own provider, disposed with the dialog.
class _AddVehicleDialog extends ConsumerStatefulWidget {
  const _AddVehicleDialog();

  @override
  ConsumerState<_AddVehicleDialog> createState() => _AddVehicleDialogState();
}

class _AddVehicleDialogState extends ConsumerState<_AddVehicleDialog> {
  bool _submitting = false;

  Future<void> _submit() async {
    setState(() => _submitting = true);
    try {
      await ref.read(vehicleListProvider.notifier).add(ref.read(vehicleDraftProvider));
      if (!mounted) return;
      showTextToast('提交成功');
      Navigator.pop(context);
    } on ApiException catch (e) {
      // The old dialog's failure branch cleared the spinner and did nothing else, so a
      // rejected vehicle left the form open with no reason given. The server's message
      // reaches the user now.
      if (!mounted) return;
      setState(() => _submitting = false);
      showTextToast(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(vehicleDraftProvider);
    return AlertDialog(
      scrollable: true,
      title: const Text('添加车辆'),
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => ref
                    .read(vehicleDraftProvider.notifier)
                    .update((v) => v.copyWith(number: value)),
                decoration: const InputDecoration(
                  labelText: '车牌号',
                  icon: Icon(Icons.add_circle_rounded),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    '类型：',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      color: ColorPalette.nileBlue,
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    items: const ['货车', '卡车', '重卡']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    iconSize: 30,
                    underline: const SizedBox(),
                    value: draft.type,
                    onChanged: (value) => ref
                        .read(vehicleDraftProvider.notifier)
                        .update((v) => v.copyWith(type: value)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: _submitting ? null : () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        ElevatedButton(
          onPressed: _submitting ? null : _submit,
          child: _submitting
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text(
                  '确认',
                  style: TextStyle(fontSize: 15, fontFamily: 'Nunito'),
                ),
        ),
      ],
    );
  }
}
