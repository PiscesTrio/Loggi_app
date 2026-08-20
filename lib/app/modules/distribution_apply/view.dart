import '../../../features/distribution/care_tags.dart';
import '../../../features/errors/error_messages.dart';
import '../../../features/fleet/fleet_labels.dart';
import '../../data/api/distribution_request.dart';
import '../../../l10n/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loggi_app/app/data/delivery_points.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../data/network/api_exception.dart';
import '../../theme/color_palette.dart';
import '../../utils/date_time_extension.dart';
import '../widgets/async_view.dart';
import '../widgets/toast.dart';
import 'providers.dart';

class DistributionApplyPage extends ConsumerStatefulWidget {
  const DistributionApplyPage({super.key});

  @override
  ConsumerState<DistributionApplyPage> createState() =>
      _DistributionApplyPageState();
}

class _DistributionApplyPageState extends ConsumerState<DistributionApplyPage> {
  bool _submitting = false;

  ApplyFormNotifier get _form => ref.read(applyFormProvider.notifier);

  /// Creates the order.
  ///
  /// The handler this replaces called `submitDis()`, which returned a bool, and its
  /// failure branch was `_isLoading(false)` and nothing else — a rejected order left the
  /// form sitting there with no explanation. `submit()` throws, so there is something to
  /// say.
  Future<void> _submit() async {
    final draft = ref.read(applyFormProvider).valueOrNull?.draft;
    if (draft == null || draft.phone.isEmpty) {
      showTextToast(context.l10n.applyPhoneRequired);
      return;
    }
    if (draft.address.isEmpty) {
      showTextToast(context.l10n.applyAddressRequired);
      return;
    }

    setState(() => _submitting = true);
    try {
      await _form.submit();
      if (!mounted) return;
      showTextToast(context.l10n.submittedOk);
      context.pop();
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      showTextToast(apiErrorMessage(context, e));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AsyncView(
      value: ref.watch(applyFormProvider),
      onRetry: () => ref.invalidate(applyFormProvider),
      builder: (form) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          color: ColorPalette.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      context.l10n.applyDriver,
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 6,
                                          color: ColorPalette.nileBlue
                                              .withValues(alpha: 0.1),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 2.5,
                                    ),
                                    child: DropdownButton(
                                      iconSize: 30,
                                      underline: const SizedBox(),
                                      value: form.selectedDriver,
                                      onChanged: (newValue) {
                                        if (newValue != null) {
                                          _form.selectDriver(newValue);
                                        }
                                      },
                                      items: form.drivers.map((process) {
                                        return DropdownMenuItem(
                                          value: process,
                                          child: Text(
                                            process.name!,
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 16,
                                              color: ColorPalette.nileBlue
                                                  .withValues(alpha: 0.58),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      context.l10n.applyVehicle,
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 6,
                                          color: ColorPalette.nileBlue
                                              .withValues(alpha: 0.1),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 2.5,
                                    ),
                                    child: DropdownButton(
                                      iconSize: 30,
                                      underline: const SizedBox(),
                                      value: form.selectedVehicle,
                                      onChanged: (newValue) {
                                        if (newValue != null) {
                                          _form.selectVehicle(newValue);
                                        }
                                      },
                                      items: form.vehicles.map((process) {
                                        return DropdownMenuItem(
                                          value: process,
                                          child: Text(
                                            // Not "${process.type}". The generated enum's
                                            // toString() is the wire value, so interpolating
                                            // it compiles, analyses clean, and puts
                                            // LIGHT_TRUCK on screen.
                                            "${vehicleTypeLabel(context, process.type?.value)}：${process.number}",
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 16,
                                              color: ColorPalette.nileBlue
                                                  .withValues(alpha: 0.58),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      context.l10n.applyWarehouse,
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 6,
                                          color: ColorPalette.nileBlue
                                              .withValues(alpha: 0.1),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 2.5,
                                    ),
                                    child: DropdownButton(
                                      iconSize: 30,
                                      underline: const SizedBox(),
                                      value: form.selectedWarehouse,
                                      onChanged: (newValue) {
                                        if (newValue != null) {
                                          _form.selectWarehouse(newValue);
                                        }
                                      },
                                      items: form.warehouses.map((process) {
                                        return DropdownMenuItem(
                                          value: process,
                                          child: Text(
                                            "${process.name}",
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 16,
                                              color: ColorPalette.nileBlue
                                                  .withValues(alpha: 0.58),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final value = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2077, 10),
                                        currentDate: DateTime.now(),
                                        locale: const Locale("zh"),
                                      );
                                      // The old code did `value!.year` inside a `then`:
                                      // dismissing the picker returns null, so cancelling
                                      // threw instead of doing nothing.
                                      if (value == null) return;
                                      _form.setDateTime(
                                        form.dateTime.copyWith(
                                          year: value.year,
                                          month: value.month,
                                          day: value.day,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 160,
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 3),
                                            blurRadius: 6,
                                            color: ColorPalette.nileBlue
                                                .withValues(alpha: 0.1),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(
                                            Icons.edit_calendar,
                                            color: ColorPalette.nileBlue,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            DateFormat("yyyy-MM-dd")
                                                .format(form.dateTime),
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () async {
                                      final value = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        cancelText: context.l10n.actionCancel,
                                        helpText: context.l10n.applyTimePicker,
                                        confirmText: context.l10n.actionConfirm,
                                      );
                                      // Same as the date picker above: `value!.hour`
                                      // threw when the user cancelled.
                                      if (value == null) return;
                                      _form.setDateTime(
                                        form.dateTime.copyWith(
                                          hour: value.hour,
                                          minute: value.minute,
                                          second: 0,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 3),
                                            blurRadius: 6,
                                            color: ColorPalette.nileBlue
                                                .withValues(alpha: 0.1),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Icon(
                                            Icons.timer,
                                            color: ColorPalette.nileBlue,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            DateFormat("kk:mm:ss")
                                                .format(form.dateTime),
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      context.l10n.applyCares,
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return MultiSelectDialog(
                                            initialValue: form.cares,
                                            items: [
                                              for (final tag in CareTags.all)
                                                MultiSelectItem<
                                                  DistributionRequestCareEnum
                                                >(
                                                  tag,
                                                  CareTags.labelOf(
                                                    context,
                                                    tag.value,
                                                  ),
                                                ),
                                            ],
                                            listType: MultiSelectListType.CHIP,
                                            onConfirm: _form.setCares,
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline_sharp,
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      context.l10n.applyUrgent,
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        color: ColorPalette.nileBlue,
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    // `urgent!` — the model declares it nullable and the
                                    // draft happens to seed it false, so the bang was
                                    // load-bearing on an invariant nothing enforced.
                                    value: form.draft.urgent ?? false,
                                    onChanged: _form.setUrgent,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              MultiSelectChipDisplay(
                                items: form.cares
                                    .map(
                                      (element) => MultiSelectItem(
                                        element,
                                        CareTags.labelOf(
                                          context,
                                          element.value,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onTap: (p0) => _form.setCares(
                                  form.cares.where((c) => c != p0).toList(),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorPalette.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 3),
                                      blurRadius: 6,
                                      color: ColorPalette.nileBlue.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                  ],
                                ),
                                height: 50,
                                child: TextFormField(
                                  onChanged: _form.setPhone,
                                  // textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    color: ColorPalette.nileBlue,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: context.l10n.applyPhone,
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintStyle: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      color: ColorPalette.nileBlue.withValues(
                                        alpha: 0.58,
                                      ),
                                    ),
                                  ),
                                  cursorColor: ColorPalette.timberGreen,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorPalette.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 3),
                                      blurRadius: 6,
                                      color: ColorPalette.nileBlue.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 2.5,
                                ),
                                // Free-text address + geocoding lookup replaced by a
                                // fixed destination list: the coordinates now come
                                // with the selection instead of from a service call
                                // that always failed. Deliberately NOT preselected,
                                // so the "address is empty" check below still bites.
                                child: DropdownButton<DeliveryPoint>(
                                  isExpanded: true,
                                  iconSize: 30,
                                  underline: const SizedBox(),
                                  value: form.selectedDeliveryPoint,
                                  hint: Text(
                                    context.l10n.applyAddress,
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      color: ColorPalette.nileBlue.withValues(
                                        alpha: 0.58,
                                      ),
                                    ),
                                  ),
                                  onChanged: _form.selectDeliveryPoint,
                                  items: kDeliveryPoints.map((point) {
                                    return DropdownMenuItem<DeliveryPoint>(
                                      value: point,
                                      child: Text(
                                        point.address,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 16,
                                          color: ColorPalette.nileBlue
                                              .withValues(alpha: 0.58),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: Text(context.l10n.actionCancel),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: _submitting ? null : _submit,
                                        child: _submitting
                                            ? const SizedBox(
                                                height: 15,
                                                width: 15,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              )
                                            : Text(
                                                context.l10n.actionConfirm,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "Nunito",
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
