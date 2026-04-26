import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/models/commodity.dart';
import '../../data/network/api.dart';
import '../../routes/app_pages.dart';

class ProducttableminpageController extends GetxController with StateMixin<List<Product>> {
  ProducttableminpageController();


  
static ProducttableminpageController get to => Get.find();

  RxInt sortColumnIndex = 0.obs;
  RxBool isAscending = false.obs;
  RxList<Product> commo = [Product()].obs;

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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onSortList() {
    change(commo, status: RxStatus.success());
  }

  updateData(){
    change(null, status: RxStatus.loading());
    NbRequest().getAllProducts().then((result) {
      change(result, status: RxStatus.success());
      commo(result);
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }
}
