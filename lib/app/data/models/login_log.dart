import 'package:flutter_nb_net/flutter_net.dart';

class LoginLog extends BaseNetModel{
  String? id;
  String? email;
  int? status;
  String? ip;
  String? date;
  String? browser;

  LoginLog(
      {this.id, this.email, this.status, this.ip, this.date, this.browser});

  LoginLog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    status = json['status'];
    ip = json['ip'];
    date = json['date'];
    browser = json['browser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['status'] = status;
    data['ip'] = ip;
    data['date'] = date;
    data['browser'] = browser;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return LoginLog.fromJson(json);
  }
}
