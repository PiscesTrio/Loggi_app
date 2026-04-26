import 'package:loggi_app/app/modules/widgets/driver_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_palette.dart';
import 'index.dart';


class DriverListPage extends GetView<DriverListController> {
  const DriverListPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverListController>(
      builder: (_) {
        return Scaffold(
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
                      return DriverCard(
                        driver: data![index],
                        imageIndex: index,
                      );
                    }),
              )))
         );
      },
    );
  }
}
