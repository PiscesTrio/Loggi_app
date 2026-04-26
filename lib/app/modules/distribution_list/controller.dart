import 'package:loggi_app/app/modules/driver_list/controller.dart';
import 'package:get/get.dart';

import '../../data/models/distribution.dart';
import '../../data/network/api.dart';
import '../vehicle_list/controller.dart';
import 'index.dart';

class DistributionListController extends GetxController
    with StateMixin<List<Distribution>> {
  DistributionListController();
    static DistributionListController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    NbRequest()
        .getDistribution()
        .then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  updateStatus(Distribution data) {
    NbRequest().updateDistribution(data).then((value) {
      change(null, status: RxStatus.loading());
      NbRequest().getDistribution().then((result) {
        change(result, status: RxStatus.success());
        VehicleListController.to.updateData();
        DriverListController.to.updateData();
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
      });
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateData() {
    change(null, status: RxStatus.loading());
    NbRequest()
        .getDistribution()
        .then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
