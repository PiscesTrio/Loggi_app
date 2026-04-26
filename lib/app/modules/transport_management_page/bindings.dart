import 'package:get/get.dart';

import 'controller.dart';

class TransportManagementPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransportManagementPageController>(() => TransportManagementPageController());
  }
}
