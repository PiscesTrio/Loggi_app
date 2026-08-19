import 'package:flutter/material.dart';

import '../../app/modules/sys_main.dart';
import '../../app/theme/color_palette.dart';
import '../shell/page_header.dart';

/// 系统设置.
///
/// Was a `GetView<SystemSettingController>` wrapped in a `GetBuilder`, over a controller
/// whose entire body was four lifecycle overrides calling super. The page never read it, so
/// removing GetX here is a deletion rather than a migration.
class SystemSettingPage extends StatelessWidget {
  const SystemSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.pacificBlue,
      body: SafeArea(
        child: ColoredBox(
          color: ColorPalette.aquaHaze,
          child: Column(
            children: [
              const PageHeader(title: '系统设置'),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Expanded(child: SysMain()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
