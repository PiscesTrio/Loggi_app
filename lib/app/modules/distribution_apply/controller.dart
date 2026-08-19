import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:get/get.dart';

import '../../data/delivery_points.dart';
import '../../data/network/api.dart';
import 'package:intl/intl.dart';
import 'package:loggi_app/app/data/network/container_access.dart';
import 'package:loggi_app/app/router/app_router.dart';

class DistributionApplyController extends GetxController
    with StateMixin<Available> {
  DistributionApplyController();
  Rx<Distribution> distribution =
      // No id. A new order does not have one — the server generates it
      // (@GeneratedValue on Distribution.id). Sending the empty string made Hibernate
      // treat the payload as an existing row to update, look for id '', find nothing, and
      // throw StaleObjectStateException; the client saw a failed request and, because
      // NbRequest folds failures into null, showed nothing at all. Creating a delivery
      // order has been broken this whole time, on both sides of this slice — verified by
      // submitting the same form on the previous build.
      Distribution(urgent: false, status: 0).obs;
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
        // The dropdown opens on the first warehouse but only writes to the order when
        // the user *changes* the selection, so a form submitted without touching it
        // carries whatever the initial value had. `wid` was fixed here once; the two
        // coordinates were left behind, and an order created without touching the
        // dropdown was stored with from_lat/from_lng = 0 — the Gulf of Guinea, which the
        // route view would happily draw a line from. Invisible until now only because
        // creating an order failed outright.
        distribution.value = distribution.value.copyWith(
          wid: wareHouseList[0].name,
          fromLat: wareHouseList[0].lat,
          fromLng: wareHouseList[0].lng,
        );
      });
      if (result == null ||
          result.drivers!.isEmpty ||
          result.vehicles!.isEmpty) {
        // No BuildContext in a controller, so the router is reached through the
        // container rather than through context. GoRouter is an object; `of(context)` is
        // only a lookup.
        appContainer.read(routerProvider).pop();

        showTextToast("无可用司机或驾驶员");
      } else {
        selectedDriver(result.drivers![0]);
        selectedVehicle(result.vehicles![0]);
        // One replacement instead of four in-place writes. `Rx.update` mutated the
        // object every listener was already holding, so "the value changed" and "the
        // listeners were told" were separate events that could interleave.
        distribution.value = distribution.value.copyWith(
          driver: result.drivers![0].name,
          did: result.drivers![0].id,
          vid: result.vehicles![0].id,
          number: result.vehicles![0].number,
        );

        change(result, status: RxStatus.success());
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });

    updateTime();
  }

  void updateTime() {
    distribution.value = distribution.value.copyWith(
      time: DateFormat("yyyy-MM-dd kk:mm:ss").format(dateTime.value),
    );
  }

  /// Destination is chosen from [kDeliveryPoints], so its coordinates are known
  /// up front and no geocoding round-trip is needed.
  void selectDeliveryPoint(DeliveryPoint? point) {
    selectedDeliveryPoint(point);
    distribution.value = distribution.value.copyWith(
      address: point?.address,
      toLat: point?.lat,
      toLng: point?.lng,
    );
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

  void generateCares() {
    String temp = "";
    for (var element in selectedCares) {
      temp = "$temp$element,";
    }
    distribution.value = distribution.value.copyWith(care: temp);
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
