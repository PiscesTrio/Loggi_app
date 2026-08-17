import 'package:loggi_app/app/data/models/vehicle.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';
import 'index.dart';

class VehicleListController extends GetxController with StateMixin<List<Vehicle>> {

  Rx<Vehicle> vehicle = Vehicle(type: "货车").obs;



  VehicleListController();
   static VehicleListController get to => Get.find();
  /// Called immediately after the widget is allocated in memory.
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

  

  /// Called 1 frame after onInit(). Ideal place for on-enter work.
  @override
  void onReady() {
    super.onReady();
  }

  /// Called before the [onDelete] method.
  @override
  void onClose() {
    super.onClose();
  }

  /// [dispose] releases memory.
  @override
  void dispose() {
    super.dispose();
  }
}
