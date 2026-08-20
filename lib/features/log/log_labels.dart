/// Display names for the audit log's two closed sets.
///
/// `system_log.module` held 商品管理 / 员工管理 / … and `system_log.business_type` held 新增 /
/// 修改 / … Server-side V7 converted the second one and V10 the first, for the reason V7 gave:
/// display text in an audit column bakes a UI language into the data, so translating the
/// interface strands every historical row.
///
/// There is deliberately no browser table. `login_log.browser` is a closed set too and V10
/// converted it, but nothing in this app renders it — the sign-in log shows status, account, IP
/// and time. Writing labels for a value no screen displays would be inventing work; whoever adds
/// that column to the screen adds the table with it.
library;

import 'package:flutter/widgets.dart';

import '../../app/data/api/system_log_vo.dart';
import '../../l10n/l10n.dart';

String logModuleLabel(BuildContext context, SystemLogVoModuleEnum? module) {
  final l10n = context.l10n;
  return switch (module) {
    SystemLogVoModuleEnum.COMMODITY => l10n.logModuleCommodity,
    SystemLogVoModuleEnum.WAREHOUSE => l10n.logModuleWarehouse,
    SystemLogVoModuleEnum.EMPLOYEE => l10n.logModuleEmployee,
    SystemLogVoModuleEnum.DRIVER => l10n.logModuleDriver,
    SystemLogVoModuleEnum.VEHICLE => l10n.logModuleVehicle,
    SystemLogVoModuleEnum.DISTRIBUTION => l10n.logModuleDistribution,
    SystemLogVoModuleEnum.DISTRIBUTION_TRACK => l10n.logModuleDistributionTrack,
    // V10 empties a module it cannot map rather than guessing, so this is reachable for a row
    // written before the conversion by something that is no longer in the codebase.
    null => '-',
  };
}

/// The operation kind, in words.
///
/// The API used to send 新增 and the row printed it. That made a display string part of the
/// contract, and the database was storing INSERT beside it — the two disagreed for the life of
/// the project. The API sends the stored name now, and the wording lives here.
String businessTypeLabel(
  BuildContext context,
  SystemLogVoBusinessTypeEnum? type,
) {
  final l10n = context.l10n;
  return switch (type) {
    SystemLogVoBusinessTypeEnum.INSERT => l10n.logActionInsert,
    SystemLogVoBusinessTypeEnum.UPDATE => l10n.logActionUpdate,
    SystemLogVoBusinessTypeEnum.DELETE => l10n.logActionDelete,
    SystemLogVoBusinessTypeEnum.QUERY => l10n.logActionQuery,
    SystemLogVoBusinessTypeEnum.EXPORT => l10n.logActionExport,
    SystemLogVoBusinessTypeEnum.FORCE => l10n.logActionForce,
    SystemLogVoBusinessTypeEnum.OTHER => l10n.logActionOther,
    null => '-',
  };
}
