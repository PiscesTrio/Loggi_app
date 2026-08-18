import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/data/network/options.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:loggi_app/app/utils/TokenStorage.dart';
import 'package:get/get.dart';


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
        ApiOptions().setToken(token: value.token!);});
        
    } catch (e) {
      failed(true);
    }
    loading(false);
  }


  /// Called immediately after the widget is allocated in memory.
  @override
  void onInit() {
    super.onInit();
  }

  /// Called 1 frame after onInit(). The ideal place to enter navigation events.
  @override
  void onReady() {
    super.onReady();
  }

  /// Called before the [onDelete] method.
  @override
  void onClose() {
    super.onClose();
  }

  /// Releases memory on dispose.
  @override
  void dispose() {
    super.dispose();
  }
}
