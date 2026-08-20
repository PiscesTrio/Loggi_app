import '../../../l10n/l10n.dart';
import '../../errors/error_messages.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/data/api/commodity_request.dart';
import '../../../app/data/network/api_exception.dart';
import '../../../app/data/repositories/commodity_repository.dart';
import '../../../app/modules/widgets/toast.dart';
import '../../warehouse/providers.dart';

/// Adds a commodity.
class AddProductDialog extends ConsumerStatefulWidget {
  const AddProductDialog({super.key});

  @override
  ConsumerState<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends ConsumerState<AddProductDialog> {
  final _name = TextEditingController();
  final _price = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_name.text.isEmpty) {
      showTextToast(context.l10n.validationCommodityNameRequired);
      return;
    }

    setState(() => _submitting = true);
    try {
      await ref
          .read(commodityRepositoryProvider)
          .add(
            CommodityRequest(
              name: _name.text,
              price: num.tryParse(_price.text) ?? 0,
            ),
          );
      ref.invalidate(commodityListProvider);
      if (!mounted) return;
      showTextToast(context.l10n.addedOk);
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
      title: Text(context.l10n.addProductTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _name,
            decoration: InputDecoration(
              labelText: context.l10n.fieldCommodityName,
            ),
          ),
          TextFormField(
            controller: _price,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            decoration: InputDecoration(labelText: context.l10n.fieldUnitPrice),
          ),
        ],
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
