import '../../theme/status_colors.dart';
import '../../../l10n/l10n.dart';
import '../../../features/fleet/fleet_labels.dart';

import 'package:loggi_app/assets/svg/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/color_palette.dart';
import '../../data/api/vehicle_vo.dart';

class VehicleMinCard extends StatelessWidget {
  final VehicleVo? vehicle;

  const VehicleMinCard({super.key, this.vehicle});

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
                    color: const Color(0xff000000).withValues(alpha: 0.16),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: IndexedStack(
                      index: vehicleTypeIndex(vehicle!.type?.value),
                      children: [
                        SvgPicture.string(SvgString.van),
                        SvgPicture.string(SvgString.truck),
                        SvgPicture.string(SvgString.heavyTruck),
                      ],
                    ),
                  ),
                  Text(
                    vehicle!.number!,
                    style: const TextStyle(fontFamily: "Nunito", fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                    vehicleTypeLabel(context, vehicle!.type?.value),
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 12,
                      color: ColorPalette.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5,
              top: 30,
              child: Container(
                height: 20,
                width: 40,
                decoration: BoxDecoration(
                  color: vehicle!.driving!
                      ? StatusColors.busy
                      : StatusColors.idle,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    vehicle!.driving!
                        ? context.l10n.fleetStatusBusy
                        : context.l10n.fleetStatusIdle,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 12,
                      color: ColorPalette.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
