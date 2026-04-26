import 'package:loggi_app/app/data/models/syslog.dart';
import 'package:flutter/material.dart';

class OpLogsItem extends StatelessWidget{


  final SysLog sysLog;
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
          Text(sysLog.busincessType??"-"),

        ],),
        Text("IP地址：${sysLog.ip??"-"}"),
        Text("调用方法：${sysLog.method??"-"}"),
        Text(sysLog.time??"-"),
       


        


      ],

    );
    
  }

}