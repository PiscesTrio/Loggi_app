import 'package:get/get.dart';

import 'controller.dart';

class ProducttableminpageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProducttableminpageController>(() => ProducttableminpageController());
  }
}
