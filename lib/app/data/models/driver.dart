
class Driver {
  String? id;
  String? name;
  String? gender;
  String? phone;
  String? address;
  String? idCard;
  String? license;
  String? score;
  bool? driving;
  String? createAt;
  String? updateAt;

  Driver(
      {this.id,
      this.name,
      this.gender,
      this.phone,
      this.address,
      this.idCard,
      this.license,
      this.score,
      this.driving,
      this.createAt,
      this.updateAt});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    phone = json['phone'];
    address = json['address'];
    idCard = json['idCard'];
    license = json['license'];
    score = json['score'];
    driving = json['driving'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['phone'] = phone;
    data['address'] = address;
    data['idCard'] = idCard;
    data['license'] = license;
    data['score'] = score;
    data['driving'] = driving;
    data['createAt'] = createAt;
    data['updateAt'] = updateAt;
    return data;
  }
}
