import 'package:loggi_app/app/data/network/api.dart';
import 'package:loggi_app/app/theme/color_palette.dart';
import 'package:loggi_app/app/utils/TokenStorage.dart';
import 'package:flutter/material.dart';
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
                  Get.toNamed(Routes.LOGINLOG, id: 69);
                },
                title: Text("登录日志"),
              ),
              Divider(
                height: 1,
                indent: 16,
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.OPLOG, id: 69);
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
        Container(
          child: OutlinedButton(
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
                                onPressed: () {
                                  TokenStorage()
                                      .setToken(tokenString: "not logged in");
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
            child: Text(
              "退出登录",
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  color: ColorPalette.contentColorRed),
            ),
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 221, 159, 159)),
              foregroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 230, 13, 13)),
            ),
          ),
        )
      ],
    );
  }
}
