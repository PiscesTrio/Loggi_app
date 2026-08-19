import 'package:get/get.dart';

import 'controller.dart';

class DistributionApplyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistributionApplyController>(() => DistributionApplyController());
  }
}
