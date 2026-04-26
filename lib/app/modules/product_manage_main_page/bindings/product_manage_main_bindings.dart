import 'package:loggi_app/app/modules/product_manage_main_page/controllers/product_manage_main_controller.dart';
import 'package:get/get.dart';

class ProductManageMainPageBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ProductManageMainPageController>(() => ProductManageMainPageController());
  }

}