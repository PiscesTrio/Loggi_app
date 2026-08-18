// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Driver _$DriverFromJson(Map<String, dynamic> json) => _Driver(
  id: json['id'] as String?,
  name: json['name'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  idCard: json['idCard'] as String?,
  license: json['license'] as String?,
  score: json['score'] as String?,
  driving: json['driving'] as bool?,
  createAt: json['createAt'] as String?,
  updateAt: json['updateAt'] as String?,
);

Map<String, dynamic> _$DriverToJson(_Driver instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'gender': instance.gender,
  'phone': instance.phone,
  'address': instance.address,
  'idCard': instance.idCard,
  'license': instance.license,
  'score': instance.score,
  'driving': instance.driving,
  'createAt': instance.createAt,
  'updateAt': instance.updateAt,
};
