import 'package:loggi_app/app/data/models/commdity_vo.dart';
import 'package:loggi_app/app/data/models/commodity.dart';
import 'package:loggi_app/app/data/models/inventory.dart';
import 'package:loggi_app/app/data/models/inventory_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/network/api.dart';
import 'index.dart';

class WarehouseinventoryController extends GetxController with StateMixin<List<Inventory>> {
  WarehouseinventoryController();





  RxInt sortColumnIndex = 0.obs;
  RxBool isAscending = false.obs;
  RxString warehouseId = "".obs;
  RxList<Inventory> commo = [Inventory()].obs;
  Rx<Product> selectedCommo =Product().obs;
   Rx<Inventory> selectedCommoOut =Inventory().obs;
  RxList<Product> commoList = [Product()].obs;
  Rx<InventoryRecord> inventoryRecord= InventoryRecord().obs;
   Rx<InventoryRecord> inventoryRecordOut= InventoryRecord().obs;
  

  void onSort(int newIndex, bool newAscd) {
    isAscending(newAscd);
    sortColumnIndex(newIndex);
    debugPrint('$newIndex');
    debugPrint('$newAscd');
  }


 

  @override
  void onInit() {
    super.onInit();
    
    NbRequest().getAllProducts().then((value) => commoList(value)).then(
      (data){
        selectedCommo(commoList.first);}
    );
  

    change(commo, status: RxStatus.success());
    // Map<String,dynamic> args = Get.arguments;
    // NbRequest().getInventoryFromWarehouseId(args['warehouseId']).then((result) {
    //   change(result, status: RxStatus.success());
    //   commo(result);
    // }).onError((error, stackTrace) {
    //   change(null, status: RxStatus.error());
    // });
  }

  Future<bool> submitInven() async {
    return await NbRequest()
        .importAndExport(inventoryRecord.value,true)
        .then((value) {
      return value;
    });
  }
  Future<bool> submitOutven() async {
    return await NbRequest()
        .importAndExport(inventoryRecordOut.value,false)
        .then((value) {
      return value;
    });
  }



  updateData(){


        change(null, status: RxStatus.loading());
    NbRequest().getInventoryFromWarehouseId(warehouseId.value).then((result) {
      change(result, status: RxStatus.success());
      
      commo(result);
      selectedCommoOut(commo.first);
      
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
    inventoryRecord.update((val) {val!.wid=warehouseId.value;});
    inventoryRecordOut.update((val) {
        val!.wid=warehouseId.value;
      });
  }

  @override
  void onReady() {
    super.onReady();
        change(null, status: RxStatus.loading());
    NbRequest().getInventoryFromWarehouseId(warehouseId.value).then((result) {
      change(result, status: RxStatus.success());
      commo(result);
      selectedCommoOut(commo.first);
  
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
    inventoryRecord.update((val) {val!.wid=warehouseId.value;});
    inventoryRecordOut.update((val) {
        val!.wid=warehouseId.value;
      });
  }

  @override
  void onClose() {}

  void onSortList() {
    change(commo, status: RxStatus.success());
  }

 
}
