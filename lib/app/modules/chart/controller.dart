import 'package:loggi_app/app/data/network/api.dart';
import 'package:get/get.dart';
import '../../data/api/commodity_chart_vo.dart';


class ChartController extends GetxController
    with StateMixin<Map<String, List<CommodityChartVo>>> {
  RxMap<String, List<CommodityChartVo>>tempData =
      <String, List<CommodityChartVo>>{}.obs;

  /// The two series, empty until the corresponding request answers.
  ///
  /// The chart renders from the first frame — nothing in the view consults the
  /// StateMixin status this controller maintains — so these keys are simply
  /// absent for the first few frames. The view used to reach into the map and
  /// unwrap with `!`, which threw on every frame until the data arrived. That
  /// error never reached logcat and was gone before any screenshot, which is
  /// how it survived unnoticed.
  List<CommodityChartVo> get inSeries => tempData["in"] ?? const [];
  List<CommodityChartVo> get outSeries => tempData["out"] ?? const [];

  /// Called immediately after the widget is allocated in memory.
  @override
  void onInit() {
    super.onInit();
    updateData();
  }

  void updateData(){
     change(null, status: RxStatus.loading());
    // The inner future used to be created but not returned, so the chain moved
    // on and reported success while the "out" request was still in flight.
    NbRequest()
        .getChartData(true)
        .then((result) => tempData.addAll({"in": result!}))
        .then((_) => NbRequest().getChartData(false))
        .then((result) => tempData.addAll({"out": result!}))
        .then((_) => change(tempData, status: RxStatus.success()))
        .onError((error, stackTrace) =>
            change(null, status: RxStatus.error()));
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
