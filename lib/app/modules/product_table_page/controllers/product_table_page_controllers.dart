import 'package:loggi_app/app/data/models/commodity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/network/api.dart';
import '../../../routes/app_pages.dart';

class ProductTablePageController extends GetxController
    with StateMixin<List<Product>>  {



  //   late TabController tabController;
  // final tabIndex = 0.obs;

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

    Future goToDetailPage(Product product) async {
    var result = await Get.toNamed(Routes.PRODUCT_TABLE_DETAL,
        arguments: product);
    // argumentFromDetailPage.value =
    // result == null ? 'No argument' : (result as double).toStringAsFixed(0);
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
