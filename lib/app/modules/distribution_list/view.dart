import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_palette.dart';
import '../widgets/distribution_card.dart';
import 'index.dart';
import 'package:go_router/go_router.dart';
import 'package:loggi_app/app/router/routes.dart';

class DistributionListPage extends GetView<DistributionListController> {
  const DistributionListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DistributionListController>(builder: (_) {
      return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(
              bottom: 0,
              right: 0,
            ),
            child: FloatingActionButton(
              onPressed: () {
               context.push(Routes.distributionApply);
              },
              splashColor: ColorPalette.bondyBlue,
              backgroundColor: ColorPalette.pacificBlue,
              child: const Icon(
                Icons.add,
                color: ColorPalette.white,
              ),
            ),
          ),
          body: Container(
            color: ColorPalette.aquaHaze,
            child:RefreshIndicator(
              onRefresh: () {
                return Future(() {
                  controller.updateData();
                });
              },
              child: controller.obx(
                (data) => ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return DistributionCard(
                        distribution: data![index],
                      );
                    }),
              ))),);
    });
  }
}
