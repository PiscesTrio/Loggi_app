import 'package:get/get.dart';

import 'controller.dart';

class OperateLogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OperateLogController>(() => OperateLogController());
  }
}
