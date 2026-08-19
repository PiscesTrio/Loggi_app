import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/api/commodity_vo.dart';
import '../../data/api/inventory_movement_request.dart';
import '../../data/api/inventory_vo.dart';

import '../../data/network/api.dart';

class WarehouseinventoryController extends GetxController with StateMixin<List<InventoryVo>> {
  WarehouseinventoryController();





  RxInt sortColumnIndex = 0.obs;
  RxBool isAscending = false.obs;
  RxString warehouseId = "".obs;
  RxList<InventoryVo> commo = [InventoryVo()].obs;
  Rx<CommodityVo> selectedCommo = CommodityVo().obs;
   Rx<InventoryVo> selectedCommoOut = InventoryVo().obs;
  RxList<CommodityVo> commoList = [CommodityVo()].obs;
  Rx<InventoryMovementRequest> inventoryRecord =
      InventoryMovementRequest(warehouseId: '', commodityId: '', count: 0).obs;
   Rx<InventoryMovementRequest> inventoryRecordOut =
      InventoryMovementRequest(warehouseId: '', commodityId: '', count: 0).obs;
  

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
        if (commoList.isNotEmpty) selectedCommo(commoList.first);
      }
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

  /// The commodity comes from the dropdown's selection, read at submit.
  ///
  /// It used to be copied into the draft by the dropdown's onChanged, which meant the
  /// selection and the request held it separately — and a dropdown renders its first item
  /// without firing onChanged, so opening the form and pressing 确认 sent an empty
  /// commodity id under a dropdown that was plainly showing one. The server rejected it
  /// with 商品不能为空 and the screen just sat there.
  Future<bool> submitInven() async {
    return await NbRequest()
        .importAndExport(
            inventoryRecord.value
                .copyWith(commodityId: selectedCommo.value.id ?? ''),
            true)
        .then((value) {
      return value;
    });
  }
  /// Same as [submitInven]: the outbound selection is an existing stock row, and the
  /// commodity it names is read from it rather than mirrored into the draft.
  Future<bool> submitOutven() async {
    return await NbRequest()
        .importAndExport(
            inventoryRecordOut.value
                .copyWith(commodityId: selectedCommoOut.value.commodityId ?? ''),
            false)
        .then((value) {
      return value;
    });
  }



  void updateData(){


        change(null, status: RxStatus.loading());
    NbRequest().getInventoryFromWarehouseId(warehouseId.value).then((result) {
      change(result, status: RxStatus.success());
      
      commo(result);
      if (commo.isNotEmpty) selectedCommoOut(commo.first);
      
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
    // Replaced rather than mutated. The generated request is immutable, and an Rx whose
    // value is edited in place never reports a change to anything comparing old with new.
    inventoryRecord.value =
        inventoryRecord.value.copyWith(warehouseId: warehouseId.value);
    inventoryRecordOut.value =
        inventoryRecordOut.value.copyWith(warehouseId: warehouseId.value);
  }

  @override
  void onReady() {
    super.onReady();
        change(null, status: RxStatus.loading());
    NbRequest().getInventoryFromWarehouseId(warehouseId.value).then((result) {
      change(result, status: RxStatus.success());
      commo(result);
      if (commo.isNotEmpty) selectedCommoOut(commo.first);
  
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
    // Replaced rather than mutated. The generated request is immutable, and an Rx whose
    // value is edited in place never reports a change to anything comparing old with new.
    inventoryRecord.value =
        inventoryRecord.value.copyWith(warehouseId: warehouseId.value);
    inventoryRecordOut.value =
        inventoryRecordOut.value.copyWith(warehouseId: warehouseId.value);
  }

  @override
  void onClose() {}

  void onSortList() {
    change(commo, status: RxStatus.success());
  }

 
}
