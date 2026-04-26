import 'package:get/get.dart';

import 'controller.dart';

class DriverListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverListController>(() => DriverListController());
  }
}
