import 'dart:io';

import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/assets/svg/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/color_palette.dart';

class VehicleMinCard extends StatelessWidget {
  final Vehicle? vehicle;

  const VehicleMinCard({Key? key, this.vehicle}) : super(key: key);

  int _type(String type) {
    switch (type) {
      case "货车":
        return 0;
      case "卡车":
        return 1;
      case "重卡":
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 5),
                      blurRadius: 6,
                      color: const Color(0xff000000).withOpacity(0.16),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: 80,
                        width: 120,
                        child: IndexedStack(
                          index: _type(vehicle!.type!),
                          children: [
                            SvgPicture.string(
                              SvgString.van,
                            ),
                            SvgPicture.string(
                              SvgString.truck,
                            ),
                            SvgPicture.string(
                              SvgString.heavy_truck,
                            ),
                          ],
                        )),
                    Text(
                      vehicle!.number!,
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorPalette.nileBlue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                 
                        vehicle!.type!,
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.white,
                        ),
                      ),
                    )),
              ),
              Positioned(
                right: 5,
                top: 30,
                child: Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      color: vehicle!.driving!?Color.fromRGBO(255, 0, 0, 1):Color.fromRGBO(4, 202, 4, 1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                
                        vehicle!.driving!?"配送中":"空闲",
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.white,
                        ),
                      ),
                    )),
              ),
            ],
          )),
    );
  }
}
