// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_summary.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VehicleSummaryCWProxy {
  VehicleSummary id(String? id);

  VehicleSummary number(String? number);

  VehicleSummary type(VehicleSummaryTypeEnum? type);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `VehicleSummary(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// VehicleSummary(...).copyWith(id: 12, name: "My name")
  /// ```
  VehicleSummary call({
    String? id,
    String? number,
    VehicleSummaryTypeEnum? type,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfVehicleSummary.copyWith(...)` or call `instanceOfVehicleSummary.copyWith.fieldName(value)` for a single field.
class _$VehicleSummaryCWProxyImpl implements _$VehicleSummaryCWProxy {
  const _$VehicleSummaryCWProxyImpl(this._value);

  final VehicleSummary _value;

  @override
  VehicleSummary id(String? id) => call(id: id);

  @override
  VehicleSummary number(String? number) => call(number: number);

  @override
  VehicleSummary type(VehicleSummaryTypeEnum? type) => call(type: type);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `VehicleSummary(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// VehicleSummary(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  VehicleSummary call({
    Object? id = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return VehicleSummary(
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
          : type as VehicleSummaryTypeEnum?,
    );
  }
}

extension $VehicleSummaryCopyWith on VehicleSummary {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfVehicleSummary.copyWith(...)` or `instanceOfVehicleSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VehicleSummaryCWProxy get copyWith => _$VehicleSummaryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleSummary _$VehicleSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VehicleSummary', json, ($checkedConvert) {
      final val = VehicleSummary(
        id: $checkedConvert('id', (v) => v as String?),
        number: $checkedConvert('number', (v) => v as String?),
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$VehicleSummaryTypeEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VehicleSummaryToJson(VehicleSummary instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'number': ?instance.number,
      'type': ?_$VehicleSummaryTypeEnumEnumMap[instance.type],
    };

const _$VehicleSummaryTypeEnumEnumMap = {
  VehicleSummaryTypeEnum.LIGHT_TRUCK: 'LIGHT_TRUCK',
  VehicleSummaryTypeEnum.TRUCK: 'TRUCK',
  VehicleSummaryTypeEnum.HEAVY_TRUCK: 'HEAVY_TRUCK',
};
