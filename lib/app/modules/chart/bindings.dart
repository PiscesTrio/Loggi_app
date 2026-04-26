import 'package:get/get.dart';

import 'controller.dart';

class ChartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartController>(() => ChartController());
  }
}
