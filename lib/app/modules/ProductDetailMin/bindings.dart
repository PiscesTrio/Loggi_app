import 'package:get/get.dart';

import 'controller.dart';

class ProductdetailminBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductdetailminController>(() => ProductdetailminController());
  }
}
