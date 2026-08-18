import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/modules/WarehouseInventory/index.dart';
import 'package:loggi_app/app/modules/WarehouseListMin/index.dart';
import 'package:loggi_app/app/modules/distribution_apply/index.dart';
import 'package:loggi_app/app/modules/distribution_list/index.dart';
import 'package:loggi_app/app/modules/distribution_status/index.dart';
import 'package:loggi_app/app/modules/login/view.dart';
import 'package:loggi_app/app/modules/login_log/index.dart';
import 'package:loggi_app/app/modules/operate_log/index.dart';
import 'package:loggi_app/app/modules/system_setting/view.dart';
import 'package:loggi_app/app/modules/transport_management_page/index.dart';
import 'package:get/get.dart';

import '../modules/ProductDetailMin/bindings.dart';
import '../modules/ProductDetailMin/view.dart';
import '../modules/ProductTableMinPage/bindings.dart';
import '../modules/ProductTableMinPage/view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings.dart';
import '../modules/system_setting/bindings.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;
  static const home = Routes.home;

  static final routes = [
    GetPage(
        name: _Paths.sys,
        page: () => SystemSettingPage(),
        binding: SystemSettingBinding()),
    GetPage(
        name: _Paths.opLog,
        page: () => OperateLogPage(),
        binding: OperateLogBinding()),
    GetPage(
        name: _Paths.loginLog,
        page: () => LoginLogPage(),
        binding: LoginLogBinding()),
    GetPage(
        name: _Paths.transport,
        page: () => TransportManagementPagePage(),
        binding: TransportManagementPageBinding()),
    GetPage(
        name: _Paths.distributionStatus,
        page: () => DistributionStatusPage(argument: Distribution()),
        binding: DistributionStatusBinding()),
    GetPage(
        name: _Paths.login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: _Paths.distributionList,
        page: () => DistributionListPage(),
        binding: DistributionListBinding()),
    GetPage(
        name: _Paths.distributionApply,
        page: () => DistributionApplyPage(),
        binding: DistributionApplyBinding()),
    GetPage(
        name: _Paths.warehouseList,
        page: () => WarehouselistminPage(),
        binding: WarehouselistminBinding()),
    GetPage(
        name: _Paths.warehouseInventory,
        page: () => WarehouseinventoryPage(
              warehouseId: '',
            ),
        binding: WarehouseinventoryBinding()),
    GetPage(
      name: _Paths.productTableDetail,
      page: () => ProductdetailminPage(
        arguments: {},
      ),
      binding: ProductdetailminBinding(),
    ),
    GetPage(
      name: _Paths.products,
      page: () => ProducttableminpagePage(),
      binding: ProducttableminpageBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
