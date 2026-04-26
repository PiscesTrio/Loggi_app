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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['status'] = this.status;
    data['ip'] = this.ip;
    data['date'] = this.date;
    data['browser'] = this.browser;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return LoginLog.fromJson(json);
  }
}
