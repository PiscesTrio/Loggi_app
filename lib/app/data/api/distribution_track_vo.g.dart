// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_track_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DistributionTrackVoCWProxy {
  DistributionTrackVo id(String? id);

  DistributionTrackVo distributionId(String? distributionId);

  DistributionTrackVo lat(double? lat);

  DistributionTrackVo lng(double? lng);

  DistributionTrackVo location(String? location);

  DistributionTrackVo time(DateTime? time);

  DistributionTrackVo status(DistributionTrackVoStatusEnum? status);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DistributionTrackVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DistributionTrackVo(...).copyWith(id: 12, name: "My name")
  /// ```
  DistributionTrackVo call({
    String? id,
    String? distributionId,
    double? lat,
    double? lng,
    String? location,
    DateTime? time,
    DistributionTrackVoStatusEnum? status,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDistributionTrackVo.copyWith(...)` or call `instanceOfDistributionTrackVo.copyWith.fieldName(value)` for a single field.
class _$DistributionTrackVoCWProxyImpl implements _$DistributionTrackVoCWProxy {
  const _$DistributionTrackVoCWProxyImpl(this._value);

  final DistributionTrackVo _value;

  @override
  DistributionTrackVo id(String? id) => call(id: id);

  @override
  DistributionTrackVo distributionId(String? distributionId) =>
      call(distributionId: distributionId);

  @override
  DistributionTrackVo lat(double? lat) => call(lat: lat);

  @override
  DistributionTrackVo lng(double? lng) => call(lng: lng);

  @override
  DistributionTrackVo location(String? location) => call(location: location);

  @override
  DistributionTrackVo time(DateTime? time) => call(time: time);

  @override
  DistributionTrackVo status(DistributionTrackVoStatusEnum? status) =>
      call(status: status);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DistributionTrackVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DistributionTrackVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DistributionTrackVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? distributionId = const $CopyWithPlaceholder(),
    Object? lat = const $CopyWithPlaceholder(),
    Object? lng = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? time = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return DistributionTrackVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      distributionId: distributionId == const $CopyWithPlaceholder()
          ? _value.distributionId
          // ignore: cast_nullable_to_non_nullable
          : distributionId as String?,
      lat: lat == const $CopyWithPlaceholder()
          ? _value.lat
          // ignore: cast_nullable_to_non_nullable
          : lat as double?,
      lng: lng == const $CopyWithPlaceholder()
          ? _value.lng
          // ignore: cast_nullable_to_non_nullable
          : lng as double?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      time: time == const $CopyWithPlaceholder()
          ? _value.time
          // ignore: cast_nullable_to_non_nullable
          : time as DateTime?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as DistributionTrackVoStatusEnum?,
    );
  }
}

extension $DistributionTrackVoCopyWith on DistributionTrackVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDistributionTrackVo.copyWith(...)` or `instanceOfDistributionTrackVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DistributionTrackVoCWProxy get copyWith =>
      _$DistributionTrackVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributionTrackVo _$DistributionTrackVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DistributionTrackVo', json, ($checkedConvert) {
      final val = DistributionTrackVo(
        id: $checkedConvert('id', (v) => v as String?),
        distributionId: $checkedConvert('distributionId', (v) => v as String?),
        lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
        lng: $checkedConvert('lng', (v) => (v as num?)?.toDouble()),
        location: $checkedConvert('location', (v) => v as String?),
        time: $checkedConvert(
          'time',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        status: $checkedConvert(
          'status',
          (v) => $enumDecodeNullable(_$DistributionTrackVoStatusEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DistributionTrackVoToJson(
  DistributionTrackVo instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'distributionId': ?instance.distributionId,
  'lat': ?instance.lat,
  'lng': ?instance.lng,
  'location': ?instance.location,
  'time': ?instance.time?.toIso8601String(),
  'status': ?_$DistributionTrackVoStatusEnumEnumMap[instance.status],
};

const _$DistributionTrackVoStatusEnumEnumMap = {
  DistributionTrackVoStatusEnum.REVIEWING: 'REVIEWING',
  DistributionTrackVoStatusEnum.REVIEW_SUCCESS: 'REVIEW_SUCCESS',
  DistributionTrackVoStatusEnum.END: 'END',
};
