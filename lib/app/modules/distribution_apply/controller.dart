import 'package:loggi_app/app/data/models/available.dart';
import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/data/models/vehicle.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/distribution.dart';
import '../../data/models/driver.dart';
import '../../data/network/api.dart';
import 'index.dart';
import 'package:intl/intl.dart';

class DistributionApplyController extends GetxController
    with StateMixin<Available> {
  DistributionApplyController();
  Rx<Distribution> distribution =
      Distribution(id: "", urgent: false, status: 0).obs;
  Rx<Driver> selectedDriver = Driver().obs;
  Rx<Vehicle> selectedVehicle = Vehicle().obs;
  Rx<Warehouse> selectedWarehouse = Warehouse().obs;
  Rx<DateTime> dateTime = DateTime.now().obs;
  RxList<String> selectedCares = sb.obs;
  RxList<Warehouse> wareHouseList = [Warehouse()].obs;
  static final List<String> sb = [];

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    NbRequest().findAvailable().then((result) {
      NbRequest().requestGet4().then((value) {
        wareHouseList(value);
        selectedWarehouse(wareHouseList[0]);
      });
      if (result == null ||
          result.drivers!.isEmpty ||
          result.vehicles!.isEmpty) {
        Get.back(id: 6);

        showTextToast("无可用司机或驾驶员");
      } else {
        selectedDriver(result.drivers![0]);
        selectedVehicle(result.vehicles![0]);
        distribution.update((val) {
          val!.driver = result.drivers![0].name;
          val.did = result.drivers![0].id;
          val.vid = result.vehicles![0].id;
          val.number = result.vehicles![0].number;
        });

        change(result, status: RxStatus.success());
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });

    updateTime();
  }

  updateTime() {
    distribution.update((val) {
      val!.time = DateFormat("yyyy-MM-dd kk:mm:ss").format(dateTime.value);
    });
  }

  textToLocation() {
    NbRequest().textToLocation(distribution.value.address!).then((value) {
      distribution.update((self) {
        self!.toLat = value!.lat;
        self.toLng = value.lng;
      });
    });
  }

  Future<bool> submitDis() async {
    return await NbRequest()
        .textToLocation(distribution.value.address!)
        .then((value) {
      distribution.update((self) {
        self!.toLat = value!.lat;
        self.toLng = value.lng;
        Future.delayed(const Duration(seconds: 4), ()=> print(value));
      });
    }).then((value) async {
      return await NbRequest()
          .updateDistribution(distribution.value)
          .then((value) async {
        if (value != null) {
          return await NbRequest().submitStatus(DistributionStatus(
              disId: value.id,
              lat: value.fromLat,
              lng: value.fromLng,
              status: 0,
              location: value.wid));
        } else {
          return false;
        }
      });
    });
  }

  generateCares() {
    String temp = "";
    for (var element in selectedCares) {
      temp = "$temp$element,";
    }
    distribution.update((val) {
      val!.care = temp;
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    // distribution(Distribution(driver: state!.drivers![0].name));
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
