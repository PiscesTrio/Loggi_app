import 'package:get/get.dart';

import 'controller.dart';

class WarehouselistminBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarehouselistminController>(() => WarehouselistminController());
  }
}
