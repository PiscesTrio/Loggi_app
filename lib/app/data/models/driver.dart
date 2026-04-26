import 'package:flutter_nb_net/flutter_net.dart';

class Driver extends BaseNetModel {
  String? id;
  String? name;
  String? gender;
  String? phone;
  String? address;
  String? idCard;
  String? license;
  String? score;
  bool? driving;
  String? createAt;
  String? updateAt;

  Driver(
      {this.id,
      this.name,
      this.gender,
      this.phone,
      this.address,
      this.idCard,
      this.license,
      this.score,
      this.driving,
      this.createAt,
      this.updateAt});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    phone = json['phone'];
    address = json['address'];
    idCard = json['idCard'];
    license = json['license'];
    score = json['score'];
    driving = json['driving'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['idCard'] = this.idCard;
    data['license'] = this.license;
    data['score'] = this.score;
    data['driving'] = this.driving;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Driver.fromJson(json);
  }
}
