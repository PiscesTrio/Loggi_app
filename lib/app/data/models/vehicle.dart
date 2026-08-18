import 'package:flutter_nb_net/flutter_net.dart';

class Vehicle extends BaseNetModel {
  String? id;
  String? number;
  String? type;
  bool? driving;
  String? createAt;

  Vehicle({this.id, this.number, this.type, this.driving, this.createAt});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    type = json['type'];
    driving = json['driving'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    data['type'] = type;
    data['driving'] = driving;
    data['createAt'] = createAt;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Vehicle.fromJson(json);
  }
}
