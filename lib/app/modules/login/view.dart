import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_pages.dart';
import '../../theme/color_palette.dart';
import 'index.dart';


class LoginPage extends GetView<LoginController> {
 LoginPage({Key? key}) : super(key: key);
 
 
  final GetStorage box = GetStorage();


  @override
  Widget build(BuildContext context) {
     
    box.listenKey("token", (value) {
    if(value!="not logged in"&&value!=null){
      Get.offAndToNamed(Routes.HOME);
    }
   });
    return GetBuilder<LoginController>(
      builder: (_) {
        return Obx(()=>Scaffold(
        backgroundColor: ColorPalette.aquaHaze,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: SizedBox()),
              // SvgPicture.string(SvgStrings.warehouse),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Logistic\nManagement",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Row(
              //   children: [
              //     SvgPicture.string(SvgStrings.location),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     const Text(
              //       "XYZ's Godown",
              //       style: TextStyle(fontFamily: "Open_Sans", fontSize: 20),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                      color: const Color(0xff000000).withOpacity(0.16),
                    ),
                  ],
                ),
                height: 50,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  key: UniqueKey(),
                  onChanged: (value) => controller.loginData.update((val) {
                    val!.email = value;
                  }),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 16,
                    color: ColorPalette.nileBlue,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.transparent,
                    hintStyle: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                      color: ColorPalette.nileBlue.withOpacity(0.58),
                    ),
                  ),
                  cursorColor: ColorPalette.timberGreen,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                      color: const Color(0xff000000).withOpacity(0.16),
                    ),
                  ],
                ),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        key: UniqueKey(),
                        obscureText: !controller.isVisible.value,
                        onChanged: (value) => controller.loginData.update((val) {
                          val!.password = value;
                        }),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          color: ColorPalette.nileBlue,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          filled: true,
                          fillColor: Colors.transparent,
                          hintStyle: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 16,
                            color: ColorPalette.nileBlue.withOpacity(0.58),
                          ),
                        ),
                        cursorColor: ColorPalette.timberGreen,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: controller.isVisible.value ? Colors.black : Colors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        controller.isVisible(!controller.isVisible.value);
                      },
                      splashColor: Colors.transparent,
                      splashRadius: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  controller.failed.value ? "邮箱或密码错误！" : "",
                  style: const TextStyle(
                    color: ColorPalette.mandy,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await controller.signIn();
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorPalette.pacificBlue,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: const Color(0xff000000).withOpacity(0.16),
                          ),
                        ],
                      ),
                      child: Center(
                        child: controller.loading.value
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: ColorPalette.aquaHaze,
                                ),
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Nunito",
                                  color: ColorPalette.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ));
      },
    );
  }
}
