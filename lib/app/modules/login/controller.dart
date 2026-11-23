import 'package:loggi_app/app/data/network/container_access.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/auth/auth_provider.dart';

import '../../data/api/login_dto.dart';
import '../../data/api/login_vo.dart';
import '../../data/network/api_client.dart';
import '../../data/network/network_providers.dart';

class LoginController extends GetxController {
  LoginController();
  RxBool isVisible = false.obs;

  /// Why the last attempt failed, or null. The view turns it into words.
  final Rxn<Object> error = Rxn<Object>();
  RxBool loading = false.obs;
  Rx<LoginDto> loginData = LoginDto(email: '', password: '').obs;

  /// Signs in. Returns whether it worked; on failure [error] says why.
  ///
  /// The reason is kept rather than collapsed into "failed". It used to be a bool, and the
  /// screen answered every failure with "wrong e-mail or password" - including a locked
  /// address, where the password the reader had just typed may well have been right, and a
  /// phone with no network. The words are the view's to choose, because this class has no
  /// BuildContext and so cannot know the language.
  ///
  /// This was the last caller of the legacy `NbRequest`, whose methods returned null on any
  /// failure and so could not have said why even if asked.
  Future<bool> signIn() async {
    loading(true);
    error.value = null;
    try {
      final data = await appContainer
          .read(apiClientProvider)
          .post<dynamic>(
            '/admin/login/password',
            data: loginData.value.toJson(),
          );
      final login = decodeObject(data, LoginVo.fromJson);
      // Moves the session to signed-in, which is what the router watches. No navigation
      // call: the router's redirect is the one rule deciding where a signed-in user belongs.
      await appContainer.read(authProvider.notifier).signIn(login.token!);
      return true;
    } catch (e) {
      error.value = e;
      return false;
    } finally {
      loading(false);
    }
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
