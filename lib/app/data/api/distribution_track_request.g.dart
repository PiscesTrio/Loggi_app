// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_track_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DistributionTrackRequestCWProxy {
  DistributionTrackRequest distributionId(String distributionId);

  DistributionTrackRequest lat(double? lat);

  DistributionTrackRequest lng(double? lng);

  DistributionTrackRequest location(String? location);

  DistributionTrackRequest status(DistributionTrackRequestStatusEnum status);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DistributionTrackRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DistributionTrackRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  DistributionTrackRequest call({
    String distributionId,
    double? lat,
    double? lng,
    String? location,
    DistributionTrackRequestStatusEnum status,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDistributionTrackRequest.copyWith(...)` or call `instanceOfDistributionTrackRequest.copyWith.fieldName(value)` for a single field.
class _$DistributionTrackRequestCWProxyImpl
    implements _$DistributionTrackRequestCWProxy {
  const _$DistributionTrackRequestCWProxyImpl(this._value);

  final DistributionTrackRequest _value;

  @override
  DistributionTrackRequest distributionId(String distributionId) =>
      call(distributionId: distributionId);

  @override
  DistributionTrackRequest lat(double? lat) => call(lat: lat);

  @override
  DistributionTrackRequest lng(double? lng) => call(lng: lng);

  @override
  DistributionTrackRequest location(String? location) =>
      call(location: location);

  @override
  DistributionTrackRequest status(DistributionTrackRequestStatusEnum status) =>
      call(status: status);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DistributionTrackRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DistributionTrackRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DistributionTrackRequest call({
    Object? distributionId = const $CopyWithPlaceholder(),
    Object? lat = const $CopyWithPlaceholder(),
    Object? lng = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return DistributionTrackRequest(
      distributionId:
          distributionId == const $CopyWithPlaceholder() ||
              distributionId == null
          ? _value.distributionId
          // ignore: cast_nullable_to_non_nullable
          : distributionId as String,
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
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as DistributionTrackRequestStatusEnum,
    );
  }
}

extension $DistributionTrackRequestCopyWith on DistributionTrackRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDistributionTrackRequest.copyWith(...)` or `instanceOfDistributionTrackRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DistributionTrackRequestCWProxy get copyWith =>
      _$DistributionTrackRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributionTrackRequest _$DistributionTrackRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DistributionTrackRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['distributionId', 'status']);
  final val = DistributionTrackRequest(
    distributionId: $checkedConvert('distributionId', (v) => v as String),
    lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
    lng: $checkedConvert('lng', (v) => (v as num?)?.toDouble()),
    location: $checkedConvert('location', (v) => v as String?),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$DistributionTrackRequestStatusEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$DistributionTrackRequestToJson(
  DistributionTrackRequest instance,
) => <String, dynamic>{
  'distributionId': instance.distributionId,
  'lat': ?instance.lat,
  'lng': ?instance.lng,
  'location': ?instance.location,
  'status': _$DistributionTrackRequestStatusEnumEnumMap[instance.status]!,
};

const _$DistributionTrackRequestStatusEnumEnumMap = {
  DistributionTrackRequestStatusEnum.REVIEWING: 'REVIEWING',
  DistributionTrackRequestStatusEnum.REVIEW_SUCCESS: 'REVIEW_SUCCESS',
  DistributionTrackRequestStatusEnum.END: 'END',
};
