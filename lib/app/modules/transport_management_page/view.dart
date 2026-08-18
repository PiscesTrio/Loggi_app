import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../theme/color_palette.dart';
import 'index.dart';

class TransportManagementPagePage
    extends GetView<TransportManagementPageController> {
  const TransportManagementPagePage({super.key, required this.shell});

  /// The inner tabs' navigators — see BaseManagementPageView for why this is a shell and
  /// not an IndexedStack of pages. 配送申请 is the drill-down that lives inside the 配送管理
  /// tab; without the nested shell it covered this header and these tabs.
  final StatefulNavigationShell shell;

  final String? name = '运输管理';
  @override
  Widget build(BuildContext context) {
    if (controller.tabController.index != shell.currentIndex) {
      controller.tabController.index = shell.currentIndex;
    }
    return GetBuilder<TransportManagementPageController>(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              name!.length > 14
                                  ? '${name!.substring(0, 12)}..'
                                  : name!,
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 28,
                                color: ColorPalette.timberGreen,
                              ),
                            ),
                        
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              DefaultTabController(
                                  length: 3,
                                  child: TabBar(
                                    controller: controller.tabController,
                                    onTap: (i) => shell.goBranch(i,
                                        initialLocation: i == shell.currentIndex),
                                    tabs: const [
                                      Tab(
                                        text: "配送管理",
                                        //     icon: Icon(
                                        //   Icons.desktop_mac,
                                        //   color: Colors.black,
                                        // )
                                      ),
                                      Tab(
                                        text: "车辆管理",
                                        // icon: Icon(Icons.laptop_mac,
                                        //     color: Colors.black)
                                      ),
                                      Tab(
                                        text: "驾驶员管理",
                                        // icon: Icon(Icons.ad_units,
                                        //     color: Colors.black)
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 20),
                              Expanded(
                                  child: shell),
                            ],
                          ),
                        ),
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
