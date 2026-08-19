
/// One row of the operation log, as `/api/systemlog` sends it.
///
/// `businessType` was `busincessType` on both sides until S07: the backend serialises the
/// SystemLog entity directly, so the misspelled Java field was the wire name too. The two
/// have to be renamed together — this model reads the key by hand, and a name that no
/// longer arrives leaves the field null, which the log row renders as "-". Nothing would
/// have failed; the column would just have gone quietly blank.
class SysLog{
  String? id;
  String? account;
  String? module;
  String? businessType;
  String? ip;
  String? method;
  String? time;

  SysLog(
      {this.id,
      this.account,
      this.module,
      this.businessType,
      this.ip,
      this.method,
      this.time});

  SysLog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    module = json['module'];
    businessType = json['businessType'];
    ip = json['ip'];
    method = json['method'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['account'] = account;
    data['module'] = module;
    data['businessType'] = businessType;
    data['ip'] = ip;
    data['method'] = method;
    data['time'] = time;
    return data;
  }
}
