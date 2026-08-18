import 'package:loggi_app/app/modules/chart/index.dart';
import 'package:loggi_app/app/modules/distribution_status/index.dart';
import 'package:loggi_app/app/modules/login_log/bindings.dart';
import 'package:loggi_app/app/modules/operate_log/bindings.dart';
import 'package:loggi_app/app/modules/system_setting/index.dart';
import 'package:loggi_app/app/modules/transport_management_page/index.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/distribution.dart';
import '../../base_mangement_page/base_mangement_page_view.dart';
import '../../login_log/view.dart';
import '../../operate_log/view.dart';
import '../controllers/home_controller.dart';
class HomeView extends GetView<HomeController> {
  final GetStorage box = GetStorage();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    box.listenKey("token", (value) {
      if (value == "not logged in") {
        Get.offAndToNamed(Routes.login);
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
              initialRoute: Routes.transport,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case Routes.transport:
                    return GetPageRoute(
                        routeName: Routes.transport,
                        page: () => TransportManagementPagePage(),
                        binding: TransportManagementPageBinding());
                  case Routes.distributionStatus:
                    return GetPageRoute(
                        routeName: Routes.distributionStatus,
                        page: () => DistributionStatusPage(
                            argument: settings.arguments as Distribution),
                        binding: DistributionStatusBinding());
                }
                return null;
              },
            ),

            ChartPage(),
            Navigator(
              key: Get.nestedKey(69),
              initialRoute: Routes.sys,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case Routes.sys:
                    return GetPageRoute(
                        routeName: Routes.sys,
                        page: () => SystemSettingPage(),
                        binding: SystemSettingBinding());
                  case Routes.opLog:
                    return GetPageRoute(
                        routeName: Routes.opLog,
                        page: () => OperateLogPage(),
                        binding: OperateLogBinding());
                  case Routes.loginLog:
                    return GetPageRoute(
                        routeName: Routes.loginLog,
                        page: () => LoginLogPage(),
                        binding: LoginLogBinding());
                }
                return null;
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
