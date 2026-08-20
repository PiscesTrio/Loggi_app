import '../../../l10n/l10n.dart';
import '../../errors/error_messages.dart';

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
      showTextToast(context.l10n.validationWarehouseNameRequired);
      return;
    }
    if (_location.text.isEmpty) {
      showTextToast(context.l10n.validationLocationRequired);
      return;
    }

    setState(() => _submitting = true);
    try {
      await ref
          .read(warehouseListProvider.notifier)
          .add(
            WarehouseRequest(
              name: _name.text,
              principle: _principle.text,
              location: _location.text,
            ),
          );
      if (!mounted) return;
      showTextToast(context.l10n.savedOk);
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      showTextToast(apiErrorMessage(context, e));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.addWarehouseTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                labelText: context.l10n.fieldWarehouseName,
                icon: Icon(Icons.warehouse),
              ),
            ),
            TextFormField(
              controller: _principle,
              decoration: InputDecoration(
                labelText: context.l10n.fieldPrinciple,
                icon: Icon(Icons.account_circle),
              ),
            ),
            TextFormField(
              controller: _location,
              decoration: InputDecoration(
                labelText: context.l10n.fieldLocation,
                icon: Icon(Icons.place),
              ),
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: _submitting ? null : () => Navigator.of(context).pop(),
          child: Text(context.l10n.actionCancel),
        ),
        ElevatedButton(
          onPressed: _submitting ? null : _submit,
          child: _submitting
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(context.l10n.actionConfirm),
        ),
      ],
    );
  }
}
