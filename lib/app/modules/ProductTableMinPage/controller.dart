import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/api/commodity_vo.dart';

import '../../data/network/api.dart';

class ProducttableminpageController extends GetxController with StateMixin<List<CommodityVo>> {
  ProducttableminpageController();


  
static ProducttableminpageController get to => Get.find();

  RxInt sortColumnIndex = 0.obs;
  RxBool isAscending = false.obs;
  RxList<CommodityVo> commo = [CommodityVo()].obs;

  void onSort(int newIndex, bool newAscd) {
    isAscending(newAscd);
    sortColumnIndex(newIndex);
    debugPrint('$newIndex');
    debugPrint('$newAscd');
  }

  @override
  void onInit() {
    super.onInit();
        // tabController = TabController(length: 2);
    // tabController.addListener(() {
    //   tabIndex.value = tabController.index;
    // });
    change(null, status: RxStatus.loading());
    NbRequest().getAllProducts().then((result) {
      change(result, status: RxStatus.success());
      commo(result);
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }


  @override
  void onClose() {}

  void onSortList() {
    change(commo, status: RxStatus.success());
  }

  void updateData(){
    change(null, status: RxStatus.loading());
    NbRequest().getAllProducts().then((result) {
      change(result, status: RxStatus.success());
      commo(result);
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }
}
