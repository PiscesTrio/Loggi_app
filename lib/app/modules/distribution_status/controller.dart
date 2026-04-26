import 'package:loggi_app/app/data/models/index.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';
import 'index.dart';

class DistributionStatusController extends GetxController with StateMixin<List<DistributionStatus>>{
  DistributionStatusController();

  Rx<Distribution> distribution = Distribution(

  ).obs;



  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {

    super.onInit();

  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {

    super.onReady();
    change(null, status: RxStatus.loading());
    NbRequest()
        .getStatus(distribution.value.id!)
        .then((result) => change(sortByTime(result!), status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));


  }



  updateData(){
        change(null, status: RxStatus.loading());
    NbRequest()
        .getStatus(distribution.value.id!)
        .then((result) => change(sortByTime(result!), status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  List<DistributionStatus> sortByTime(List<DistributionStatus> data){
    data.sort(((a, b) =>(b.time)!.compareTo(a.time!)));
    return data;

  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
