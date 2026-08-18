
class DistributionStatus {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['disId'] = disId;
    data['lat'] = lat;
    data['lng'] = lng;
    data['location'] = location;
    data['time'] = time;
    data['status'] = status;
    return data;
  }
}
