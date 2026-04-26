import 'package:loggi_app/app/modules/distribution_apply/bindings.dart';
import 'package:loggi_app/app/modules/distribution_apply/view.dart';
import 'package:loggi_app/app/modules/distribution_list/index.dart';
import 'package:loggi_app/app/modules/distribution_status/index.dart';
import 'package:loggi_app/app/modules/map/amap_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../theme/color_palette.dart';
import '../distribution_list/view.dart';
import '../driver_list/view.dart';
import '../vehicle_list/view.dart';
import 'index.dart';

class TransportManagementPagePage
    extends GetView<TransportManagementPageController> {
  const TransportManagementPagePage({Key? key}) : super(key: key);

  final String? name = '运输管理';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransportManagementPageController>(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              name!.length > 14
                                  ? '${name!.substring(0, 12)}..'
                                  : name!,
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 28,
                                color: ColorPalette.timberGreen,
                              ),
                            ),
                        
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              DefaultTabController(
                                  length: 3,
                                  child: TabBar(
                                    controller: controller.tabController,
                                    tabs: const [
                                      Tab(
                                        text: "配送管理",
                                        //     icon: Icon(
                                        //   Icons.desktop_mac,
                                        //   color: Colors.black,
                                        // )
                                      ),
                                      Tab(
                                        text: "车辆管理",
                                        // icon: Icon(Icons.laptop_mac,
                                        //     color: Colors.black)
                                      ),
                                      Tab(
                                        text: "驾驶员管理",
                                        // icon: Icon(Icons.ad_units,
                                        //     color: Colors.black)
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 20),
                              Expanded(
                                  child: Obx(() => IndexedStack(
                                        index: controller.tabIndex.value,
                                        children: [
                                          Navigator(
                                            key: Get.nestedKey(6),
                                            initialRoute:
                                                Routes.DISTRIBUTION_LIST,
                                            onGenerateRoute: (settings) {
                                              switch (settings.name) {
                                                case Routes.DISTRIBUTION_LIST:
                                                  return GetPageRoute(
                                                      routeName: Routes
                                                          .DISTRIBUTION_LIST,
                                                      page: () =>
                                                          DistributionListPage(),
                                                      transition:
                                                          Transition.upToDown,
                                                      popGesture: true,
                                                      maintainState: true,
                                                      binding:
                                                          DistributionListBinding());
                                                case Routes.DISTRIBUTION_APPLY:
                                                  return GetPageRoute(
                                                      routeName: Routes
                                                          .DISTRIBUTION_APPLY,
                                                      page: () =>
                                                          DistributionApplyPage(),
                                                      transition:
                                                          Transition.downToUp,
                                        
                                                      binding:
                                                          DistributionApplyBinding());
                                             
                                              }
                                            },
                                          ),
                                          VehicleListPage(),
                                          DriverListPage()
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                      ),
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
