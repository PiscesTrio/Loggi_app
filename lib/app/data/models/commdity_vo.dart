import 'package:flutter_nb_net/flutter_net.dart';

class CommdityVo extends BaseNetModel{
  int? value;
  String? name;

  CommdityVo({this.value, this.name});

  CommdityVo.fromJson(Map<String, dynamic> json) {
    value = json['value'] as int;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['name'] = name;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return CommdityVo.fromJson(json);
  }
}
