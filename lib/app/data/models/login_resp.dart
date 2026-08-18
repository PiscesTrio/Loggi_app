import 'package:loggi_app/app/data/models/admin.dart';

class LoginResp{
  Admin? admin;
  String? token;
    LoginResp({
    this.admin,
    this.token
  });

  LoginResp.fromJson(Map<String,dynamic> json){
    admin = Admin.fromJson(json["admin"] as Map<String,dynamic>);
    token = json['token'];
  }

}