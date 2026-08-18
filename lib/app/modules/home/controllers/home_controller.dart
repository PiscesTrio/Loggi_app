import 'package:loggi_app/app/utils/token_storage.dart';
import 'package:get/get.dart';

import '../../../data/network/options.dart';

class HomeController extends GetxController {
  RxInt tabIndex = 0.obs;

  void  onTabClick(int newTab) {
    tabIndex(newTab);
  }

  @override
  void onInit() {
    super.onInit();
    ApiOptions().setToken(token: TokenStorage().getToken());
  }


  @override
  void onClose() {}
}
