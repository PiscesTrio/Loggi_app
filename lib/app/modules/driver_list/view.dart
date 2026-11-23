import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggi_app/app/modules/widgets/driver_card.dart';

import '../../../features/errors/error_messages.dart';
import '../../../features/fleet/fleet_labels.dart';
import '../../data/api/driver_request.dart';
import '../../data/network/api_exception.dart';
import '../../theme/color_palette.dart';
import '../widgets/async_view.dart';
import '../widgets/toast.dart';
import 'providers.dart';

/// The driver list.
///
/// `controller.obx(...)` took one builder — the success case — and rendered nothing
/// meaningful for the other two. Since a failed request arrived as `success` with a null
/// list, "failed" and "empty" looked the same, and the only hint either had happened was a
/// `debugPrint` nobody sees on a device.
class DriverListPage extends ConsumerWidget {
  const DriverListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drivers = ref.watch(driverListProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => const _AddDriverDialog(),
        ),
        splashColor: ColorPalette.bondyBlue,
        backgroundColor: ColorPalette.pacificBlue,
        child: const Icon(Icons.add, color: ColorPalette.white),
      ),
      body: Container(
        color: ColorPalette.aquaHaze,
        child: RefreshIndicator(
          onRefresh: () => ref.read(driverListProvider.notifier).refresh(),
          child: AsyncView(
            value: drivers,
            onRetry: () => ref.invalidate(driverListProvider),
            emptyMessage: context.l10n.emptyDrivers,
            builder: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  DriverCard(driver: data[index], imageIndex: index),
            ),
          ),
        ),
      ),
    );
  }
}

/// The register-driver form. Built the same way as the add-vehicle dialog beside it.
///
/// The delivery form cannot be submitted without a driver, and until this dialog existed the
/// app had no way to create one: the list was read-only, so a fresh install could file no
/// order at all until someone inserted a row by hand.
class _AddDriverDialog extends ConsumerStatefulWidget {
  const _AddDriverDialog();

  @override
  ConsumerState<_AddDriverDialog> createState() => _AddDriverDialogState();
}

class _AddDriverDialogState extends ConsumerState<_AddDriverDialog> {
  bool _submitting = false;

  void _edit(DriverRequest Function(DriverRequest) change) =>
      ref.read(driverDraftProvider.notifier).update(change);

  Future<void> _submit() async {
    // The two fields the server requires, checked here so the reader is told which one is
    // missing rather than the single sentence VALIDATION_FAILED maps to.
    final draft = ref.read(driverDraftProvider);
    if (draft.name.trim().isEmpty) {
      showTextToast(context.l10n.validationNameRequired);
      return;
    }
    if (draft.phone.trim().isEmpty) {
      showTextToast(context.l10n.validationPhoneRequired);
      return;
    }
    setState(() => _submitting = true);
    try {
      await ref.read(driverListProvider.notifier).add(draft);
      if (!mounted) return;
      showTextToast(context.l10n.submittedOk);
      Navigator.pop(context);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      showTextToast(apiErrorMessage(context, e));
    }
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(driverDraftProvider);
    return AlertDialog(
      scrollable: true,
      title: Text(context.l10n.driverAddTitle),
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => _edit((d) => d.copyWith(name: value)),
                decoration: InputDecoration(
                  labelText: context.l10n.fieldName,
                  icon: const Icon(Icons.person),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (value) => _edit((d) => d.copyWith(phone: value)),
                decoration: InputDecoration(
                  labelText: context.l10n.driverPhone,
                  icon: const Icon(Icons.phone),
                ),
              ),
              TextFormField(
                onChanged: (value) => _edit((d) => d.copyWith(license: value)),
                decoration: InputDecoration(
                  labelText: context.l10n.fieldLicence,
                  icon: const Icon(Icons.badge),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    context.l10n.fieldGender,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      color: ColorPalette.nileBlue,
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<DriverRequestGenderEnum>(
                    items: DriverRequestGenderEnum.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(genderLabel(context, e.value)),
                          ),
                        )
                        .toList(),
                    hint: const Text('-'),
                    iconSize: 30,
                    underline: const SizedBox(),
                    value: draft.gender,
                    onChanged: (value) =>
                        _edit((d) => d.copyWith(gender: value ?? d.gender)),
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
          child: Text(context.l10n.actionCancel),
        ),
        ElevatedButton(
          onPressed: _submitting ? null : _submit,
          child: _submitting
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(
                  context.l10n.actionConfirm,
                  style: const TextStyle(fontSize: 15, fontFamily: 'Nunito'),
                ),
        ),
      ],
    );
  }
}
