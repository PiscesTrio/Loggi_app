import '../../theme/status_colors.dart';
import '../../../features/distribution/care_tags.dart';
import '../../../l10n/l10n.dart';

import 'package:flutter/material.dart';

import '../../utils/date_display.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loggi_app/app/router/routes.dart';
import 'package:loggi_app/app/theme/color_palette.dart';

import '../../data/api/distribution_request.dart';
import '../../data/api/distribution_vo.dart';

import '../distribution_list/providers.dart';

/// One delivery order in the list.
class DistributionCard extends StatelessWidget {
  const DistributionCard({super.key, this.distribution, this.docID});

  final DistributionVo? distribution;
  final String? docID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => _StatusStepperDialog(distribution: distribution),
      ),
      child: Stack(
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            // height: 167,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 6,
                  color: const Color(0xff000000).withValues(alpha: 0.06),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        distribution!.vehicle?.number ?? '',
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 20,
                          color: ColorPalette.timberGreen,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.warehouse_rounded,
                                size: 14,
                                color: ColorPalette.timberGreen.withValues(
                                  alpha: 0.44,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: distribution!.warehouse?.name ?? '-',
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color: ColorPalette.timberGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                                color: ColorPalette.timberGreen.withValues(
                                  alpha: 0.44,
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                                color: ColorPalette.timberGreen.withValues(
                                  alpha: 0.44,
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                                color: ColorPalette.timberGreen.withValues(
                                  alpha: 0.44,
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.location_on,
                                size: 14,
                                color: ColorPalette.timberGreen.withValues(
                                  alpha: 0.44,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: distribution!.address ?? '-',
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color: ColorPalette.timberGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            // distribution!.group ?? '-',
                            context.l10n.deliveryDriver,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.timberGreen.withValues(
                                alpha: 0.44,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              top: 2,
                              right: 5,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 10,
                              color: ColorPalette.timberGreen.withValues(
                                alpha: 0.44,
                              ),
                            ),
                          ),
                          Text(
                            distribution!.driver?.name ?? '-',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.timberGreen.withValues(
                                alpha: 0.44,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        // width: 100,
                        child: Text(
                          CareTags.describe(context, distribution!.care),
                          maxLines: 3,
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 11,
                            color: ColorPalette.timberGreen.withValues(
                              alpha: 0.44,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 30,
            top: 20,
            child: _StatusBadge(step: _stepOf(distribution!.status)),
          ),
        ],
      ),
    );
  }
}

/// The approve / deliver / complete stepper.
///
/// Its own widget, holding its own step index. The index used to be an `RxInt` **field on
/// the card widget**, re-seeded from the order at the top of every `build` and read from
/// inside `showDialog`'s builder — which runs in a different element tree, so nothing
/// short of an observable could have connected them. That is why the `Obx` was there.
/// State that belongs to a dialog lives in the dialog.
class _StatusStepperDialog extends ConsumerStatefulWidget {
  const _StatusStepperDialog({this.distribution});

  final DistributionVo? distribution;

  @override
  ConsumerState<_StatusStepperDialog> createState() =>
      _StatusStepperDialogState();
}

class _StatusStepperDialogState extends ConsumerState<_StatusStepperDialog> {
  late int _step = _stepOf(widget.distribution?.status);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.horizontal,
      child: SizedBox(
        // width: 300,
        height: 500,
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          child: Stepper(
            controlsBuilder: (context, details) {
              return IndexedStack(
                index: _step,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: details.onStepCancel,
                        child: Text(context.l10n.deliveryActionBack),
                      ),
                      ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: Text(context.l10n.deliveryActionApprove),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: details.onStepCancel,
                        child: Text(context.l10n.deliveryActionBack),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.push(
                            Routes.distributionStatus,
                            extra: widget.distribution,
                          );
                        },
                        child: Text(context.l10n.deliveryActionTrack),
                      ),
                      ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: Text(context.l10n.deliveryActionMarkDelivered),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: details.onStepCancel,
                        child: Text(context.l10n.deliveryActionBack),
                      ),
                    ],
                  ),
                ],
              );
            },
            onStepCancel: () {
              Navigator.pop(context);
            },
            onStepContinue: () {
              // .value, not the Rx itself: GetX overrides == to unwrap,
              // so both compile and behave identically, but only one of
              // them says so without knowing that.
              if (_step != 2) {
                final next = _step + 1;
                setState(() => _step = next);
                // DistributionVo is immutable now, so the advanced order is
                // a new value rather than an edit to the one the list is
                // still rendering. The list refreshes from the server
                // response, which is the only copy that was ever right.
                ref
                    .read(distributionListProvider.notifier)
                    .advance(_requestFrom(widget.distribution!, next));
              } else {
                Navigator.pop(context);
              }
            },
            type: StepperType.horizontal,
            steps: [
              Step(
                isActive: _step >= 0,
                title: Text(context.l10n.deliveryActionReview),
                content: Column(
                  children: [
                    Row(
                      children: [
                        Text(context.l10n.deliveryDriver),
                        Text(widget.distribution!.driver?.name ?? "-"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(context.l10n.deliveryPlate),
                        Text(widget.distribution!.vehicle?.number ?? "-"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(context.l10n.deliveryUrgent),
                        Text(
                          widget.distribution!.urgent!
                              ? context.l10n.commonYes
                              : context.l10n.commonNo,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(context.l10n.deliveryCares),
                        Expanded(
                          child: Text(
                            CareTags.describe(
                              context,
                              widget.distribution!.care,
                            ),
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(context.l10n.deliveryPhone),
                        Expanded(
                          child: Text(
                            widget.distribution!.phone ?? "-",
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(context.l10n.deliveryAddress),
                        Expanded(
                          child: Text(
                            widget.distribution!.address ?? "-",
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(context.l10n.deliveryEta),
                        Text(formatDateMinute(widget.distribution!.time)),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Step(
                isActive: _step >= 1,
                title: Text(context.l10n.deliveryStatusInTransit),
                content: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.warehouse_rounded,
                            size: 100,
                            color: Color.fromARGB(235, 17, 91, 210),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 100,
                            color: Color.fromARGB(235, 17, 91, 210),
                          ),
                          Icon(
                            Icons.location_on_rounded,
                            size: 100,
                            color: Color.fromARGB(235, 17, 91, 210),
                          ),
                        ],
                      ),
                      Text(context.l10n.deliveryStatusInTransit),
                    ],
                  ),
                ),
              ),
              Step(
                isActive: _step >= 2,
                title: Text(context.l10n.deliveryStatusDelivered),
                content: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        size: 160,
                        color: Color.fromARGB(236, 28, 227, 48),
                      ),
                      Text(context.l10n.deliveryStatusDone),
                    ],
                  ),
                ),
              ),
            ],
            currentStep: _step,
          ),
        ),
      ),
    );
  }
}

/// The order's stage as a step index.
///
/// It was an int on the wire - 0, 1, 2 - and the stepper used it directly. It is the enum
/// name now, which is what the database has held since S09, so the mapping to a screen
/// position lives here instead of being implied by four comparisons against bare numbers.
int _stepOf(DistributionVoStatusEnum? status) => switch (status) {
  DistributionVoStatusEnum.REVIEW_SUCCESS => 1,
  DistributionVoStatusEnum.END => 2,
  _ => 0,
};

/// The order as a request to advance it.
///
/// The API takes a request type rather than the order back: an order carries an id and the
/// rows it points at, a request names them by id and has no id of its own. Sending the id
/// back is what made writes to this endpoint fail for the life of the project.
DistributionRequest _requestFrom(DistributionVo order, int step) {
  const stages = [
    DistributionRequestStatusEnum.REVIEWING,
    DistributionRequestStatusEnum.REVIEW_SUCCESS,
    DistributionRequestStatusEnum.END,
  ];
  return DistributionRequest(
    driverId: order.driver?.id ?? '',
    vehicleId: order.vehicle?.id ?? '',
    warehouseId: order.warehouse?.id,
    phone: order.phone ?? '',
    address: order.address ?? '',
    urgent: order.urgent ?? false,
    care: CareTags.toRequest(order.care),
    time: order.time ?? DateTime.now(),
    status: stages[step.clamp(0, stages.length - 1)],
    fromLat: order.fromLat ?? 0,
    fromLng: order.fromLng ?? 0,
    toLat: order.toLat ?? 0,
    toLng: order.toLng ?? 0,
  );
}

/// The delivery time, as text.
///

/// The coloured status pill on a delivery card.
///
/// Was three near-identical `Container`s in an `IndexedStack`, each 70 logical pixels wide.
/// 70 fits 等待审核 and 審査待ち; "Awaiting review" overflowed it by 38 pixels, which the app
/// draws as a black-and-yellow stripe across the card. Nothing caught it because until B5
/// there was no way to see an English screen — the tests assert the strings exist and differ
/// from one another, and a string that exists can still not fit.
///
/// The width is gone rather than enlarged. A number chosen to fit today's longest translation
/// is a number that breaks on the next language, and there is no reason for these to be the
/// same width as each other.
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.step});

  final int step;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (color, icon, label) = switch (step) {
      1 => (
        StatusColors.inTransit,
        Icons.fire_truck,
        l10n.deliveryStatusInTransit,
      ),
      2 => (StatusColors.idle, Icons.done, l10n.deliveryStatusDelivered),
      _ => (StatusColors.busy, Icons.search, l10n.deliveryStatusReviewing),
    };

    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: ColorPalette.white),
          const SizedBox(width: 4),
          Text(
            label,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 12,
              color: ColorPalette.white,
            ),
          ),
        ],
      ),
    );
  }
}
