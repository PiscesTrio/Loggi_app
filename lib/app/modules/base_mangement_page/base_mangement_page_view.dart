import 'package:loggi_app/app/modules/WarehouseInventory/index.dart';
import 'package:loggi_app/app/modules/base_mangement_page/base_mangement_page_controller.dart';
import 'package:loggi_app/app/modules/warehouse_list_page/bindings/warehouse_list_page_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/theme/color_palette.dart';

import '../../routes/app_pages.dart';
import '../ProductDetailMin/bindings.dart';
import '../ProductDetailMin/view.dart';
import '../ProductTableMinPage/bindings.dart';
import '../ProductTableMinPage/view.dart';
import '../WarehouseListMin/view.dart';

class BaseManagementPageView extends GetView<BaseManagementPageController> {
  final String? name = '基础管理';
  const BaseManagementPageView({
    super.key,
    /* this.name*/
  });

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
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
                              length: 2,
                              child: TabBar(
                                controller: controller.tabController,
                                tabs: const [
                                  Tab(
                                     text: "商品管理",),
                                  Tab(
                                      text: "仓库管理",),
                                ],
                              )),
                          const SizedBox(height: 20),
                          Expanded(
                              child: Obx(() => IndexedStack(
                                    index: controller.tabIndex.value,
                                    children: [
                                      Navigator(
                                        key: Get.nestedKey(4),
                                        initialRoute: Routes.products,
                                        onGenerateRoute: (settings) {
                                          switch (settings.name) {
                                            case Routes.products:
                                              return GetPageRoute(
                                                  routeName: Routes.products,
                                                  page: () =>
                                                      ProducttableminpagePage(),
                                                  transition:
                                                      Transition.upToDown,
                                                  popGesture: true,
                                                  maintainState: true,
                                                  binding:
                                                      ProducttableminpageBinding());
                                            case Routes.productTableDetail:
                                              return GetPageRoute(

                                                  routeName: Routes
                                                      .productTableDetail,
                                                  page: () =>
                                                      ProductdetailminPage(
                                                          arguments:
                                                              settings.arguments as Map<String,dynamic>),
                                                  transition:
                                            
                                                      Transition.downToUp,
                                                  popGesture: true,
                                                  maintainState: true,
                                                  binding:
                                                      ProductdetailminBinding());
                                            default:
                                          }
                                          return null;
                                        },
                                      ),         Navigator(
                                        key: Get.nestedKey(5),
                                        initialRoute: Routes.warehouseList,
                                        onGenerateRoute: (settings) {
                                          switch (settings.name) {
                                            case Routes.warehouseList:
                                              return GetPageRoute(
                                                  routeName: Routes.warehouseList,
                                                  page: () =>
                                                      WarehouselistminPage(),
                                                  transition:
                                                      Transition.upToDown,
                                                  popGesture: true,
                                                  maintainState: true,
                                                  binding:
                                                      WarehouseListPageBinding());
                                            case Routes.warehouseInventory:
                                              return GetPageRoute(

                                                  routeName: Routes
                                                      .warehouseInventory,
                                                  page: () =>
                                                      WarehouseinventoryPage(
                                                          warehouseId:
                                                              settings.arguments as String),
                                                  transition:
                                            
                                                      Transition.downToUp,
                                                  popGesture: true,
                                                  maintainState: true,
                                                  binding:
                                                      WarehouseinventoryBinding());
                                            default:
                                          }
                                          return null;
                                        },
                                      ),

                                      // ProducttableminpagePage(),
                                      // ProductdetailminPage()
                                    ],
                                  )))
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
  }
}
