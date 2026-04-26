import 'package:flutter_nb_net/flutter_net.dart';

class DistributionStatus extends BaseNetModel {
  String? id;
  String? disId;
  double? lat;
  double? lng;
  String? location;
  String? time;
  int? status;

  DistributionStatus(
      {this.id,
      this.disId,
      this.lat,
      this.lng,
      this.location,
      this.time,
      this.status});

  DistributionStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    disId = json['disId'];
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
    time = json['time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['disId'] = this.disId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['location'] = this.location;
    data['time'] = this.time;
    data['status'] = this.status;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
  return DistributionStatus.fromJson(json);
  }
}
