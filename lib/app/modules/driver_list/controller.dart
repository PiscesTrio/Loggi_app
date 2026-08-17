import 'package:loggi_app/app/data/models/index.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';

class DriverListController extends GetxController with StateMixin<List<Driver>> {
  DriverListController();
   static DriverListController get to => Get.find();

  /// Called immediately after the widget is allocated in memory.
  @override
  void onInit() {
    super.onInit();
       super.onInit();
      change(null, status: RxStatus.loading());
    NbRequest()
        .getDrivers()
        .then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

   updateData() {
    change(null, status: RxStatus.loading());
    NbRequest()
        .getDrivers()
        .then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
        update();
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

  /// dispose frees memory.
  @override
  void dispose() {
    super.dispose();
  }
}
