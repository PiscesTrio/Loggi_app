
class Inventory{
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['wid'] = wid;
    data['cid'] = cid;
    data['name'] = name;
    data['location'] = location;
    data['count'] = count;
    return data;
  }
}
