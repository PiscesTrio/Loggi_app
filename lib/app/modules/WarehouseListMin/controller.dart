import 'package:get/get.dart';
import '../../data/api/warehouse_request.dart';
import '../../data/api/warehouse_vo.dart';

import '../../data/network/api.dart';

class WarehouselistminController extends GetxController  with StateMixin<List<WarehouseVo>> {
  WarehouselistminController();
  
  RxBool saveWarehouseLoading = false.obs;



  Future<bool> saveWarehouse(WarehouseRequest data) async {
    saveWarehouseLoading(true);
    return await NbRequest().saveWarehouse(data).then((value) {
      saveWarehouseLoading(false);
      // Reload on success. The list was only ever fetched in onInit, so a warehouse saved
      // here showed 保存成功 over a list that did not contain it — the row was on the
      // server and the screen disagreed until something else rebuilt it. The commodity
      // dialog already did this; this one was simply missing it.
      if (value) updateData();
      return value;
    });
  }


  
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
