import 'package:loggi_app/app/data/models/warehouse.dart';
import 'package:loggi_app/app/data/network/api.dart';
import 'package:get/get.dart';
import 'package:loggi_app/app/data/repository.dart';

class WarehouseListPageController
    extends GetxController with StateMixin<List<Warehouse>> {

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    NbRequest().requestGet4().then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateData(){
    change(null, status: RxStatus.loading());
    NbRequest().requestGet4().then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }
  

  }