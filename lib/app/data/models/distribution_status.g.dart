// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistributionStatus _$DistributionStatusFromJson(Map<String, dynamic> json) =>
    _DistributionStatus(
      id: json['id'] as String?,
      disId: json['disId'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      location: json['location'] as String?,
      time: json['time'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DistributionStatusToJson(_DistributionStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'disId': instance.disId,
      'lat': instance.lat,
      'lng': instance.lng,
      'location': instance.location,
      'time': instance.time,
      'status': instance.status,
    };
