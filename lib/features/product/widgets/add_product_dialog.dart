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
      showTextToast('请填写商品名');
      return;
    }

    setState(() => _submitting = true);
    try {
      await ref.read(commodityRepositoryProvider).add(CommodityRequest(
            name: _name.text,
            price: num.tryParse(_price.text) ?? 0,
          ));
      ref.invalidate(commodityListProvider);
      if (!mounted) return;
      showTextToast('添加成功');
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
      title: const Text('添加商品'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(labelText: '商品名'),
          ),
          TextFormField(
            controller: _price,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
            decoration: const InputDecoration(labelText: '单价'),
          ),
        ],
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
