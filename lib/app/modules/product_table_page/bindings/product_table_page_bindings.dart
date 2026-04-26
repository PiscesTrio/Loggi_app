import 'package:get/get.dart';

import '../controllers/product_table_page_controllers.dart';

class ProductTablePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductTablePageController>(() => ProductTablePageController());
  }

}