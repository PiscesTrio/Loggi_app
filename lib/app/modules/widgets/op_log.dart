import 'package:flutter/material.dart';

import '../../../features/log/log_labels.dart';
import '../../../l10n/l10n.dart';
import '../../data/api/system_log_vo.dart';
import '../../utils/date_display.dart';

class OpLogsItem extends StatelessWidget {
  final SystemLogVo sysLog;
  const OpLogsItem({super.key, required this.sysLog});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: 1),
        ListTile(
          title: Text(
            l10n.logAccount(sysLog.account ?? '-'),
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        Row(
          children: [
            Text(logModuleLabel(context, sysLog.module)),
            const SizedBox(width: 20),
            Text(businessTypeLabel(context, sysLog.businessType)),
          ],
        ),
        Text(l10n.logIpAddress(sysLog.ip ?? '-')),
        Text(l10n.logMethod(sysLog.method ?? '-')),
        Text(formatDateTime(sysLog.time)),
      ],
    );
  }
}
