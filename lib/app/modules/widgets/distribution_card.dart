import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loggi_app/app/data/models/distribution.dart';
import 'package:loggi_app/app/router/routes.dart';
import 'package:loggi_app/app/theme/color_palette.dart';

import '../distribution_list/providers.dart';

/// One delivery order in the list.
class DistributionCard extends StatelessWidget {
  const DistributionCard({super.key, this.distribution, this.docID});

  final Distribution? distribution;
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
                          distribution!.number ?? '',
                          maxLines: 1,
                          style: const TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 20,
                            color: ColorPalette.timberGreen,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.warehouse_rounded,
                              size: 14,
                              color: ColorPalette.timberGreen.withValues(alpha: 0.44),
                            ),
                          ),
                          TextSpan(
                            text: distribution!.wid ?? '-',
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.timberGreen,
                            ),
                          )
                        ])),
                        const SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: ColorPalette.timberGreen.withValues(alpha: 0.44),
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: ColorPalette.timberGreen.withValues(alpha: 0.44),
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: ColorPalette.timberGreen.withValues(alpha: 0.44),
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.location_on,
                              size: 14,
                              color: ColorPalette.timberGreen.withValues(alpha: 0.44),
                            ),
                          ),
                          TextSpan(
                            text: distribution!.address ?? '-',
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.timberGreen,
                            ),
                          )
                        ])),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              // distribution!.group ?? '-',
                              '驾驶员：',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color:
                                    ColorPalette.timberGreen.withValues(alpha: 0.44),
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
                                color:
                                    ColorPalette.timberGreen.withValues(alpha: 0.44),
                              ),
                            ),
                            Text(
                              distribution!.driver ?? '-',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color:
                                    ColorPalette.timberGreen.withValues(alpha: 0.44),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          // width: 100,
                          child: Text(
                            distribution!.care ?? '-',
                            maxLines: 3,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 11,
                              color: ColorPalette.timberGreen.withValues(alpha: 0.44),
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
                child: IndexedStack(
                  index: distribution!.status,
                  children: [
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 0, 0, 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Row(
                        children: const [
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.search,
                            size: 14,
                            color: ColorPalette.white,
                          ),
                          Text(
                            // distribution!.location ?? '-',
                            '等待审核',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.white,
                            ),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 132, 255, 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Row(
                        children: const [
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.fire_truck,
                            size: 14,
                            color: ColorPalette.white,
                          ),
                          Text(
                            // distribution!.location ?? '-',
                            '配送中',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.white,
                            ),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(4, 202, 4, 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Row(
                        children: const [
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.done,
                            size: 14,
                            color: ColorPalette.white,
                          ),
                          Text(
                            // distribution!.location ?? '-',
                            '配送完成',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.white,
                            ),
                          ),
                        ],
                      )),
                    )
                  ],
                ))
          ],
        ));
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

  final Distribution? distribution;

  @override
  ConsumerState<_StatusStepperDialog> createState() => _StatusStepperDialogState();
}

class _StatusStepperDialogState extends ConsumerState<_StatusStepperDialog> {
  late int _step = widget.distribution?.status ?? 0;

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
                                        child: const Text("返回")),
                                    ElevatedButton(
                                        onPressed: details.onStepContinue,
                                        child: const Text("通过")),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                        onPressed: details.onStepCancel,
                                        child: const Text("返回")),
                                        ElevatedButton(
                                        onPressed:(){
                                          Navigator.pop(context);
                                          context.push(Routes.distributionStatus, extra: widget.distribution);},
                                        child: const Text("查看配送进度")),
                                    ElevatedButton(
                                        onPressed: details.onStepContinue,
                                        child: const Text("确认已送达")),
                                        
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                        onPressed: details.onStepCancel,
                                        child: const Text("返回"))
                                  ],
                                )
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
                              // Distribution is immutable now, so the advanced order is
                              // a new value rather than an edit to the one the list is
                              // still rendering. The list refreshes from the server
                              // response, which is the only copy that was ever right.
                              ref
                                  .read(distributionListProvider.notifier)
                                  .advance(widget.distribution!
                                      .copyWith(status: next));
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          type: StepperType.horizontal,
                          steps: [
                            Step(
                              isActive: _step >= 0,
                              title: const Text("审核"),
                              content: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("驾驶员："),
                                      Text(widget.distribution!.driver ?? "-")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("车牌号码："),
                                      Text(widget.distribution!.number ?? "-")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("加急处理："),
                                      Text(widget.distribution!.urgent! ? "是" : "否")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("注意事项："),
                                      Expanded(
                                          child: Text(widget.distribution!.care ?? "-",
                                              maxLines: 5))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("客户电话："),
                                      Expanded(
                                          child: Text(
                                        widget.distribution!.phone ?? "-",
                                        maxLines: 5,
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                   
                                    children: [
                                      const Text("客户地址："),
                                      Expanded(
                                          child: Text(
                                              widget.distribution!.address ?? "-",
                                              maxLines: 5))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("预计送达："),
                                      Text(widget.distribution!.time ?? "-")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Step(
                              isActive: _step >= 1,
                              title: const Text("配送中"),
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
                                      )
                                      
                                    ]),
                                    const Text("配送中")
                                  ],
                                ),
                              ),
                            ),
                            Step(
                              isActive: _step >= 2,
                              title: const Text("配送完成"),
                              content: Center(
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      size: 160,
                                      color: Color.fromARGB(236, 28, 227, 48),
                                    ),
                                    Text("配送已完成")
                                  ],
                                ),
                              ),
                            )
                          ],
                          currentStep: _step),
                    ),
                  ),
                );
  }
}
