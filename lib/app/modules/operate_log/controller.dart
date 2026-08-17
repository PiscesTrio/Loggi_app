import 'package:loggi_app/app/data/models/syslog.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';
import 'index.dart';

class OperateLogController extends GetxController with StateMixin<List<SysLog>>{
  OperateLogController();




  /// Called immediately after the widget is allocated in memory.
  @override
  void onInit() {
    super.onInit();
      change(null, status: RxStatus.loading());
    NbRequest().getSysLog().then((result) => change(sortByTime(result!), status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  updateData(){
     NbRequest().getSysLog().then((result) => change(sortByTime(result!), status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

    List<SysLog> sortByTime(List<SysLog> data){
    data.sort(((a, b) =>(b.time)!.compareTo(a.time!)));
    return data;

  }

  /// Called 1 frame after onInit(). The ideal place for entry-point logic.
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
