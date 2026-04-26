import 'package:loggi_app/app/data/models/syslog.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';
import 'index.dart';

class OperateLogController extends GetxController with StateMixin<List<SysLog>>{
  OperateLogController();




  /// 在 widget 内存中分配后立即调用。
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
