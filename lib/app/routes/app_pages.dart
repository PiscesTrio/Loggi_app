import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/modules/WarehouseInventory/index.dart';
import 'package:loggi_app/app/modules/WarehouseListMin/index.dart';
import 'package:loggi_app/app/modules/distribution_apply/index.dart';
import 'package:loggi_app/app/modules/distribution_list/index.dart';
import 'package:loggi_app/app/modules/distribution_status/index.dart';
import 'package:loggi_app/app/modules/login/view.dart';
import 'package:loggi_app/app/modules/login_log/index.dart';
import 'package:loggi_app/app/modules/operate_log/index.dart';
import 'package:loggi_app/app/modules/operate_log/view.dart';
import 'package:loggi_app/app/modules/system_setting/controller.dart';
import 'package:loggi_app/app/modules/system_setting/view.dart';
import 'package:loggi_app/app/modules/transport_management_page/index.dart';
import 'package:get/get.dart';

import '../data/models/commodity.dart';
import '../data/models/distribution_status.dart';
import '../modules/ProductDetailMin/bindings.dart';
import '../modules/ProductDetailMin/view.dart';
import '../modules/ProductTableMinPage/bindings.dart';
import '../modules/ProductTableMinPage/view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings.dart';
import '../modules/login/controller.dart';
import '../modules/system_setting/bindings.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.SYS,
        page: () => SystemSettingPage(),
        binding: SystemSettingBinding()),
    GetPage(
        name: _Paths.OPLOG,
        page: () => OperateLogPage(),
        binding: OperateLogBinding()),
    GetPage(
        name: _Paths.LOGINLOG,
        page: () => LoginLogPage(),
        binding: LoginLogBinding()),
    GetPage(
        name: _Paths.TRANSPORT,
        page: () => TransportManagementPagePage(),
        binding: TransportManagementPageBinding()),
    GetPage(
        name: _Paths.DISTRIBUTION_STATUS,
        page: () => DistributionStatusPage(argument: Distribution()),
        binding: DistributionStatusBinding()),
    GetPage(
        name: _Paths.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: _Paths.DISTRIBUTION_LIST,
        page: () => DistributionListPage(),
        binding: DistributionListBinding()),
    GetPage(
        name: _Paths.DISTRIBUTION_APPLY,
        page: () => DistributionApplyPage(),
        binding: DistributionApplyBinding()),
    GetPage(
        name: _Paths.WAREHOUSE_LIST,
        page: () => WarehouselistminPage(),
        binding: WarehouselistminBinding()),
    GetPage(
        name: _Paths.WAREHOUSE_INVENTORY,
        page: () => WarehouseinventoryPage(
              warehouseId: '',
            ),
        binding: WarehouseinventoryBinding()),
    GetPage(
      name: _Paths.PRODUCT_TABLE_DETAL,
      page: () => ProductdetailminPage(
        arguments: {},
      ),
      binding: ProductdetailminBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => ProducttableminpagePage(),
      binding: ProducttableminpageBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
