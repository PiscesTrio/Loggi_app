import 'package:flutter_nb_net/flutter_net.dart';

class Inventory extends BaseNetModel{
  String? id;
  String? wid;
  String? cid;
  String? name;
  String? location;
  int? count;

  Inventory(
      {this.id, this.wid, this.cid, this.name, this.location, this.count});

  Inventory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wid = json['wid'];
    cid = json['cid'];
    name = json['name'];
    location = json['location'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wid'] = this.wid;
    data['cid'] = this.cid;
    data['name'] = this.name;
    data['location'] = this.location;
    data['count'] = this.count;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return Inventory.fromJson(json);
  }
}
