import 'package:loggi_app/app/data/models/index.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';

class DistributionStatusController extends GetxController with StateMixin<List<DistributionStatus>>{
  DistributionStatusController();

  Rx<Distribution> distribution = Distribution(

  ).obs;



  /// Called immediately after the widget is allocated in memory.
  @override
  void onInit() {

    super.onInit();

  }

  /// Called 1 frame after onInit(). The ideal place for entry logic.
  @override
  void onReady() {

    super.onReady();
    change(null, status: RxStatus.loading());
    NbRequest()
        .getStatus(distribution.value.id!)
        .then((result) => change(sortByTime(result!), status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));


  }



  void updateData(){
        change(null, status: RxStatus.loading());
    NbRequest()
        .getStatus(distribution.value.id!)
        .then((result) => change(sortByTime(result!), status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  /// Called before the [onDelete] method.
  @override
  void onClose() {
    super.onClose();
  }

  List<DistributionStatus> sortByTime(List<DistributionStatus> data){
    data.sort(((a, b) =>(b.time)!.compareTo(a.time!)));
    return data;

  }

  /// dispose releases memory
  @override
  void dispose() {
    super.dispose();
  }
}
