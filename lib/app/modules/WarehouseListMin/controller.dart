import 'package:get/get.dart';

import '../../data/models/warehouse.dart';
import '../../data/network/api.dart';
import 'index.dart';

class WarehouselistminController extends GetxController  with StateMixin<List<Warehouse>> {
  WarehouselistminController();
  
  RxBool saveWarehouseLoading = false.obs;



  Future<bool> saveWarehouse(Warehouse data) async{
    saveWarehouseLoading(true);
    return await  NbRequest().saveWarehouse(data).then((value) {
      saveWarehouseLoading(false);
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
