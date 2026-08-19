import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/data/api/warehouse_request.dart';
import '../../../app/data/network/api_exception.dart';
import '../../../app/modules/widgets/toast.dart';
import '../providers.dart';

/// Adds a warehouse.
///
/// The dialog it replaces was written twice — once here and once in a demo module — and
/// both copies were wrong in the same way: they sent a `location` under a form that never
/// asked for one, because the field was required on the wire and absent from the UI. It is
/// asked for here, and the request is built by named argument rather than assembled as a
/// map, so a missing required field is a compile error instead of a 400.
class AddWarehouseDialog extends ConsumerStatefulWidget {
  const AddWarehouseDialog({super.key});

  @override
  ConsumerState<AddWarehouseDialog> createState() => _AddWarehouseDialogState();
}

class _AddWarehouseDialogState extends ConsumerState<AddWarehouseDialog> {
  final _name = TextEditingController();
  final _principle = TextEditingController();
  final _location = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _name.dispose();
    _principle.dispose();
    _location.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_name.text.isEmpty) {
      showTextToast('请填写仓库名');
      return;
    }
    if (_location.text.isEmpty) {
      showTextToast('请填写地址');
      return;
    }

    setState(() => _submitting = true);
    try {
      await ref.read(warehouseListProvider.notifier).add(WarehouseRequest(
            name: _name.text,
            principle: _principle.text,
            location: _location.text,
          ));
      if (!mounted) return;
      showTextToast('保存成功');
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      showTextToast(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加仓库'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                labelText: '仓库名',
                icon: Icon(Icons.warehouse),
              ),
            ),
            TextFormField(
              controller: _principle,
              decoration: const InputDecoration(
                labelText: '负责人',
                icon: Icon(Icons.account_circle),
              ),
            ),
            TextFormField(
              controller: _location,
              decoration: const InputDecoration(
                labelText: '地址',
                icon: Icon(Icons.place),
              ),
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: _submitting ? null : () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: _submitting ? null : _submit,
          child: _submitting
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('确认'),
        ),
      ],
    );
  }
}
