// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DistributionRequestCWProxy {
  DistributionRequest driverId(String driverId);

  DistributionRequest vehicleId(String vehicleId);

  DistributionRequest warehouseId(String? warehouseId);

  DistributionRequest phone(String phone);

  DistributionRequest address(String address);

  DistributionRequest urgent(bool? urgent);

  DistributionRequest care(Set<DistributionRequestCareEnum>? care);

  DistributionRequest time(DateTime time);

  DistributionRequest status(DistributionRequestStatusEnum status);

  DistributionRequest fromLat(double? fromLat);

  DistributionRequest fromLng(double? fromLng);

  DistributionRequest toLat(double? toLat);

  DistributionRequest toLng(double? toLng);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DistributionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DistributionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  DistributionRequest call({
    String driverId,
    String vehicleId,
    String? warehouseId,
    String phone,
    String address,
    bool? urgent,
    Set<DistributionRequestCareEnum>? care,
    DateTime time,
    DistributionRequestStatusEnum status,
    double? fromLat,
    double? fromLng,
    double? toLat,
    double? toLng,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDistributionRequest.copyWith(...)` or call `instanceOfDistributionRequest.copyWith.fieldName(value)` for a single field.
class _$DistributionRequestCWProxyImpl implements _$DistributionRequestCWProxy {
  const _$DistributionRequestCWProxyImpl(this._value);

  final DistributionRequest _value;

  @override
  DistributionRequest driverId(String driverId) => call(driverId: driverId);

  @override
  DistributionRequest vehicleId(String vehicleId) => call(vehicleId: vehicleId);

  @override
  DistributionRequest warehouseId(String? warehouseId) =>
      call(warehouseId: warehouseId);

  @override
  DistributionRequest phone(String phone) => call(phone: phone);

  @override
  DistributionRequest address(String address) => call(address: address);

  @override
  DistributionRequest urgent(bool? urgent) => call(urgent: urgent);

  @override
  DistributionRequest care(Set<DistributionRequestCareEnum>? care) =>
      call(care: care);

  @override
  DistributionRequest time(DateTime time) => call(time: time);

  @override
  DistributionRequest status(DistributionRequestStatusEnum status) =>
      call(status: status);

  @override
  DistributionRequest fromLat(double? fromLat) => call(fromLat: fromLat);

  @override
  DistributionRequest fromLng(double? fromLng) => call(fromLng: fromLng);

  @override
  DistributionRequest toLat(double? toLat) => call(toLat: toLat);

  @override
  DistributionRequest toLng(double? toLng) => call(toLng: toLng);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DistributionRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DistributionRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DistributionRequest call({
    Object? driverId = const $CopyWithPlaceholder(),
    Object? vehicleId = const $CopyWithPlaceholder(),
    Object? warehouseId = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? urgent = const $CopyWithPlaceholder(),
    Object? care = const $CopyWithPlaceholder(),
    Object? time = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? fromLat = const $CopyWithPlaceholder(),
    Object? fromLng = const $CopyWithPlaceholder(),
    Object? toLat = const $CopyWithPlaceholder(),
    Object? toLng = const $CopyWithPlaceholder(),
  }) {
    return DistributionRequest(
      driverId: driverId == const $CopyWithPlaceholder() || driverId == null
          ? _value.driverId
          // ignore: cast_nullable_to_non_nullable
          : driverId as String,
      vehicleId: vehicleId == const $CopyWithPlaceholder() || vehicleId == null
          ? _value.vehicleId
          // ignore: cast_nullable_to_non_nullable
          : vehicleId as String,
      warehouseId: warehouseId == const $CopyWithPlaceholder()
          ? _value.warehouseId
          // ignore: cast_nullable_to_non_nullable
          : warehouseId as String?,
      phone: phone == const $CopyWithPlaceholder() || phone == null
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String,
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
      urgent: urgent == const $CopyWithPlaceholder()
          ? _value.urgent
          // ignore: cast_nullable_to_non_nullable
          : urgent as bool?,
      care: care == const $CopyWithPlaceholder()
          ? _value.care
          // ignore: cast_nullable_to_non_nullable
          : care as Set<DistributionRequestCareEnum>?,
      time: time == const $CopyWithPlaceholder() || time == null
          ? _value.time
          // ignore: cast_nullable_to_non_nullable
          : time as DateTime,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as DistributionRequestStatusEnum,
      fromLat: fromLat == const $CopyWithPlaceholder()
          ? _value.fromLat
          // ignore: cast_nullable_to_non_nullable
          : fromLat as double?,
      fromLng: fromLng == const $CopyWithPlaceholder()
          ? _value.fromLng
          // ignore: cast_nullable_to_non_nullable
          : fromLng as double?,
      toLat: toLat == const $CopyWithPlaceholder()
          ? _value.toLat
          // ignore: cast_nullable_to_non_nullable
          : toLat as double?,
      toLng: toLng == const $CopyWithPlaceholder()
          ? _value.toLng
          // ignore: cast_nullable_to_non_nullable
          : toLng as double?,
    );
  }
}

extension $DistributionRequestCopyWith on DistributionRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDistributionRequest.copyWith(...)` or `instanceOfDistributionRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DistributionRequestCWProxy get copyWith =>
      _$DistributionRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributionRequest _$DistributionRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DistributionRequest', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'driverId',
          'vehicleId',
          'phone',
          'address',
          'time',
          'status',
        ],
      );
      final val = DistributionRequest(
        driverId: $checkedConvert('driverId', (v) => v as String),
        vehicleId: $checkedConvert('vehicleId', (v) => v as String),
        warehouseId: $checkedConvert('warehouseId', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String),
        address: $checkedConvert('address', (v) => v as String),
        urgent: $checkedConvert('urgent', (v) => v as bool?),
        care: $checkedConvert(
          'care',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DistributionRequestCareEnumEnumMap, e))
              .toSet(),
        ),
        time: $checkedConvert('time', (v) => DateTime.parse(v as String)),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$DistributionRequestStatusEnumEnumMap, v),
        ),
        fromLat: $checkedConvert('fromLat', (v) => (v as num?)?.toDouble()),
        fromLng: $checkedConvert('fromLng', (v) => (v as num?)?.toDouble()),
        toLat: $checkedConvert('toLat', (v) => (v as num?)?.toDouble()),
        toLng: $checkedConvert('toLng', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$DistributionRequestToJson(
  DistributionRequest instance,
) => <String, dynamic>{
  'driverId': instance.driverId,
  'vehicleId': instance.vehicleId,
  'warehouseId': ?instance.warehouseId,
  'phone': instance.phone,
  'address': instance.address,
  'urgent': ?instance.urgent,
  'care': ?instance.care
      ?.map((e) => _$DistributionRequestCareEnumEnumMap[e]!)
      .toList(),
  'time': instance.time.toIso8601String(),
  'status': _$DistributionRequestStatusEnumEnumMap[instance.status]!,
  'fromLat': ?instance.fromLat,
  'fromLng': ?instance.fromLng,
  'toLat': ?instance.toLat,
  'toLng': ?instance.toLng,
};

const _$DistributionRequestCareEnumEnumMap = {
  DistributionRequestCareEnum.FRAGILE: 'FRAGILE',
  DistributionRequestCareEnum.KEEP_DRY: 'KEEP_DRY',
  DistributionRequestCareEnum.KEEP_AWAY_FROM_SUNLIGHT:
      'KEEP_AWAY_FROM_SUNLIGHT',
  DistributionRequestCareEnum.PROTECT_FROM_HEAT: 'PROTECT_FROM_HEAT',
  DistributionRequestCareEnum.DO_NOT_ROLL: 'DO_NOT_ROLL',
  DistributionRequestCareEnum.DO_NOT_STACK: 'DO_NOT_STACK',
  DistributionRequestCareEnum.REFRIGERATE: 'REFRIGERATE',
  DistributionRequestCareEnum.FLAMMABLE: 'FLAMMABLE',
};

const _$DistributionRequestStatusEnumEnumMap = {
  DistributionRequestStatusEnum.REVIEWING: 'REVIEWING',
  DistributionRequestStatusEnum.REVIEW_SUCCESS: 'REVIEW_SUCCESS',
  DistributionRequestStatusEnum.END: 'END',
};
