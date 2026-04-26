// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_nb_net/flutter_net.dart';

class Admin extends BaseNetModel {
  String? id;
  String? email;
  String? password;
  String? roles;
  String? createAt;

  Admin({
    this.id,
    this.email,
    this.password,
    this.roles,
    this.createAt,
  });

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    roles = json['roles'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['roles'] = this.roles;
    data['createAt'] = this.createAt;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
   return Admin.fromJson(json);
  }

  Admin copyWith({
    String? id,
    String? email,
    String? password,
    String? roles,
    String? createAt,
  }) {
    return Admin(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      roles: roles ?? this.roles,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'roles': roles,
      'createAt': createAt,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      roles: map['roles'] != null ? map['roles'] as String : null,
      createAt: map['createAt'] != null ? map['createAt'] as String : null,
    );
  }


  @override
  String toString() {
    return 'Admin(id: $id, email: $email, password: $password, roles: $roles, createAt: $createAt)';
  }

  @override
  bool operator ==(covariant Admin other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email &&
      other.password == password &&
      other.roles == roles &&
      other.createAt == createAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      email.hashCode ^
      password.hashCode ^
      roles.hashCode ^
      createAt.hashCode;
  }
}
