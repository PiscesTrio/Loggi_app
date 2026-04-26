
import 'package:loggi_app/app/data/models/vehicle.dart';
import 'package:flutter_nb_net/flutter_net.dart';

import 'driver.dart';

class Available extends BaseNetModel{
  List<Driver>? drivers;
  List<Vehicle>? vehicles;


  Available({
    this.drivers,
    this.vehicles
  });

  Available.fromJson(Map<String,dynamic> json){
    drivers = List<Driver>.from(
      json['drivers'].map((item)=>Driver().fromJson(item)).toList());
    vehicles = List<Vehicle>.from(
      json['vehicles'].map((item)=>Vehicle().fromJson(item)).toList());
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return Available.fromJson(json);
  }


 }