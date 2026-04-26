

import 'package:loggi_app/app/modules/warehouse_list_page/controllers/warehouse_list_page_controllers.dart';
import 'package:get/get.dart';

class WarehouseListPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WarehouseListPageController>(() => WarehouseListPageController());
  }

}