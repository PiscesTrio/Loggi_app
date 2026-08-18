import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/data/network/legacy_bridge.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/routes/app_pages.dart';


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
        (value) async {
        // One write reaches both stacks: secure storage for the new client, and the legacy
        // Dio's header until the last NbRequest caller is gone. Previously this wrote the
        // token to an unencrypted GetStorage file and separately pushed it onto a global
        // singleton, and the two could disagree.
        await saveToken(value!.token!);
        showTextToast("登录成功");
        // Navigating here rather than from a GetStorage listener inside build().
        // Two such listeners existed, one per screen, neither ever disposed, so
        // every rebuild added another and one token write fired several
        // navigations. offAllNamed also guarantees a single home shell.
        Get.offAllNamed(Routes.home);});
        
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
