import 'package:loggi_app/app/data/models/available.dart';
import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/data/models/vehicle.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/delivery_points.dart';
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
  Rx<DeliveryPoint?> selectedDeliveryPoint = Rx<DeliveryPoint?>(null);
  Rx<DateTime> dateTime = DateTime.now().obs;
  RxList<String> selectedCares = sb.obs;
  RxList<Warehouse> wareHouseList = [Warehouse()].obs;
  static final List<String> sb = [];

  /// Called immediately after the widget is allocated in memory.
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    NbRequest().findAvailable().then((result) {
      NbRequest().requestGet4().then((value) {
        wareHouseList(value);
        selectedWarehouse(wareHouseList[0]);
        // The dropdown opens on the first warehouse but only writes wid when the
        // user *changes* the selection, so a form submitted without touching it
        // used to send wid == null.
        distribution.update((val) => val!.wid = wareHouseList[0].name);
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

  /// Destination is chosen from [kDeliveryPoints], so its coordinates are known
  /// up front and no geocoding round-trip is needed.
  void selectDeliveryPoint(DeliveryPoint? point) {
    selectedDeliveryPoint(point);
    distribution.update((val) {
      val!.address = point?.address;
      val.toLat = point?.lat;
      val.toLng = point?.lng;
    });
  }

  Future<bool> submitDis() async {
    final saved = await NbRequest().updateDistribution(distribution.value);
    if (saved == null) return false;
    return await NbRequest().submitStatus(DistributionStatus(
      disId: saved.id,
      lat: saved.fromLat,
      lng: saved.fromLng,
      status: 0,
      // wid carries the warehouse *name* (see the warehouse dropdown), which is
      // what the status timeline renders. Fall back to the current selection for
      // requests submitted without ever touching that dropdown.
      location: saved.wid ?? selectedWarehouse.value.name,
    ));
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

  /// Called 1 frame after onInit(). The ideal place to enter navigation events.
  @override
  void onReady() {
    super.onReady();
    // distribution(Distribution(driver: state!.drivers![0].name));
  }

  /// Called before the [onDelete] method.
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose releases memory
  @override
  void dispose() {
    super.dispose();
  }
}
