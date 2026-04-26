import 'package:loggi_app/app/data/models/commodity.dart';
import 'package:loggi_app/app/modules/product_manage_main_page/controllers/product_manage_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:loggi_app/constants.dart';

import '../controllers/product_table_detail_controller.dart';



class ProductTableDetailView
    extends GetView<ProductTableDetailController> {
  Product argument;
  ProductTableDetailView({Key? key, required this.argument})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SbView'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Argument from main page is: ${argument.name}'),
          const SizedBox(
            height: 50,
          ),

          OutlinedButton(
            onPressed: () => Get.back(
              id: 4,
            ),
            child: const Text('Go back with argument'),
          )
        ],
      ),
    );
  }
}