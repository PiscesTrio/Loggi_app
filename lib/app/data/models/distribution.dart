import 'package:flutter_nb_net/flutter_net.dart';

class Distribution extends BaseNetModel{
  String? id;
  String? did;
  String? vid;
  String? driver;
  String? number;
  String? phone;
  String? address;
  bool? urgent;
  String? care;
  String? time;
  int? status;
  String? wid;
  double? fromLat ;
  double? fromLng ;
  double?  toLat;
  double? toLng ;


  Distribution(
      {this.id,
      this.did,
      this.vid,
      this.driver,
      this.number,
      this.phone,
      this.address,
      this.urgent,
      this.care,
      this.time,
      this.status,
      this.fromLat ,
      this.fromLng ,
      this.toLat ,this.toLng,
      this.wid });
      

  Distribution.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    did = json['did'];
    vid = json['vid'];
    driver = json['driver'];
    number = json['number'];
    phone = json['phone'];
    address = json['address'];
    urgent = json['urgent'];
    care = json['care'];
    time = json['time'];
    status = json['status'];
    fromLat = json['fromLat'];
    fromLng = json['fromLng'];
    toLat = json['toLat'];
    toLng = json['toLng'];
    wid = json['wid'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['did'] = did;
    data['vid'] = vid;
    data['driver'] = driver;
    data['number'] = number;
    data['phone'] = phone;
    data['address'] = address;
    data['urgent'] = urgent;
    data['care'] = care;
    data['time'] = time;
    data['status'] = status;
    data['fromLat'] = fromLat;
    data['fromLng'] = fromLng;
    data['toLat'] = toLat;
    data['toLng'] = toLng;
    data['wid'] = wid;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return Distribution.fromJson(json);
  }
}
