import 'package:flutter/material.dart';
import '../../utils/date_display.dart';
import '../../data/api/system_log_vo.dart';

class OpLogsItem extends StatelessWidget{


  final SystemLogVo sysLog;
  const OpLogsItem({super.key, required this.sysLog});


  
  @override
  Widget build(BuildContext context) {
    return Column(
         mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:  [
        const Divider(height: 1),
         ListTile(
          title: Text(
            "账号：${sysLog.account??"-"}",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        Row(children: [
          Text(sysLog.module??"-"),
          SizedBox(width: 20,),
          Text(_businessTypeLabel(sysLog.businessType)),

        ],),
        Text("IP地址：${sysLog.ip??"-"}"),
        Text("调用方法：${sysLog.method??"-"}"),
        Text(formatDateTime(sysLog.time)),
       


        


      ],

    );
    
  }

}

/// The operation kind, in words.
///
/// The API used to send '新增' and the row printed it. That made a display string part of
/// the contract, and the database was storing 'INSERT' beside it — the two disagreed for
/// the life of the project. The API sends the stored name now, and the wording lives here.
String _businessTypeLabel(SystemLogVoBusinessTypeEnum? type) => switch (type) {
      SystemLogVoBusinessTypeEnum.INSERT => '新增',
      SystemLogVoBusinessTypeEnum.UPDATE => '修改',
      SystemLogVoBusinessTypeEnum.DELETE => '删除',
      SystemLogVoBusinessTypeEnum.QUERY => '查询',
      SystemLogVoBusinessTypeEnum.EXPORT => '导出',
      SystemLogVoBusinessTypeEnum.FORCE => '强退',
      SystemLogVoBusinessTypeEnum.OTHER => '其它',
      null => '-',
    };
