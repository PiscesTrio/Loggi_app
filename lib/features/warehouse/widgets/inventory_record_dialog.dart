import '../../../l10n/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/data/api/inventory_movement_request.dart';
import '../../../app/data/network/api_exception.dart';
import '../../../app/modules/widgets/toast.dart';
import '../../../app/theme/color_palette.dart';
import '../providers.dart';

/// Which way the stock is going.
enum InventoryDirection {
  inbound('入库'),
  outbound('出库');

  const InventoryDirection(this.label);

  final String label;

  bool get isInbound => this == InventoryDirection.inbound;
}

/// One commodity the dialog can record a movement against.
///
/// Inbound chooses from every commodity, outbound from the rows this warehouse already
/// holds — two different types on the wire, and the dialog needs the same two things from
/// both: an id to send and a name to show. Naming that here is what lets one dialog serve
/// both directions instead of two near-identical copies.
class InventoryOption {
  const InventoryOption({required this.commodityId, required this.name});

  final String commodityId;
  final String name;

  @override
  bool operator ==(Object other) =>
      other is InventoryOption && other.commodityId == commodityId;

  @override
  int get hashCode => commodityId.hashCode;
}

/// Records stock arriving or leaving a warehouse.
///
/// This replaces two inline `showDialog` bodies of roughly 370 lines each, sitting in the
/// same file, differing only in which four things they named: the draft, the selection, the
/// option list and the submit method. The layout was written twice and had drifted — one
/// copy had a null-check the other lacked. There is one copy now, and the four differences
/// are arguments.
class InventoryRecordDialog extends ConsumerStatefulWidget {
  const InventoryRecordDialog({
    super.key,
    required this.direction,
    required this.warehouseId,
    required this.options,
  });

  final InventoryDirection direction;
  final String warehouseId;
  final List<InventoryOption> options;

  @override
  ConsumerState<InventoryRecordDialog> createState() =>
      _InventoryRecordDialogState();
}

class _InventoryRecordDialogState extends ConsumerState<InventoryRecordDialog> {
  InventoryOption? _selected;
  int _count = 0;
  String _description = '';
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    // Seeded from the list rather than left for onChanged to fill in. A dropdown renders
    // its first item without firing onChanged, so a selection that only exists once the
    // user changes it means the form looks filled and submits an empty commodity id.
    _selected = widget.options.isEmpty ? null : widget.options.first;
  }

  Future<void> _submit() async {
    final selected = _selected;
    if (selected == null) {
      showTextToast(context.l10n.validationCommodityRequired);
      return;
    }
    if (_count <= 0) {
      showTextToast(context.l10n.validationQuantityRequired);
      return;
    }

    setState(() => _submitting = true);
    try {
      await ref
          .read(inventoryProvider(widget.warehouseId).notifier)
          .move(
            InventoryMovementRequest(
              warehouseId: widget.warehouseId,
              commodityId: selected.commodityId,
              name: selected.name,
              count: _count,
              description: _description.isEmpty ? null : _description,
            ),
            inbound: widget.direction.isInbound,
          );
      if (!mounted) return;
      showTextToast(context.l10n.submittedOk);
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      // The message, not a cleared spinner. Both copies of the old dialog ended their
      // failure branch by turning the spinner off and leaving the form exactly as it was,
      // so a rejected movement was indistinguishable from a slow one.
      if (!mounted) return;
      setState(() => _submitting = false);
      showTextToast(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPalette.aquaHaze,
      title: Text('${widget.direction.label}登记'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CommodityField(
              options: widget.options,
              selected: _selected,
              onChanged: (value) => setState(() => _selected = value),
            ),
            const SizedBox(height: 16),
            TextFormField(
              // A quantity field, so a quantity keypad — and a formatter behind it, because
              // the keyboard is only a suggestion and a Japanese IME on a text keyboard
              // hands Flutter composing text and full-width digits that int.tryParse
              // rejects.
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: context.l10n.fieldQuantity,
              ),
              onChanged: (value) => _count = int.tryParse(value) ?? 0,
            ),
            const SizedBox(height: 16),
            TextFormField(
              minLines: 2,
              maxLines: 4,
              decoration: InputDecoration(labelText: context.l10n.fieldNote),
              onChanged: (value) => _description = value,
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

/// The commodity picker, or an explanation of why there is nothing to pick.
///
/// An outbound dialog on a warehouse holding nothing has no options, and that is an
/// ordinary state — a warehouse created a minute ago is in it. The screen this replaces
/// took `.first` of the empty list and turned the whole inventory view into
/// "A error occurred: null".
class _CommodityField extends StatelessWidget {
  const _CommodityField({
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<InventoryOption> options;
  final InventoryOption? selected;
  final ValueChanged<InventoryOption?> onChanged;

  @override
  Widget build(BuildContext context) {
    if (options.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(context.l10n.emptyStockForOutbound),
      );
    }
    return DropdownButtonFormField<InventoryOption>(
      initialValue: selected,
      isExpanded: true,
      decoration: InputDecoration(labelText: context.l10n.fieldSelectCommodity),
      items: [
        for (final option in options)
          DropdownMenuItem(value: option, child: Text(option.name)),
      ],
      onChanged: onChanged,
    );
  }
}
