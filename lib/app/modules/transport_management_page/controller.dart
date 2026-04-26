import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TransportManagementPageController extends GetxController with GetTickerProviderStateMixin{
  TransportManagementPageController();

  final state = TransportManagementPageState();

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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
