import 'package:cached_network_image/cached_network_image.dart';
import 'package:loggi_app/app/data/models/inventory.dart';
import 'package:loggi_app/app/data/network/api.dart';
import 'package:flutter/material.dart';
import 'package:loggi_app/app/data/models/warehouse.dart';
// import 'package:warehouse_management/screens/warehouse_details_page.dart';
import 'package:loggi_app/app/theme/color_palette.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../assets/svg/svg_strings.dart';
import '../../routes/app_pages.dart';

class WarehouseCard extends StatelessWidget {
  final Warehouse? warehouse;
  final String? docID;
  final int iconIndex;
  const WarehouseCard({Key? key, this.warehouse, this.docID, required this.iconIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.toNamed(Routes.WAREHOUSE_INVENTORY,arguments: warehouse!.id,id: 5);
            },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),

        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 6,
              color: const Color(0xff000000).withOpacity(0.06),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(
              height: 87,
              width: 87,
              child: (warehouse!.id == null)
                  ? Center(
                      child: Icon(
                        Icons.image,
                        color: ColorPalette.nileBlue.withOpacity(0.5),
                      ),
                    )
                  : ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                            child: SvgPicture.string(
                              SvgString.warehouse[iconIndex%3],
                            ),
            ),),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    warehouse!.name ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 20,
                      color: ColorPalette.timberGreen,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: ColorPalette.timberGreen.withOpacity(0.44),
                      ),
                      Text(
                        // warehouse!.location ?? '-',
                        warehouse!.location??"-",
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.timberGreen,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        // warehouse!.group ?? '-',
                        '负责人：',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.timberGreen.withOpacity(0.44),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          top: 2,
                          right: 5,
                        ),
                        child: Icon(
                          Icons.circle,
                          size: 5,
                          color: ColorPalette.timberGreen.withOpacity(0.44),
                        ),
                      ),
                      Text(
                        warehouse!.principle ?? '-',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.timberGreen.withOpacity(0.44),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    // width: 100,
                    child: Text(
                      warehouse!.createAt ?? '-',
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 11,
                        color: ColorPalette.timberGreen.withOpacity(0.35),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Text(
            //         "₹${warehouse!.cost ?? '-'}",
            //         style: const TextStyle(
            //           fontFamily: "Nunito",
            //           fontSize: 14,
            //           color: ColorPalette.nileBlue,
            //         ),
            //       ),
            //       Expanded(
            //         child: Align(
            //           alignment: Alignment.centerRight,
            //           child: Text(
            //             "${warehouse!.quantity ?? '-'}\nAvailable",
            //             style: const TextStyle(
            //               fontFamily: "Nunito",
            //               fontSize: 12,
            //               color: ColorPalette.nileBlue,
            //             ),
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
