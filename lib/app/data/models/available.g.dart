// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Available _$AvailableFromJson(Map<String, dynamic> json) => _Available(
  drivers: (json['drivers'] as List<dynamic>?)
      ?.map((e) => Driver.fromJson(e as Map<String, dynamic>))
      .toList(),
  vehicles: (json['vehicles'] as List<dynamic>?)
      ?.map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AvailableToJson(_Available instance) =>
    <String, dynamic>{
      'drivers': instance.drivers,
      'vehicles': instance.vehicles,
    };
