import 'package:loggi_app/app/data/models/vehicle.dart';
import 'package:flutter/material.dart';

import 'package:loggi_app/app/theme/color_palette.dart';


class VehicleCard extends StatelessWidget{
  final Vehicle? vehicle;
  final String? docID;
  const VehicleCard({super.key, this.vehicle, this.docID});


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () async {
        },
        child: Stack(
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              // height: 167,
              decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 6,
                    color: const Color(0xff000000).withValues(alpha: 0.06),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle!.number ?? '',
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
                        Text.rich(TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.location_on,
                              size: 14,
                              color: ColorPalette.timberGreen.withValues(alpha: 0.44),
                            ),
                          ),
                          TextSpan(
                            text: vehicle!.type ?? '-',
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.timberGreen,
                            ),
                          )
                        ])),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              // vehicle!.group ?? '-',
                              '驾驶员：',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color:
                                    ColorPalette.timberGreen.withValues(alpha: 0.44),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 2,
                                right: 5,
                              ),
                              child: Icon(
                                Icons.person,
                                size: 10,
                                color:
                                    ColorPalette.timberGreen.withValues(alpha: 0.44),
                              ),
                            ),
                            Text(
                              vehicle!.createAt ?? '-',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color:
                                    ColorPalette.timberGreen.withValues(alpha: 0.44),
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
                            vehicle!.id ?? '-',
                            maxLines: 3,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 11,
                              color: ColorPalette.timberGreen.withValues(alpha: 0.35),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
           
          ],
        ));
  }
}
