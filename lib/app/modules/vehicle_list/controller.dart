import 'package:loggi_app/app/data/models/vehicle.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';
import 'index.dart';

class VehicleListController extends GetxController with StateMixin<List<Vehicle>> {

  Rx<Vehicle> vehicle = Vehicle(type: "货车").obs;



  VehicleListController();
   static VehicleListController get to => Get.find();
  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
      change(null, status: RxStatus.loading());
    NbRequest()
        .getVehicles()
        .then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  updateData() {
    change(null, status: RxStatus.loading());
    NbRequest()
        .getVehicles()
        .then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
        update();
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
