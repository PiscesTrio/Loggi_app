import 'package:get/get.dart';

import '../vehicle_list/controller.dart';
import 'controller.dart';

class DistributionApplyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistributionApplyController>(() => DistributionApplyController());
    Get.lazyPut<VehicleListController>(() => VehicleListController());
  }
}
