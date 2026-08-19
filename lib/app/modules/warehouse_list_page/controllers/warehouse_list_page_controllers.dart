import 'package:loggi_app/app/data/network/api.dart';
import 'package:get/get.dart';
import '../../../data/api/warehouse_vo.dart';
class WarehouseListPageController
    extends GetxController with StateMixin<List<WarehouseVo>> {

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    NbRequest().requestGet4().then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }


  @override
  void onClose() {}

  void updateData(){
    change(null, status: RxStatus.loading());
    NbRequest().requestGet4().then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }
  

  }