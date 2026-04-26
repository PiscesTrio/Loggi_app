import 'package:loggi_app/app/data/models/index.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';
import 'index.dart';

class DriverListController extends GetxController with StateMixin<List<Driver>> {
  DriverListController();
   static DriverListController get to => Get.find();

  /// 在 widget 内存中分配后立即调用。
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
