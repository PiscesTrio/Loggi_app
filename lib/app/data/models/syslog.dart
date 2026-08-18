
class SysLog{
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['account'] = account;
    data['module'] = module;
    data['busincessType'] = busincessType;
    data['ip'] = ip;
    data['method'] = method;
    data['time'] = time;
    return data;
  }
}
