import 'package:get/get.dart';

import 'controller.dart';

class VehicleListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleListController>(() => VehicleListController());
  }
}
