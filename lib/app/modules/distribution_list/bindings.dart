import 'package:get/get.dart';

import 'controller.dart';

class DistributionListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistributionListController>(() => DistributionListController());
  }
}
