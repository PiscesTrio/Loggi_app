import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/modules/widgets/pie_chart_sample2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:get/get.dart';
import 'package:graphic/graphic.dart';

import '../../theme/color_palette.dart';
import '../widgets/indicator.dart';
import 'index.dart';

class ChartPage extends GetView<ChartController> {
  ChartPage({Key? key}) : super(key: key);

  final String name = "图表分析";
  final List color = [
    ColorPalette.contentColorBlue,
    ColorPalette.contentColorYellow,
    ColorPalette.contentColorOrange,
    ColorPalette.contentColorGreen,
    ColorPalette.contentColorPurple,
    ColorPalette.contentColorPink,
    ColorPalette.contentColorRed,
    ColorPalette.contentColorCyan,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            color: ColorPalette.pacificBlue,
            child: SafeArea(
              child: Container(
                color: ColorPalette.aquaHaze,
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 15,
                      ),
                      width: double.infinity,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: ColorPalette.pacificBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // IconButton(
                          //   icon: const Icon(
                          //     Icons.chevron_left_rounded,
                          //     size: 35,
                          //   ),
                          //   onPressed: () {
                          //     Navigator.of(context).pop();
                          //   },
                          // ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(130, 10, 10, 10),
                            child: Text(
                              name!.length > 14
                                  ? '${name!.substring(0, 12)}..'
                                  : name!,
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 28,
                                color: ColorPalette.timberGreen,
                              ),
                            ),
                          ),

                         
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: 360,
                          child: RefreshIndicator(
                              onRefresh: () {
                                return Future(() {
                                  controller.updateData();
                                });
                              },
                              child: ListView(
                                children: [
                                  const SizedBox(height: 20,),
                                  const Divider(height: 2,),
                                  const SizedBox(height: 20,),
                                  const Center(
                                    child:Text("入库",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                                  ),
                                  Obx(() => PieChartSample2(
                                      data: controller.tempData["in"]!)),
                                  Obx(() {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            controller.tempData["in"]!.length,
                                        itemBuilder: (context, index) {
                                          return Indicator(
                                              value: controller
                                                  .tempData["in"]![index]
                                                  .value!,
                                              color: color[index % 8],
                                              text: controller
                                                  .tempData["in"]![index].name!,
                                              isSquare: true);
                                        });
                                  }),
                                  const SizedBox(height: 20,),
                                  const Divider(height: 2,),
                                  const SizedBox(height: 20,),
                                  const Center(
                                    child:Text("出库",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                                  ),
                                  Obx(() => PieChartSample2(
                                      data: controller.tempData["out"]!)),
                                  Obx(() {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            controller.tempData["out"]!.length,
                                        itemBuilder: (context, index) {
                                          return Indicator(
                                              value: controller
                                                  .tempData["out"]![index]
                                                  .value!,
                                              color: color[index % 8],
                                              text: controller
                                                  .tempData["out"]![index]
                                                  .name!,
                                              isSquare: true);
                                        });
                                  }),
                                ],
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
