import 'package:get/get.dart';
import '../../data/api/login_log_vo.dart';

import '../../data/network/api.dart';

class LoginLogController extends GetxController with StateMixin<List<LoginLogVo>>{
  LoginLogController();




  /// Called immediately after the widget is allocated in memory.
  @override
  void onInit() {
    super.onInit();
      change(null, status: RxStatus.loading());
    NbRequest().getLoginLog().then((result) => change(sortByTime(result?.items ?? const []), status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  void updateData(){
     NbRequest().getLoginLog().then((result) => change(sortByTime(result?.items ?? const []), status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

    List<LoginLogVo> sortByTime(List<LoginLogVo> data){
    data.sort(((a, b) =>(b.date)!.compareTo(a.date!)));
    return data;

  }

  /// Called 1 frame after onInit(). The ideal place for entry logic.
  @override
  void onReady() {
    super.onReady();
  }

  /// Called before the [onDelete] method.
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose releases memory
  @override
  void dispose() {
    super.dispose();
  }
}
