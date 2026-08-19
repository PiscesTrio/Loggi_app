import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/data/network/container_access.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/auth/auth_provider.dart';
import '../../data/api/login_dto.dart';


class LoginController extends GetxController {
  LoginController();
  RxBool isVisible = false.obs;
  RxBool failed= false.obs;
  RxBool loading= false.obs;
  Rx<LoginDto> loginData = LoginDto(email: '', password: '').obs;
  Future signIn()async{
    loading(true);
    try {
      await NbRequest().login(loginData.value).then(
        (value) async {
        // One write reaches both stacks — secure storage for the new client, the legacy
        // Dio's header until the last NbRequest caller is gone — and moves the session to
        // signed-in, which is what the router watches.
        await appContainer.read(authProvider.notifier).signIn(value!.token!);
        showTextToast("登录成功");
        // No navigation call. The router's redirect reacts to the session change, so
        // there is one rule deciding where a signed-in user belongs instead of a rule and
        // a scattering of navigation calls that have to agree with it.
        });
        
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
