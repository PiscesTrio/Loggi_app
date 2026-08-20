// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VehicleVoCWProxy {
  VehicleVo id(String? id);

  VehicleVo number(String? number);

  VehicleVo type(VehicleVoTypeEnum? type);

  VehicleVo driving(bool? driving);

  VehicleVo createAt(DateTime? createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `VehicleVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// VehicleVo(...).copyWith(id: 12, name: "My name")
  /// ```
  VehicleVo call({
    String? id,
    String? number,
    VehicleVoTypeEnum? type,
    bool? driving,
    DateTime? createAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfVehicleVo.copyWith(...)` or call `instanceOfVehicleVo.copyWith.fieldName(value)` for a single field.
class _$VehicleVoCWProxyImpl implements _$VehicleVoCWProxy {
  const _$VehicleVoCWProxyImpl(this._value);

  final VehicleVo _value;

  @override
  VehicleVo id(String? id) => call(id: id);

  @override
  VehicleVo number(String? number) => call(number: number);

  @override
  VehicleVo type(VehicleVoTypeEnum? type) => call(type: type);

  @override
  VehicleVo driving(bool? driving) => call(driving: driving);

  @override
  VehicleVo createAt(DateTime? createAt) => call(createAt: createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `VehicleVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// VehicleVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  VehicleVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? driving = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
  }) {
    return VehicleVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as VehicleVoTypeEnum?,
      driving: driving == const $CopyWithPlaceholder()
          ? _value.driving
          // ignore: cast_nullable_to_non_nullable
          : driving as bool?,
      createAt: createAt == const $CopyWithPlaceholder()
          ? _value.createAt
          // ignore: cast_nullable_to_non_nullable
          : createAt as DateTime?,
    );
  }
}

extension $VehicleVoCopyWith on VehicleVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfVehicleVo.copyWith(...)` or `instanceOfVehicleVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VehicleVoCWProxy get copyWith => _$VehicleVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleVo _$VehicleVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VehicleVo', json, ($checkedConvert) {
      final val = VehicleVo(
        id: $checkedConvert('id', (v) => v as String?),
        number: $checkedConvert('number', (v) => v as String?),
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$VehicleVoTypeEnumEnumMap, v),
        ),
        driving: $checkedConvert('driving', (v) => v as bool?),
        createAt: $checkedConvert(
          'createAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VehicleVoToJson(VehicleVo instance) => <String, dynamic>{
  'id': ?instance.id,
  'number': ?instance.number,
  'type': ?_$VehicleVoTypeEnumEnumMap[instance.type],
  'driving': ?instance.driving,
  'createAt': ?instance.createAt?.toIso8601String(),
};

const _$VehicleVoTypeEnumEnumMap = {
  VehicleVoTypeEnum.LIGHT_TRUCK: 'LIGHT_TRUCK',
  VehicleVoTypeEnum.TRUCK: 'TRUCK',
  VehicleVoTypeEnum.HEAVY_TRUCK: 'HEAVY_TRUCK',
};
