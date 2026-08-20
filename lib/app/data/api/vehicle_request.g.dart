// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VehicleRequestCWProxy {
  VehicleRequest number(String number);

  VehicleRequest type(VehicleRequestTypeEnum type);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `VehicleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// VehicleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  VehicleRequest call({String number, VehicleRequestTypeEnum type});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfVehicleRequest.copyWith(...)` or call `instanceOfVehicleRequest.copyWith.fieldName(value)` for a single field.
class _$VehicleRequestCWProxyImpl implements _$VehicleRequestCWProxy {
  const _$VehicleRequestCWProxyImpl(this._value);

  final VehicleRequest _value;

  @override
  VehicleRequest number(String number) => call(number: number);

  @override
  VehicleRequest type(VehicleRequestTypeEnum type) => call(type: type);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `VehicleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// VehicleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  VehicleRequest call({
    Object? number = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return VehicleRequest(
      number: number == const $CopyWithPlaceholder() || number == null
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as VehicleRequestTypeEnum,
    );
  }
}

extension $VehicleRequestCopyWith on VehicleRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfVehicleRequest.copyWith(...)` or `instanceOfVehicleRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VehicleRequestCWProxy get copyWith => _$VehicleRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleRequest _$VehicleRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VehicleRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['number', 'type']);
      final val = VehicleRequest(
        number: $checkedConvert('number', (v) => v as String),
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$VehicleRequestTypeEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VehicleRequestToJson(VehicleRequest instance) =>
    <String, dynamic>{
      'number': instance.number,
      'type': _$VehicleRequestTypeEnumEnumMap[instance.type]!,
    };

const _$VehicleRequestTypeEnumEnumMap = {
  VehicleRequestTypeEnum.LIGHT_TRUCK: 'LIGHT_TRUCK',
  VehicleRequestTypeEnum.TRUCK: 'TRUCK',
  VehicleRequestTypeEnum.HEAVY_TRUCK: 'HEAVY_TRUCK',
};
