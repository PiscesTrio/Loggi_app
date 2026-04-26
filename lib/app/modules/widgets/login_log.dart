import 'package:loggi_app/app/data/models/login_log.dart';
import 'package:loggi_app/app/data/models/syslog.dart';
import 'package:flutter/material.dart';

import '../../theme/color_palette.dart';

class LoginLogsTtem extends StatelessWidget {
  final LoginLog loginLog;
  const LoginLogsTtem({super.key, required this.loginLog});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(height: 3),
          SizedBox(height: 20,),
          Row(
            
            children: [
              
           
              Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    color: loginLog.status == 0
                        ? Color.fromRGBO(255, 0, 0, 1)
                        : Color.fromRGBO(4, 202, 4, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      loginLog.status == 0 ? "失败" : "成功",
                      maxLines: 1,
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                        color: ColorPalette.white,
                      ),
                    ),
                  )),
            ],
          ),
             ListTile(
                title: Text(
                  "账号：${loginLog.email ?? "-"}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
  
          Text("IP地址：${loginLog.ip ?? "-"}"),
          Text(loginLog.date ?? "-"),
        ],
      ),
    );
  }
}
