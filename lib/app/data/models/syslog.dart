import 'package:flutter_nb_net/flutter_net.dart';

class SysLog extends BaseNetModel{
  String? id;
  String? account;
  String? module;
  String? busincessType;
  String? ip;
  String? method;
  String? time;

  SysLog(
      {this.id,
      this.account,
      this.module,
      this.busincessType,
      this.ip,
      this.method,
      this.time});

  SysLog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    module = json['module'];
    busincessType = json['busincessType'];
    ip = json['ip'];
    method = json['method'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account'] = this.account;
    data['module'] = this.module;
    data['busincessType'] = this.busincessType;
    data['ip'] = this.ip;
    data['method'] = this.method;
    data['time'] = this.time;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return SysLog.fromJson(json);
  }
}
