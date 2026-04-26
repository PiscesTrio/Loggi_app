import 'package:loggi_app/app/data/models/admin.dart';
import 'package:flutter_nb_net/flutter_net.dart';

class LoginResp extends BaseNetModel{
  Admin? admin;
  String? token;
    LoginResp({
    this.admin,
    this.token
  });

  LoginResp.fromJson(Map<String,dynamic> json){
    admin = Admin().fromJson(json["admin"]);
    token = json['token'];
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return LoginResp.fromJson(json);
  }

}