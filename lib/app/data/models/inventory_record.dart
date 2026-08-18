
class InventoryRecord {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['wid'] = wid;
    data['cid'] = cid;
    data['count'] = count;
    data['type'] = type;
    data['description'] = description;
    data['createAt'] = createAt;
    return data;
  }
}
