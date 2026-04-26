import 'package:flutter_nb_net/flutter_net.dart';

class LoginDto extends BaseNetModel{
  String? email;
  String? password;
  String? code;
  bool? remember;

  LoginDto({this.email, this.password, this.code, this.remember});

  LoginDto.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    code = json['code'];
    remember = json['remember'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['code'] = this.code;
    data['remember'] = this.remember;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    LoginDto.fromJson(json);
  }
}
