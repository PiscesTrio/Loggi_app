import 'package:loggi_app/app/data/network/api.dart';
import 'package:get/get.dart';

import '../../data/models/commdity_vo.dart';

class ChartController extends GetxController
    with StateMixin<Map<String, List<CommdityVo>>> {
  RxMap<String, List<CommdityVo>>tempData =
      <String, List<CommdityVo>>{}.obs;

  /// Called immediately after the widget is allocated in memory.
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

  void updateData(){
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

  /// Called 1 frame after onInit(). The ideal place for entry logic.
  @override
  void onReady() {
    super.onReady();
  }

  /// Called before the [onDelete] method.
  @override
  void onClose() {
    super.onClose();
  }

  /// Frees memory on dispose.
  @override
  void dispose() {
    super.dispose();
  }
}
