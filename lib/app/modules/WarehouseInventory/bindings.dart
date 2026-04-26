import 'package:get/get.dart';

import 'controller.dart';

class WarehouseinventoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarehouseinventoryController>(() => WarehouseinventoryController());
  }
}
