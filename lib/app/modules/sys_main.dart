import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/theme/color_palette.dart';
import 'package:loggi_app/app/data/network/legacy_bridge.dart';
import 'package:flutter/material.dart';
import 'package:loggi_app/app/modules/widgets/toast.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class SysMain extends StatelessWidget {
  const SysMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ListTile(
          title: Text(
            "系统管理",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        const Divider(height: 1),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                onTap: () async {
                  for(int i=0;i<10;i++){
                    await Future.delayed(Duration(seconds: 1), ).then((value) {
                    NbRequest().getAllProducts();
                  });
                  }
                },
                title: Text("账号管理"),
                subtitle: Text("修改账号和密码"),
              ),
              Divider(
                height: 1,
                indent: 16,
              ),
            ],
          ),
        ),
        const ListTile(
          title: Text(
            "系统日志",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        const Divider(height: 1),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.loginLog, id: 69);
                },
                title: Text("登录日志"),
              ),
              Divider(
                height: 1,
                indent: 16,
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.opLog, id: 69);
                },
                title: Text("操作日志"),
              ),
              Divider(
                height: 1,
                indent: 16,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        OutlinedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        "确认退出登录吗？",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  // Clears the credential, rather than overwriting it with
                                  // the string "not logged in" — which stayed on the client
                                  // as a header, so the next request went out as
                                  // `Authorization: Bearer not logged in`.
                                  await clearToken();
                                  showTextToast("已退出登录");
                                  // offAllNamed, not offAndToNamed: the latter
                                  // replaces only the top route, and the home
                                  // shell it leaves behind keeps its GetX
                                  // controllers alive. Logging back in then
                                  // pushed a SECOND shell whose controllers had
                                  // already run onInit, so nothing fetched and
                                  // the screen came up empty. Clearing the whole
                                  // stack disposes the bindings with it.
                                  Get.offAllNamed(Routes.login);
                                },
                                child: Text("确认")),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("取消"))
                          ],
                        )
                      ],
                    );
                  });
            },
            style: const ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromARGB(255, 221, 159, 159)),
              foregroundColor:
                  WidgetStatePropertyAll(Color.fromARGB(255, 230, 13, 13)),
            ),
            child: Text(
              "退出登录",
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  color: ColorPalette.contentColorRed),
            ),
          )
      ],
    );
  }
}
