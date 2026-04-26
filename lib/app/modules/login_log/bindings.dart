import 'package:get/get.dart';

import 'controller.dart';

class LoginLogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginLogController>(() => LoginLogController());
  }
}
