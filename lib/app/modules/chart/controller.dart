import 'package:loggi_app/app/data/network/api.dart';
import 'package:get/get.dart';

import '../../data/models/commdity_vo.dart';
import 'index.dart';

class ChartController extends GetxController
    with StateMixin<Map<String, List<CommdityVo>>> {
  RxMap<String, List<CommdityVo>>tempData =
      <String, List<CommdityVo>>{}.obs;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    NbRequest().getChartData(true).then((result) {
      tempData.addAll({"in": result!});
    }).then((data) {
      NbRequest().getChartData(false).then((result) {
        tempData.addAll({"out": result!});
      });
    }).then((value) {
      change(tempData, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }

  updateData(){
     change(null, status: RxStatus.loading());
    NbRequest().getChartData(true).then((result) {
      tempData.addAll({"in": result!});
    }).then((data) {
      NbRequest().getChartData(false).then((result) {
        tempData.addAll({"out": result!});
      });
    }).then((value) {
      change(tempData, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
