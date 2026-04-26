import 'package:loggi_app/app/data/models/commodity.dart';
import 'package:loggi_app/app/modules/product_manage_main_page/controllers/product_manage_main_controller.dart';
import 'package:loggi_app/app/modules/product_table_detail/bindings/product_table_detail_binding.dart';
import 'package:loggi_app/app/modules/product_table_detail/views/product_table_detail_view.dart';
import 'package:loggi_app/app/modules/product_table_page/bindings/product_table_page_bindings.dart';
import 'package:loggi_app/app/modules/product_table_page/views/product_table_page_views.dart';
import 'package:loggi_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductManageMainPageView extends GetView<ProductManageMainPageController> {
  const ProductManageMainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(4),
      initialRoute: Routes.PRODUCTS,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.PRODUCTS:
                //  return MaterialPageRoute(builder: (context) {
                //     return ProductTablePage();
                //   });
            return GetPageRoute(
                routeName: Routes.PRODUCTS,
                page: () => ProductTablePage(),
                transition: Transition.circularReveal,
                popGesture: true,
                maintainState: true,
                binding: ProductTablePageBinding());
          case Routes.PRODUCT_TABLE_DETAL:
            return GetPageRoute(
                routeName: Routes.PRODUCT_TABLE_DETAL,
                page: () => ProductTableDetailView(
                    argument: settings.arguments as Product),
                transition: Transition.circularReveal,
                popGesture: true,
                maintainState: true,
                binding: ProductTableDetailBinding());
          default:
        }
      },
    );
  }
}
