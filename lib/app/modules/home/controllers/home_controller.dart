import 'package:loggi_app/app/utils/TokenStorage.dart';
import 'package:get/get.dart';

import '../../../data/network/options.dart';

class HomeController extends GetxController {
  RxInt tabIndex = 0.obs;

  void  onTabClick(int newTab) {
    print('Tab $newTab');
    tabIndex(newTab);
  }

  @override
  void onInit() {
    super.onInit();
    ApiOptions().setToken(token: TokenStorage().getToken());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
