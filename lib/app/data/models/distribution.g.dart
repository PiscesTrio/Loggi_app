// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Distribution _$DistributionFromJson(Map<String, dynamic> json) =>
    _Distribution(
      id: json['id'] as String?,
      did: json['did'] as String?,
      vid: json['vid'] as String?,
      driver: json['driver'] as String?,
      number: json['number'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      urgent: json['urgent'] as bool?,
      care: json['care'] as String?,
      time: json['time'] as String?,
      status: (json['status'] as num?)?.toInt(),
      wid: json['wid'] as String?,
      fromLat: (json['fromLat'] as num?)?.toDouble(),
      fromLng: (json['fromLng'] as num?)?.toDouble(),
      toLat: (json['toLat'] as num?)?.toDouble(),
      toLng: (json['toLng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DistributionToJson(_Distribution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'did': instance.did,
      'vid': instance.vid,
      'driver': instance.driver,
      'number': instance.number,
      'phone': instance.phone,
      'address': instance.address,
      'urgent': instance.urgent,
      'care': instance.care,
      'time': instance.time,
      'status': instance.status,
      'wid': instance.wid,
      'fromLat': instance.fromLat,
      'fromLng': instance.fromLng,
      'toLat': instance.toLat,
      'toLng': instance.toLng,
    };
