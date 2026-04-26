import 'package:loggi_app/app/modules/product_table_detail/controllers/product_table_detail_controller.dart';
import 'package:get/get.dart';

class ProductTableDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductTableDetailController>(() => ProductTableDetailController());
  }

}