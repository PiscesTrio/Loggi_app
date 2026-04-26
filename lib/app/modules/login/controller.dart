import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/data/network/options.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:loggi_app/app/utils/TokenStorage.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginController extends GetxController {
  LoginController();
  RxBool isVisible = false.obs;
  RxBool failed= false.obs;
  RxBool loading= false.obs;
  Rx<LoginDto> loginData = LoginDto().obs;
  Future signIn()async{
    loading(true);
    try {
      await NbRequest().login(loginData.value).then(
        (value) {TokenStorage().setToken(tokenString: value!.token!);
        showTextToast("登录成功");
        print(value.admin!.email);
        print(TokenStorage().getToken());
        ApiOptions().setToken(token: value.token!);});
        
    } catch (e) {
      failed(true);
    }
    loading(false);
  }


  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
