import 'package:loggi_app/app/modules/sys_main.dart';
import 'package:loggi_app/app/modules/widgets/login_log.dart';
import 'package:loggi_app/app/modules/widgets/op_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_palette.dart';
import 'index.dart';

class LoginLogPage extends GetView<LoginLogController> {
  const LoginLogPage({Key? key}) : super(key: key);

  final String? name = "登录日志";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginLogController>(
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
                              Get.back(id: 69);
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          const SizedBox(height: 20),
                          Expanded(
                              child: RefreshIndicator(
                            
                              onRefresh:() {
                                return Future((){controller.updateData();});
                              },
                                child: controller.obx(
                              (data) => ListView.builder(
                                  itemCount: data?.length,
                                  itemBuilder: (context, index) {
                                    return LoginLogsTtem(
                                      loginLog: data![index],
                                    );
                                  }),
                            )))
                        ],
                      ),
                    ),
                  ),),
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
