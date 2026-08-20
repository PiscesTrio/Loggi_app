import '../../theme/status_colors.dart';
import '../../../features/fleet/fleet_labels.dart';
import '../../../l10n/l10n.dart';

import 'package:flutter/material.dart';

import '../../data/api/driver_vo.dart';

import 'package:loggi_app/app/theme/color_palette.dart';

import 'package:url_launcher/url_launcher.dart';

class DriverCard extends StatelessWidget {
  final DriverVo driver;
  final String? docID;
  final int imageIndex;
  const DriverCard({
    super.key,
    required this.driver,
    this.docID,
    required this.imageIndex,
  });

  Image buildImage(BuildContext context) {
    if (isMale(driver.gender?.value)) {
      return Image.asset(
        "lib/assets/images/male/icon_business_man${imageIndex % 16 + 1}.png",
      );
    } else {
      return Image.asset(
        "lib/assets/images/female/icon_business_woman${imageIndex % 8 + 1}.png",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
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
                SizedBox(
                  height: 87,
                  width: 87,
                  child: (driver.id == null)
                      ? Center(
                          child: Icon(
                            Icons.image,
                            color: ColorPalette.nileBlue.withValues(alpha: 0.5),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: buildImage(context),
                        ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driver.name ?? '',
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 20,
                          color: ColorPalette.timberGreen,
                        ),
                      ),
                      const SizedBox(height: 5),

                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  context.l10n.driverCallConfirm(
                                    driver.phone ?? '-',
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          launchUrl(
                                            Uri(
                                              scheme: "tel",
                                              path: driver.phone,
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: Text(context.l10n.actionConfirm),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(context.l10n.actionCancel),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.phone,
                                  size: 14,
                                  color: ColorPalette.timberGreen.withValues(
                                    alpha: 0.44,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: driver.phone ?? '-',
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12,
                                  color: ColorPalette.timberGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            // driver!.group ?? '-',
                            context.l10n.driverLicence,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.timberGreen.withValues(
                                alpha: 0.44,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              top: 2,
                              right: 5,
                            ),
                            child: Icon(
                              Icons.local_shipping,
                              size: 10,
                              color: ColorPalette.timberGreen.withValues(
                                alpha: 0.44,
                              ),
                            ),
                          ),
                          Text(
                            driver.license ?? '-',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: ColorPalette.timberGreen.withValues(
                                alpha: 0.44,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        // width: 100,
                        child: Text(
                          genderLabel(context, driver.gender?.value),
                          maxLines: 3,
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 11,
                            color: ColorPalette.timberGreen.withValues(
                              alpha: 0.35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 30,
            top: 30,
            child: Container(
              height: 25,
              width: 50,
              decoration: BoxDecoration(
                color: driver.driving! ? StatusColors.busy : StatusColors.idle,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  driver.driving!
                      ? context.l10n.fleetStatusBusy
                      : context.l10n.fleetStatusIdle,
                  maxLines: 1,
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 14,
                    color: ColorPalette.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
