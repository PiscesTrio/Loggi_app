import 'package:loggi_app/app/modules/base_mangement_page/base_mangement_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loggi_app/app/theme/color_palette.dart';

class BaseManagementPageView extends GetView<BaseManagementPageController> {
  final String? name = '基础管理';

  const BaseManagementPageView({super.key, required this.shell});

  /// The inner tabs' navigators.
  ///
  /// This screen used to hold an `IndexedStack` of two hand-written `Navigator`s keyed by
  /// `Get.nestedKey(4)` and `(5)`, sitting in the `Expanded` below — so a pushed page
  /// (商品详情, 仓库库存) rendered inside the content area with this header and tab bar
  /// still above it. Replacing those navigators with the pages themselves moved the push
  /// up to the outer branch, which covers everything; the drill-downs came up with no
  /// header, no tabs, and their first row against the status bar.
  ///
  /// A nested shell restores the arrangement: same two navigators, same position in the
  /// tree, now declared as branches instead of switch statements.
  final StatefulNavigationShell shell;

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // Keeps the indicator honest if the branch changed by any route other than a tap.
    if (controller.tabController.index != shell.currentIndex) {
      controller.tabController.index = shell.currentIndex;
    }
    return Scaffold(
      body:  Container(
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
                              length: 2,
                              child: TabBar(
                                controller: controller.tabController,
                                // The branch decides what is shown; the TabController only
                                // draws the indicator. Tapping the tab you are on returns
                                // it to its root, which is where a pushed 商品详情 or
                                // 仓库库存 gets dismissed from.
                                onTap: (i) => shell.goBranch(i,
                                    initialLocation: i == shell.currentIndex),
                                tabs: const [
                                  Tab(
                                     text: "商品管理",),
                                  Tab(
                                      text: "仓库管理",),
                                ],
                              )),
                          const SizedBox(height: 20),
                          Expanded(child: shell)
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
  }
}
