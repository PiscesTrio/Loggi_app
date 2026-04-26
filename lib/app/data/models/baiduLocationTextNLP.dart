import 'package:flutter_nb_net/flutter_net.dart';

class NlpLocation extends BaseNetModel{
  double? lat;
  String? detail;
  String? town;
  String? phonenum;
  String? cityCode;
  String? province;
  String? person;
  double? lng;
  String? provinceCode;
  String? text;
  String? county;
  String? city;
  String? countyCode;
  String? townCode;
  int? logId;

  NlpLocation(
      {this.lat,
      this.detail,
      this.town,
      this.phonenum,
      this.cityCode,
      this.province,
      this.person,
      this.lng,
      this.provinceCode,
      this.text,
      this.county,
      this.city,
      this.countyCode,
      this.townCode,
      this.logId});

  NlpLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    detail = json['detail'];
    town = json['town'];
    phonenum = json['phonenum'];
    cityCode = json['city_code'];
    province = json['province'];
    person = json['person'];
    lng = json['lng'];
    provinceCode = json['province_code'];
    text = json['text'];
    county = json['county'];
    city = json['city'];
    countyCode = json['county_code'];
    townCode = json['town_code'];
    logId = json['log_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['detail'] = this.detail;
    data['town'] = this.town;
    data['phonenum'] = this.phonenum;
    data['city_code'] = this.cityCode;
    data['province'] = this.province;
    data['person'] = this.person;
    data['lng'] = this.lng;
    data['province_code'] = this.provinceCode;
    data['text'] = this.text;
    data['county'] = this.county;
    data['city'] = this.city;
    data['county_code'] = this.countyCode;
    data['town_code'] = this.townCode;
    data['log_id'] = this.logId;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return NlpLocation.fromJson(json);
  }
}
