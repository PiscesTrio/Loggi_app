import 'package:loggi_app/app/modules/base_mangement_page/base_mangement_page_controller.dart';
import 'package:get/get.dart';

class BaseManagementPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseManagementPageController>(() => BaseManagementPageController());  }

}