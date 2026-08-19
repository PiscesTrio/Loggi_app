// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vehicle _$VehicleFromJson(Map<String, dynamic> json) => _Vehicle(
  id: json['id'] as String?,
  number: json['number'] as String?,
  type: json['type'] as String?,
  driving: json['driving'] as bool?,
  createAt: json['createAt'] as String?,
);

Map<String, dynamic> _$VehicleToJson(_Vehicle instance) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'type': instance.type,
  'driving': instance.driving,
  'createAt': instance.createAt,
};
