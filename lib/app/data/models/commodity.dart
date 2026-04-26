import 'package:flutter_nb_net/flutter_net.dart';

class Product extends BaseNetModel {
  String? id;
  String? name;
  double? price;
  String? description;
  int? count;
  String? createAt;
  String? updateAt;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.count,
      this.createAt,
      this.updateAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    count = json['count'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['count'] = this.count;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? description,
    int? count,
    String? createAt,
    String? updateAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      count: count ?? this.count,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'count': count,
      'createAt': createAt,
      'updateAt': updateAt,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price']?.toDouble(),
      description: map['description'],
      count: map['count']?.toInt(),
      createAt: map['createAt'],
      updateAt: map['updateAt'],
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, description: $description, count: $count, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.description == description &&
        other.count == count &&
        other.createAt == createAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        description.hashCode ^
        count.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode;
  }
}
