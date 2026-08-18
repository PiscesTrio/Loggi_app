import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TransportManagementPageController extends GetxController with GetTickerProviderStateMixin{
  TransportManagementPageController();


  late TabController tabController;
  final tabIndex = 0.obs;

    @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      tabIndex.value = tabController.index;
    });
  }


  @override
  void onClose() {}

  /// dispose frees memory.
  @override
  void dispose() {
    super.dispose();
  }
}
