import 'package:loggi_app/app/data/network/api.dart';
import '../../data/api/commodity_request.dart';
import '../../data/api/commodity_vo.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_palette.dart';
import '../ProductTableMinPage/controller.dart';
import 'index.dart';
import 'package:go_router/go_router.dart';

class ProductdetailminPage extends GetView<ProductdetailminController> {
  final Map<String,dynamic> arguments;
 
  const ProductdetailminPage( {super.key,required this.arguments});
  @override
  Widget build(BuildContext context) {
    final CommodityVo product = arguments['product'];

    // The form edits a draft, not the commodity. It used to assign straight onto the
    // object the list handed it, so a field typed here changed the row behind the
    // screen whether or not 确认 was ever pressed, and cancelling changed nothing back.
    // The generated model is immutable, which makes that impossible rather than
    // merely discouraged.
    final draft = _Draft(product);
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
                                        ColorPalette.nileBlue.withValues(alpha: 0.1),
                                  ),
                                ],
                              ),
                              height: 50,
                              child: TextFormField(
                                initialValue: product.name ?? '',
                                onChanged: (value) {
                                  draft.name = value;
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
                                        ColorPalette.nileBlue.withValues(alpha: 0.58),
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
                                              .withValues(alpha: 0.1),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    child: TextFormField(
                                      initialValue: product.price == null
                                          ? ''
                                          : product.price.toString(),
                                      onChanged: (value) {
                                        draft.price = num.tryParse(value) ?? 0;
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
                                              .withValues(alpha: 0.58),
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
                                              .withValues(alpha: 0.1),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    child: TextFormField(
                                      initialValue: product.count == null
                                          ? ''
                                          : product.count.toString(),
                                      onChanged: (value) {
                                        draft.count = int.tryParse(value) ?? 0;
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
                                              .withValues(alpha: 0.58),
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
                                "创建时间： ${product.createAt ?? ""}",
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
                                "上次更新时间：${product.updateAt ?? "无"}",
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
                                        ColorPalette.nileBlue.withValues(alpha: 0.1),
                                  ),
                                ],
                              ),
                              height: 160,
                              child: TextFormField(
                                maxLines: 7,
                                minLines: 3,
                                initialValue: product.description ?? '',
                                onChanged: (value) {
                                  draft.description = value;
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
                                        ColorPalette.nileBlue.withValues(alpha: 0.58),
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
                                              .withValues(alpha: 0.1),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    child: OutlinedButton(
                                      onPressed: () {context.pop();},
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
                                                .withValues(alpha: 0.1),
                                          ),
                                        ],
                                      ),
                                      height: 50,
                                      child: ElevatedButton(
                                        child: Text("确认"),
                                        onPressed: () async {
                                          await NbRequest().updateProduct(product.id ?? '', draft.toRequest());
                                          showTextToast("提交成功");
                                          ProducttableminpageController.to.updateData();
                                          // The context is only used if this screen is
                                          // still mounted. Popping a route whose element
                                          // is already gone throws, and the request that
                                          // precedes it is exactly the gap during which
                                          // the user can leave.
                                          if (context.mounted) {
                                            context.pop();
                                          }
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

/// The fields being typed, before they are sent.
///
/// Mutable on purpose and local on purpose: the screen needs somewhere to accumulate edits,
/// and the commodity it was handed is not that place. What leaves here is a
/// [CommodityRequest] - a different type from the commodity, deliberately, because a request
/// has no id and no timestamps to disagree with the server about.
class _Draft {
  _Draft(CommodityVo product)
      : name = product.name ?? '',
        price = product.price ?? 0,
        description = product.description ?? '',
        count = product.count ?? 0;

  String name;
  num price;
  String description;
  int count;

  CommodityRequest toRequest() => CommodityRequest(
        name: name,
        price: price,
        description: description,
        count: count,
      );
}
