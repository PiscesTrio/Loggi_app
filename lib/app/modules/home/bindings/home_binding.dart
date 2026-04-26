import 'package:loggi_app/app/modules/product_manage_main_page/controllers/product_manage_main_controller.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/modules/nested_navigation_main/controllers/nested_navigation_main_controller.dart';
import 'package:loggi_app/app/modules/standard_navigation_main/controllers/standard_navigation_main_controller.dart';
import 'package:loggi_app/app/modules/sub_tabs_nested_navigation_main/controllers/sub_tabs_nested_navigation_main_controller.dart';
import '../../ProductDetailMin/controller.dart';
import '../../ProductTableMinPage/controller.dart';
import '../../WarehouseInventory/controller.dart';
import '../../WarehouseListMin/controller.dart';
import '../../base_mangement_page/base_mangement_page_controller.dart';
import '../../chart/controller.dart';
import '../../distribution_list/controller.dart';
import '../../distribution_status/controller.dart';
import '../../driver_list/controller.dart';
import '../../login_log/controller.dart';
import '../../operate_log/controller.dart';
import '../../product_table_page/controllers/product_table_page_controllers.dart';
import '../../system_setting/controller.dart';
import '../../transport_management_page/controller.dart';
import '../../vehicle_list/controller.dart';
import '../../warehouse_list_page/controllers/warehouse_list_page_controllers.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
   
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<StandardNavigationMainController>(
      () => StandardNavigationMainController(),
    );
    Get.lazyPut<NestedNavigationMainController>(
      () => NestedNavigationMainController(),
    );
    Get.lazyPut<SubTabsNestedNavigationMainController>(
      () => SubTabsNestedNavigationMainController(),
    );

    Get.lazyPut<WarehouseListPageController>(
        () => WarehouseListPageController());
    Get.lazyPut<ProductTablePageController>(() => ProductTablePageController());
    Get.lazyPut<ProductManageMainPageController>(
        () => ProductManageMainPageController());
    Get.lazyPut<BaseManagementPageController>(
        () => BaseManagementPageController());
         Get.lazyPut<ChartController>(() => ChartController());
    // Get.lazyPut<ProducttableminpageController>(
    //     () => ProducttableminpageController());
        Get.lazyPut<WarehouselistminController>(() => WarehouselistminController());
        // Get.lazyPut<ProductdetailminController>(() => ProductdetailminController());
        Get.lazyPut<WarehouseinventoryController>(()=>WarehouseinventoryController());
        Get.lazyPut<TransportManagementPageController>(() => TransportManagementPageController());
        Get.lazyPut<DistributionListController>(() => DistributionListController());
        Get.lazyPut<VehicleListController>(() => VehicleListController());
        Get.lazyPut<DistributionStatusController>(() => DistributionStatusController());
        Get.lazyPut<DriverListController>(() => DriverListController());
        Get.lazyPut<SystemSettingController>(() => SystemSettingController());
            Get.lazyPut<OperateLogController>(() => OperateLogController());
            Get.lazyPut<LoginLogController>(() => LoginLogController());
}
}