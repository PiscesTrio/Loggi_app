
import 'package:loggi_app/app/data/models/vehicle.dart';

import 'driver.dart';

class Available{
  List<Driver>? drivers;
  List<Vehicle>? vehicles;


  Available({
    this.drivers,
    this.vehicles
  });

  Available.fromJson(Map<String,dynamic> json){
    drivers = List<Driver>.from(
      json['drivers'].map((item)=>Driver.fromJson(item as Map<String,dynamic>)).toList());
    vehicles = List<Vehicle>.from(
      json['vehicles'].map((item)=>Vehicle.fromJson(item as Map<String,dynamic>)).toList());
  }


 }