import 'package:get/get.dart';

import 'controller.dart';

class SystemSettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SystemSettingController>(() => SystemSettingController());
  }
}
