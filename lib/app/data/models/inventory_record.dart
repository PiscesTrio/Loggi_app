import 'package:flutter_nb_net/flutter_net.dart';

class InventoryRecord extends BaseNetModel {
  String? id;
  String? name;
  String? wid;
  String? cid;
  int? count;
  int? type;
  String? description;
  String? createAt;

  InventoryRecord(
      {this.id,
      this.name,
      this.wid,
      this.cid,
      this.count,
      this.type,
      this.description,
      this.createAt});

  InventoryRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    wid = json['wid'];
    cid = json['cid'];
    count = json['count'];
    type = json['type'];
    description = json['description'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['wid'] = this.wid;
    data['cid'] = this.cid;
    data['count'] = this.count;
    data['type'] = this.type;
    data['description'] = this.description;
    data['createAt'] = this.createAt;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return InventoryRecord.fromJson(json);
  }
}
