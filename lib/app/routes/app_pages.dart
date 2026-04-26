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
import 'package:loggi_app/app/modules/product_table_detail/bindings/product_table_detail_binding.dart';
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
import '../modules/nested_navigation_detail/bindings/nested_navigation_detail_binding.dart';
import '../modules/nested_navigation_detail/views/nested_navigation_detail_view.dart';
import '../modules/nested_navigation_main/bindings/nested_navigation_main_binding.dart';
import '../modules/nested_navigation_main/views/nested_navigation_main_view.dart';
import '../modules/product_table_detail/views/product_table_detail_view.dart';
import '../modules/product_table_page/bindings/product_table_page_bindings.dart';
import '../modules/product_table_page/views/product_table_page_views.dart';
import '../modules/standard_navigation_detail/bindings/standard_navigation_detail_binding.dart';
import '../modules/standard_navigation_detail/views/standard_navigation_detail_view.dart';
import '../modules/standard_navigation_main/bindings/standard_navigation_main_binding.dart';
import '../modules/standard_navigation_main/views/standard_navigation_main_view.dart';
import '../modules/sub_tabs_nested_navigation_computer_detail_page/bindings/sub_tabs_nested_navigation_computer_detail_page_binding.dart';
import '../modules/sub_tabs_nested_navigation_computer_detail_page/views/sub_tabs_nested_navigation_computer_detail_page_view.dart';
import '../modules/sub_tabs_nested_navigation_computers_main_page/bindings/sub_tabs_nested_navigation_computers_main_page_binding.dart';
import '../modules/sub_tabs_nested_navigation_computers_main_page/views/sub_tabs_nested_navigation_computers_main_page_view.dart';
import '../modules/sub_tabs_nested_navigation_laptop_detail_page/bindings/sub_tabs_nested_navigation_laptop_detail_page_binding.dart';
import '../modules/sub_tabs_nested_navigation_laptop_detail_page/views/sub_tabs_nested_navigation_laptop_detail_page_view.dart';
import '../modules/sub_tabs_nested_navigation_laptops_main_page/bindings/sub_tabs_nested_navigation_laptops_main_page_binding.dart';
import '../modules/sub_tabs_nested_navigation_laptops_main_page/views/sub_tabs_nested_navigation_laptops_main_page_view.dart';
import '../modules/sub_tabs_nested_navigation_main/bindings/sub_tabs_nested_navigation_main_binding.dart';
import '../modules/sub_tabs_nested_navigation_main/views/sub_tabs_nested_navigation_main_view.dart';
import '../modules/system_setting/bindings.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

import '../modules/product_page/bindings/product_page_bindings.dart';
import '../modules/product_page/views/product_page_view.dart';

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
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.STANDARD_NAVIGATION_MAIN,
      page: () => StandardNavigationMainView(),
      binding: StandardNavigationMainBinding(),
    ),
    GetPage(
      name: _Paths.STANDARD_NAVIGATION_DETAIL,
      page: () => StandardNavigationDetailView(),
      binding: StandardNavigationDetailBinding(),
    ),
    GetPage(
      name: _Paths.NESTED_NAVIGATION_DETAIL,
      page: () => NestedNavigationDetailView(
        argument: 'default argument',
      ),
      binding: NestedNavigationDetailBinding(),
    ),
    GetPage(
      name: _Paths.NESTED_NAVIGATION_MAIN,
      page: () => NestedNavigationMainView(),
      binding: NestedNavigationMainBinding(),
    ),
    GetPage(
      name: _Paths.SUB_TABS_NESTED_NAVIGATION_MAIN,
      page: () => SubTabsNestedNavigationMainView(),
      binding: SubTabsNestedNavigationMainBinding(),
    ),
    GetPage(
      name: _Paths.SUB_TABS_NESTED_NAVIGATION_COMPUTERS_MAIN_PAGE,
      page: () => SubTabsNestedNavigationComputersMainPageView(),
      binding: SubTabsNestedNavigationComputersMainPageBinding(),
    ),
    GetPage(
      name: _Paths.SUB_TABS_NESTED_NAVIGATION_COMPUTER_DETAIL_PAGE,
      page: () => SubTabsNestedNavigationComputerDetailPageView(
        argument: '',
      ),
      binding: SubTabsNestedNavigationComputerDetailPageBinding(),
    ),
    GetPage(
      name: _Paths.SUB_TABS_NESTED_NAVIGATION_LAPTOP_DETAIL_PAGE,
      page: () => SubTabsNestedNavigationLaptopDetailPageView(
        argument: '',
      ),
      binding: SubTabsNestedNavigationLaptopDetailPageBinding(),
    ),
    GetPage(
      name: _Paths.SUB_TABS_NESTED_NAVIGATION_LAPTOPS_MAIN_PAGE,
      page: () => SubTabsNestedNavigationLaptopsMainPageView(),
      binding: SubTabsNestedNavigationLaptopsMainPageBinding(),
    ),
  ];
}
