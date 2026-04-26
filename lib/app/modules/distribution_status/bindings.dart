import 'package:get/get.dart';

import 'controller.dart';

class DistributionStatusBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistributionStatusController>(() => DistributionStatusController());
  }
}
