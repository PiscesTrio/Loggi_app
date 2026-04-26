import 'package:loggi_app/app/modules/chart/index.dart';
import 'package:loggi_app/app/modules/distribution_status/index.dart';
import 'package:loggi_app/app/modules/login_log/bindings.dart';
import 'package:loggi_app/app/modules/operate_log/bindings.dart';
import 'package:loggi_app/app/modules/system_setting/index.dart';
import 'package:loggi_app/app/modules/transport_management_page/index.dart';
import 'package:loggi_app/app/modules/warehouse_list_page/views/warehouse_list_page_views.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/modules/nested_navigation_detail/bindings/nested_navigation_detail_binding.dart';
import 'package:loggi_app/app/modules/nested_navigation_detail/views/nested_navigation_detail_view.dart';
import 'package:loggi_app/app/modules/nested_navigation_main/views/nested_navigation_main_view.dart';
import 'package:loggi_app/app/modules/standard_navigation_main/views/standard_navigation_main_view.dart';
import 'package:loggi_app/app/modules/sub_tabs_nested_navigation_main/views/sub_tabs_nested_navigation_main_view.dart';
import 'package:loggi_app/app/routes/app_pages.dart';
import 'package:loggi_app/constants.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/distribution.dart';
import '../../base_mangement_page/base_mangement_page_view.dart';
import '../../login_log/view.dart';
import '../../map/amap_test.dart';
import '../../operate_log/view.dart';
import '../../product_manage_main_page/views/product_manage_main_page.dart';
import '../../product_table_page/views/product_table_page_views.dart';
import '../../system_setting/view.dart';
import '../../transport_management_page/view.dart';
import '../controllers/home_controller.dart';
import 'package:loggi_app/app/modules/product_page/views/product_page_view.dart';

class HomeView extends GetView<HomeController> {
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.listenKey("token", (value) {
      if (value == "not logged in") {
        Get.offAndToNamed(Routes.LOGIN);
        showTextToast("已退出登录");
      }
    });

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            BaseManagementPageView(),
            // TransportManagementPagePage(),
            Navigator(
              key: Get.nestedKey(70),
              initialRoute: Routes.TRANSPORT,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case Routes.TRANSPORT:
                    return GetPageRoute(
                        routeName: Routes.TRANSPORT,
                        page: () => TransportManagementPagePage(),
                        binding: TransportManagementPageBinding());
                  case Routes.DISTRIBUTION_STATUS:
                    return GetPageRoute(
                        routeName: Routes.DISTRIBUTION_STATUS,
                        page: () => DistributionStatusPage(
                            argument: settings.arguments as Distribution),
                        binding: DistributionStatusBinding());
                }
              },
            ),

            ChartPage(),
            Navigator(
              key: Get.nestedKey(69),
              initialRoute: Routes.SYS,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case Routes.SYS:
                    return GetPageRoute(
                        routeName: Routes.SYS,
                        page: () => SystemSettingPage(),
                        binding: SystemSettingBinding());
                  case Routes.OPLOG:
                    return GetPageRoute(
                        routeName: Routes.OPLOG,
                        page: () => OperateLogPage(),
                        binding: OperateLogBinding());
                  case Routes.LOGINLOG:
                    return GetPageRoute(
                        routeName: Routes.LOGINLOG,
                        page: () => LoginLogPage(),
                        binding: LoginLogBinding());
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.tabIndex.value,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.warehouse_rounded), label: '基础管理'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping_rounded), label: '运输管理'),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_sharp), label: '图表分析'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '系统设置'),
          ],
          onTap: controller.onTabClick,
        ),
      ),
    );
  }
}
