import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/modules/product_table_detail/controllers/product_table_detail_controller.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/commodity.dart';
import '../../theme/color_palette.dart';
import '../ProductTableMinPage/controller.dart';
import 'index.dart';

class ProductdetailminPage extends GetView<ProductdetailminController> {
  final Map<String,dynamic> arguments;
 
  const ProductdetailminPage( {Key? key,required this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Product product = arguments['product'];
    return GetBuilder<ProductdetailminController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                        color: ColorPalette.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         
                            Container(
                              decoration: BoxDecoration(
                                color: ColorPalette.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 6,
                                    color:
                                        ColorPalette.nileBlue.withOpacity(0.1),
                                  ),
                                ],
                              ),
                              height: 50,
                              child: TextFormField(
                                initialValue: product!.name ?? '',
                                onChanged: (value) {
                                  product!.name = value;
                                },
                                textInputAction: TextInputAction.next,
                                key: UniqueKey(),
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  color: ColorPalette.nileBlue,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "名称",
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  hintStyle: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    color:
                                        ColorPalette.nileBlue.withOpacity(0.58),
                                  ),
                                ),
                                cursorColor: ColorPalette.timberGreen,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 6,
                                          color: ColorPalette.nileBlue
                                              .withOpacity(0.1),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    child: TextFormField(
                                      initialValue: product!.price == null
                                          ? ''
                                          : product!.price.toString(),
                                      onChanged: (value) {
                                        product!.price = double.parse(value);
                                      },
                                      textInputAction: TextInputAction.next,
                                      key: UniqueKey(),
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 16,
                                        color: ColorPalette.nileBlue,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "价格",
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        hintStyle: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 16,
                                          color: ColorPalette.nileBlue
                                              .withOpacity(0.58),
                                        ),
                                      ),
                                      cursorColor: ColorPalette.timberGreen,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 6,
                                          color: ColorPalette.nileBlue
                                              .withOpacity(0.1),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    child: TextFormField(
                                      initialValue: product!.count == null
                                          ? ''
                                          : product!.count.toString(),
                                      onChanged: (value) {
                                        product!.count = int.parse(value);
                                      },
                                      textInputAction: TextInputAction.next,
                                      key: UniqueKey(),
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 16,
                                        color: ColorPalette.nileBlue,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "数量",
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        hintStyle: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 16,
                                          color: ColorPalette.nileBlue
                                              .withOpacity(0.58),
                                        ),
                                      ),
                                      cursorColor: ColorPalette.timberGreen,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 8,
                                bottom: 5,
                              ),
                              child: Text(
                                "创建时间： ${product!.createAt==null?"":product.createAt}",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  color: ColorPalette.nileBlue,
                                ),
                              ),
                            ),
                             Padding(
                              padding: EdgeInsets.only(
                                left: 8,
                                bottom: 5,
                              ),
                              child: Text(
                                "上次更新时间：${product.updateAt==null?"无":product.updateAt}",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  color: ColorPalette.nileBlue,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorPalette.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 6,
                                    color:
                                        ColorPalette.nileBlue.withOpacity(0.1),
                                  ),
                                ],
                              ),
                              height: 160,
                              child: TextFormField(
                                maxLines: 7,
                                minLines: 3,
                                initialValue: product!.description ?? '',
                                onChanged: (value) {
                                  product!.description = value;
                                },
                                textInputAction: TextInputAction.next,
                                key: UniqueKey(),
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  color: ColorPalette.nileBlue,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Description",
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  hintStyle: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    color:
                                        ColorPalette.nileBlue.withOpacity(0.58),
                                  ),
                                ),
                                cursorColor: ColorPalette.timberGreen,
                              ),
                            ),
                            const SizedBox(height: 20),
                            // const Padding(
                            //   padding: EdgeInsets.only(
                            //     left: 8,
                            //     bottom: 5,
                            //   ),
                            //   child: Text(
                            //     "Location",
                            //     style: TextStyle(
                            //       fontFamily: "Nunito",
                            //       fontSize: 14,
                            //       color: ColorPalette.nileBlue,
                            //     ),
                            //   ),
                            // ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 3),
                                          blurRadius: 6,
                                          color: ColorPalette.nileBlue
                                              .withOpacity(0.1),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    child: OutlinedButton(
                                      onPressed: () {Get.back(id: 4);},
                                      child: Text("取消"),
                                    ),
                                    // child: TextFormField(
                                    //   initialValue: product!.price ==
                                    //           null
                                    //       ? ''
                                    //       : product!.price.toString(),
                                    //   onChanged: (value) {
                                    //     product!.price =
                                    //         double.parse(value);
                                    //   },
                                    //   textInputAction:
                                    //       TextInputAction.next,
                                    //   key: UniqueKey(),
                                    //   keyboardType:
                                    //       TextInputType.number,
                                    //   style: const TextStyle(
                                    //     fontFamily: "Nunito",
                                    //     fontSize: 16,
                                    //     color: ColorPalette.nileBlue,
                                    //   ),
                                    //   decoration: InputDecoration(
                                    //     border: InputBorder.none,
                                    //     hintText: "Cost",
                                    //     filled: true,
                                    //     fillColor: Colors.transparent,
                                    //     hintStyle: TextStyle(
                                    //       fontFamily: "Nunito",
                                    //       fontSize: 16,
                                    //       color: ColorPalette.nileBlue
                                    //           .withOpacity(0.58),
                                    //     ),
                                    //   ),
                                    //   cursorColor:
                                    //       ColorPalette.timberGreen,
                                    // ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: ColorPalette.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 3),
                                            blurRadius: 6,
                                            color: ColorPalette.nileBlue
                                                .withOpacity(0.1),
                                          ),
                                        ],
                                      ),
                                      height: 50,
                                      child: ElevatedButton(
                                        child: Text("确认"),
                                        onPressed: () {
                                          NbRequest().updateProduct(product).then((value) {
                                            showTextToast("提交成功");
                                            ProducttableminpageController.to.updateData();
                                            Get.back(id:4);
                                          });
                                        },
                                      )
                                      // child: TextFormField(
                                      //   initialValue: product!.count ==
                                      //           null
                                      //       ? ''
                                      //       : product!.count.toString(),
                                      //   onChanged: (value) {
                                      //     product!.count =
                                      //         int.parse(value);
                                      //   },
                                      //   textInputAction:
                                      //       TextInputAction.next,
                                      //   key: UniqueKey(),
                                      //   keyboardType:
                                      //       TextInputType.number,
                                      //   style: const TextStyle(
                                      //     fontFamily: "Nunito",
                                      //     fontSize: 16,
                                      //     color: ColorPalette.nileBlue,
                                      //   ),
                                      //   decoration: InputDecoration(
                                      //     border: InputBorder.none,
                                      //     hintText: "Quantity",
                                      //     filled: true,
                                      //     fillColor: Colors.transparent,
                                      //     hintStyle: TextStyle(
                                      //       fontFamily: "Nunito",
                                      //       fontSize: 16,
                                      //       color: ColorPalette.nileBlue
                                      //           .withOpacity(0.58),
                                      //     ),
                                      //   ),
                                      //   cursorColor:
                                      //       ColorPalette.timberGreen,
                                      // ),
                                      ),
                                ),
                              ],
                            ),
                            // LocationDD(product: product),
                          ],
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topCenter,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 10),
                    //     child: SizedBox(
                    //       height: 100,
                    //       width: 100,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(11),
                    //         child: Container(
                    //           color: ColorPalette.white,
                    //           child: Container(
                    //             color: ColorPalette.timberGreen
                    //                 .withOpacity(0.1),
                    //             child: (product!.image == null)
                    //                 ? Center(
                    //                     child: Icon(
                    //                       Icons.image,
                    //                       color: ColorPalette
                    //                           .nileBlue
                    //                           .withOpacity(0.5),
                    //                     ),
                    //                   )
                    //                 : CachedNetworkImage(
                    //                     fit: BoxFit.cover,
                    //                     imageUrl: product!.image!,
                    //                     errorWidget:
                    //                         (context, s, a) {
                    //                       return Icon(
                    //                         Icons.image,
                    //                         color: ColorPalette
                    //                             .nileBlue
                    //                             .withOpacity(0.5),
                    //                       );
                    //                     },
                    //                   ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
