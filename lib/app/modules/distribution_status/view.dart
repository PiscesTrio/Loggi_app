import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:loggi_app/app/data/models/index.dart';
import 'package:loggi_app/app/modules/widgets/distribution_status_item.dart';

import '../../theme/color_palette.dart';
import '../../utils/distance.dart';
import '../map/config.dart';
import 'index.dart';
import 'dart:math';

class DistributionStatusPage extends GetView<DistributionStatusController> {
  final Distribution argument;

  DistributionStatusPage({Key? key, required this.argument}) : super(key: key);

  final String? name = '运单详情';
  @override
  Widget build(BuildContext context) {
    AMapController mapController;
    void _onMapCreated(AMapController controller) {
      mapController = controller;
    }

    controller.distribution(argument);
    final AMapWidget map = AMapWidget(
      scaleEnabled: true,
      onMapCreated: _onMapCreated,
      apiKey: ConstConfig.amapApiKeys,
      markers: {
        Marker(
            position: LatLng(argument.fromLat!, argument.fromLng!),
            icon: BitmapDescriptor.fromIconPath(
                'lib/assets/map_icons/start.png')),
        Marker(
            position: LatLng(argument.toLat!, argument.toLng!),
            icon:
                BitmapDescriptor.fromIconPath('lib/assets/map_icons/end.png')),
      },
      initialCameraPosition: CameraPosition(
          target: LatLng((argument.toLat! + argument.fromLat!) / 2,
              (argument.fromLng! + argument.toLng!) / 2),
          zoom: LatLngDistance().getDistance(argument.toLat!, argument.toLng!,
                  argument.fromLat!, argument.fromLng!) /
              10),
    );

    return GetBuilder<DistributionStatusController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            color: ColorPalette.pacificBlue,
            child: SafeArea(
              child: Container(
                color: ColorPalette.aquaHaze,
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 15,
                      ),
                      width: double.infinity,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: ColorPalette.pacificBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              size: 35,
                            ),
                            onPressed: () {
                              Get.back(id: 70);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Text(
                              name!.length > 14
                                  ? '${name!.substring(0, 12)}..'
                                  : name!,
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 28,
                                color: ColorPalette.timberGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: SizedBox(
                            child: RefreshIndicator(
                                onRefresh: () {
                                  return Future(() {
                                    controller.updateData();
                                  });
                                },
                                child: ListView(
                                  children: [
                                    InteractiveViewer(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: controller.obx((data) =>
                                            AMapWidget(
                                              scaleEnabled: true,
                                              apiKey: ConstConfig.amapApiKeys,
                                              markers: {
                                                Marker(
                                                    position: LatLng(
                                                        argument.fromLat!,
                                                        argument.fromLng!),
                                                    icon: BitmapDescriptor
                                                        .fromIconPath(
                                                            'lib/assets/map_icons/loca.png')),
                                                Marker(
                                                    position: LatLng(
                                                        argument.toLat!,
                                                        argument.toLng!),
                                                    icon: BitmapDescriptor
                                                        .fromIconPath(
                                                            'lib/assets/map_icons/end.png')),
                                                 Marker(position: LatLng(data![0].lat!,data![0].lng!))
                                              },
                                              initialCameraPosition: CameraPosition(
                                                  target: LatLng(
                                                      (argument.toLat! + data![0].lat!) /2,
                                                      (data![0].lng! + argument.toLng!) /2),
                                                  zoom:
                                               LatLngDistance().scale2Zoom ((LatLngDistance()
                                                          .getDistance(
                                                              argument.toLat!,
                                                              argument.toLng!,
                                                              data[0].lat!,data![0].lng!)))-0.2
                                                      ),
                                            )),
                                      ),
                                    ),
                                    controller.obx(
                                      (data) => ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: data!.length,
                                          itemBuilder: (context, index) {
                                            return DistributionStatusItem(
                                              distribution:
                                                  controller.distribution.value,
                                              distributionStatus: data![index],
                                              isTop: index == 0,
                                              isBottom:
                                                  index == data.length - 1,
                                              isStart: data.length == 1,
                                            );
                                          }),
                                    )
                                  ],
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
