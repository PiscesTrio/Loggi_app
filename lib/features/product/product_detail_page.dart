import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/data/api/commodity_request.dart';
import '../../app/data/api/commodity_vo.dart';
import '../../app/data/network/api_exception.dart';
import '../../app/theme/color_palette.dart';
import '../../app/theme/framed_box.dart';
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
  late final _price = TextEditingController(
    text: widget.product.price?.toString() ?? '',
  );
  late final _count = TextEditingController(
    text: widget.product.count?.toString() ?? '',
  );
  late final _description = TextEditingController(
    text: widget.product.description ?? '',
  );
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
      await ref
          .read(commodityRepositoryProvider)
          .update(
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
      // The page colour, painted across the whole page. The screens this replaces set
      // it on a Container that sized itself to its child, so it covered the table and
      // stopped — the rest of the area showed the shell's colour through, which is why
      // the old screenshots have a seam down the middle of the background.
      backgroundColor: ColorPalette.aquaHaze,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FramedBox(
              child: TextField(
                controller: _name,
                style: framedFieldTextStyle,
                cursorColor: ColorPalette.timberGreen,
                textInputAction: TextInputAction.next,
                decoration: framedFieldDecoration('名称'),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: FramedBox(
                    child: TextField(
                      controller: _price,
                      style: framedFieldTextStyle,
                      cursorColor: ColorPalette.timberGreen,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      decoration: framedFieldDecoration('价格'),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: FramedBox(
                    child: TextField(
                      controller: _count,
                      style: framedFieldTextStyle,
                      cursorColor: ColorPalette.timberGreen,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: framedFieldDecoration('数量'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Text(
                '创建时间： ${formatDateTime(widget.product.createAt)}',
                style: framedFieldTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Text(
                '上次更新时间：${formatDateTime(widget.product.updateAt)}',
                style: framedFieldTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            FramedBox(
              height: null,
              child: TextField(
                controller: _description,
                minLines: 5,
                maxLines: 7,
                style: framedFieldTextStyle,
                cursorColor: ColorPalette.timberGreen,
                decoration: framedFieldDecoration('Description'),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: FramedBox(
                    child: OutlinedButton(
                      onPressed: _submitting ? null : () => context.pop(),
                      child: const Text('取消'),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: FramedBox(
                    child: ElevatedButton(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
