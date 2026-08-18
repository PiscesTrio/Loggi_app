
class LoginDto{
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['code'] = code;
    data['remember'] = remember;
    return data;
  }
  
}
