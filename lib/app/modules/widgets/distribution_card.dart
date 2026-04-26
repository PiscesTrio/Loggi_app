import 'package:loggi_app/app/data/models/distribution.dart';
import 'package:loggi_app/app/modules/vehicle_list/controller.dart';
import 'package:flutter/material.dart';

import 'package:loggi_app/app/theme/color_palette.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../distribution_list/controller.dart';

class DistributionCard extends GetView<DistributionListController> {
  final Distribution? distribution;
  final String? docID;
  DistributionCard({Key? key, this.distribution, this.docID}) : super(key: key);
  final RxInt status = 0.obs;
  
  

  @override
  Widget build(BuildContext context) {
    status(distribution!.status);
    return GestureDetector(
        onTap: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return UnconstrainedBox(
                  constrainedAxis: Axis.horizontal,
                  child: SizedBox(
                    // width: 300,
                    height: 500,
                    child: Dialog(
                      insetPadding: EdgeInsets.zero,
                      child: Obx(() => Stepper(
                          controlsBuilder: (context, details) {
                            return IndexedStack(
                              index: status.value,
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
                                          Get.toNamed(Routes.DISTRIBUTION_STATUS,arguments: distribution,id: 70);},
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
                            if (status != 2) {
                              status(status.value + 1);
                              distribution?.status = status.value;
                              controller.updateStatus(distribution!);
                              
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          type: StepperType.horizontal,
                          steps: [
                            Step(
                              isActive: status.value >= 0,
                              title: const Text("审核"),
                              content: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("驾驶员："),
                                      Text(distribution!.driver ?? "-")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("车牌号码："),
                                      Text(distribution!.number ?? "-")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("加急处理："),
                                      Text(distribution!.urgent! ? "是" : "否")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("注意事项："),
                                      Expanded(
                                          child: Text(distribution!.care ?? "-",
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
                                        distribution!.phone ?? "-",
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
                                              distribution!.address ?? "-",
                                              maxLines: 5))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("预计送达："),
                                      Text(distribution!.time ?? "-")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Step(
                              isActive: status.value >= 1,
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
                              isActive: status.value >= 2,
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
                          currentStep: status.value)),
                    ),
                  ),
                );
              });
        },
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
                    color: const Color(0xff000000).withOpacity(0.06),
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
                              color: ColorPalette.timberGreen.withOpacity(0.44),
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
                              color: ColorPalette.timberGreen.withOpacity(0.44),
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: ColorPalette.timberGreen.withOpacity(0.44),
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: ColorPalette.timberGreen.withOpacity(0.44),
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.location_on,
                              size: 14,
                              color: ColorPalette.timberGreen.withOpacity(0.44),
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
                                    ColorPalette.timberGreen.withOpacity(0.44),
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
                                    ColorPalette.timberGreen.withOpacity(0.44),
                              ),
                            ),
                            Text(
                              distribution!.driver ?? '-',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color:
                                    ColorPalette.timberGreen.withOpacity(0.44),
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
                              color: ColorPalette.timberGreen.withOpacity(0.44),
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
