import 'package:get/get.dart';
import 'package:loggi_app/app/data/repository.dart';

class ProductPageController
    extends GetxController with StateMixin<List<String>> {

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    Repository().getProducts.then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}