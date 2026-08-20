import '../../theme/status_colors.dart';
import '../../../l10n/l10n.dart';

import 'package:flutter/material.dart';

import '../../utils/date_display.dart';
import '../../data/api/login_log_vo.dart';

import '../../theme/color_palette.dart';

class LoginLogsTtem extends StatelessWidget {
  final LoginLogVo loginLog;
  const LoginLogsTtem({super.key, required this.loginLog});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(height: 3),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                  color: loginLog.status == 0
                      ? StatusColors.busy
                      : StatusColors.idle,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    loginLog.status == 0
                        ? context.l10n.logSignInFailed
                        : context.l10n.logSignInSucceeded,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 14,
                      color: ColorPalette.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(
              "账号：${loginLog.email ?? "-"}",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),

          Text("IP地址：${loginLog.ip ?? "-"}"),
          Text(formatDateTime(loginLog.date)),
        ],
      ),
    );
  }
}
