import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/data/api/commodity_request.dart';
import '../../app/data/api/commodity_vo.dart';
import '../../app/data/network/api_exception.dart';
import '../../app/data/repositories/commodity_repository.dart';
import '../../app/modules/widgets/toast.dart';
import '../../app/utils/date_display.dart';
import '../warehouse/providers.dart';

/// Edits one commodity.
///
/// The screen this replaces assigned onto the commodity the list had handed it —
/// `product.name = value` — so typing here changed the row behind the screen whether or not
/// 确认 was ever pressed, and 取消 changed nothing back. The generated model is immutable,
/// which makes that impossible rather than merely discouraged: what is being edited is a
/// draft, and what leaves is a [CommodityRequest], a different type with no id and no
/// timestamps to disagree with the server about.
class ProductDetailPage extends ConsumerStatefulWidget {
  const ProductDetailPage({super.key, required this.product});

  final CommodityVo product;

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  late final _name = TextEditingController(text: widget.product.name ?? '');
  late final _price =
      TextEditingController(text: widget.product.price?.toString() ?? '');
  late final _count =
      TextEditingController(text: widget.product.count?.toString() ?? '');
  late final _description =
      TextEditingController(text: widget.product.description ?? '');
  bool _submitting = false;

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    _count.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final id = widget.product.id;
    if (id == null) {
      showTextToast('这条商品没有 id，无法保存');
      return;
    }
    if (_name.text.isEmpty) {
      showTextToast('请填写名称');
      return;
    }

    setState(() => _submitting = true);
    try {
      await ref.read(commodityRepositoryProvider).update(
            id,
            CommodityRequest(
              name: _name.text,
              price: num.tryParse(_price.text) ?? 0,
              description: _description.text,
              count: int.tryParse(_count.text) ?? 0,
            ),
          );
      // Invalidating the list is how this page tells the table it is stale. It used to call
      // `ProducttableminpageController.to.updateData()` — one screen reaching into another
      // screen's controller by a global lookup, which works right up until that controller
      // is not currently registered.
      ref.invalidate(commodityListProvider);
      if (!mounted) return;
      showTextToast('提交成功');
      context.pop();
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      showTextToast(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(hintText: '名称'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _price,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    decoration: const InputDecoration(hintText: '价格'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _count,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(hintText: '数量'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('创建时间： ${formatDateTime(widget.product.createAt)}'),
            const SizedBox(height: 4),
            Text('上次更新时间：${formatDateTime(widget.product.updateAt)}'),
            const SizedBox(height: 16),
            TextField(
              controller: _description,
              minLines: 5,
              maxLines: 7,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _submitting ? null : () => context.pop(),
                    child: const Text('取消'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: _submitting ? null : _submit,
                    child: _submitting
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('确认'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
