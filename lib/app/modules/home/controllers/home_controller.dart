import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt tabIndex = 0.obs;

  void  onTabClick(int newTab) {
    tabIndex(newTab);
  }

  // onInit used to call ApiOptions().setToken(TokenStorage().getToken()) — attaching the
  // credential from a screen, which meant every future entry point had to remember to do
  // the same, and forgetting produced an app that looked signed in and got 401s. It is now
  // AuthInterceptor's job, on every request, without anyone asking.


  @override
  void onClose() {}
}
