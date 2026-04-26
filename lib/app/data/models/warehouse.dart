// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_nb_net/flutter_net.dart';

class Warehouse extends BaseNetModel {
  String? id;
  String? name;
  String? principle;
  String? createAt;
  double? lat;
  double? lng;
  String? location;
  Warehouse({
    this.id,
    this.name,
    this.principle,
    this.createAt,
    this.lat,
    this.lng,
    this.location,
  });



  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    principle = json['principle'];
    createAt = json['createAt'];
    location = json['location'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['principle'] = this.principle;
    data['createAt'] = this.createAt;
    data['location'] = this.location;
    data['lat'] = this.lat;
    data['lng'] = this.lng;

    return data;
  }

  @override
  Warehouse fromJson(Map<String, dynamic> json) {
    return Warehouse.fromJson(json);
  }



  Warehouse copyWith({
    String? id,
    String? name,
    String? principle,
    String? createAt,
    double? lat,
    double? lng,
    String? location,
  }) {
    return Warehouse(
      id: id ?? this.id,
      name: name ?? this.name,
      principle: principle ?? this.principle,
      createAt: createAt ?? this.createAt,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'principle': principle,
      'createAt': createAt,
      'lat': lat,
      'lng': lng,
      'location': location,
    };
  }

  factory Warehouse.fromMap(Map<String, dynamic> map) {
    return Warehouse(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      principle: map['principle'] != null ? map['principle'] as String : null,
      createAt: map['createAt'] != null ? map['createAt'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
      lng: map['lng'] != null ? map['lng'] as double : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }



  @override
  String toString() {
    return 'Warehouse(id: $id, name: $name, principle: $principle, createAt: $createAt, lat: $lat, lng: $lng, location: $location)';
  }

  @override
  bool operator ==(covariant Warehouse other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.principle == principle &&
      other.createAt == createAt &&
      other.lat == lat &&
      other.lng == lng &&
      other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      principle.hashCode ^
      createAt.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      location.hashCode;
  }
}
