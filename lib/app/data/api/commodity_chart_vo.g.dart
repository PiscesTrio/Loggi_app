// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_chart_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommodityChartVoCWProxy {
  CommodityChartVo value(int? value);

  CommodityChartVo name(String? name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CommodityChartVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CommodityChartVo(...).copyWith(id: 12, name: "My name")
  /// ```
  CommodityChartVo call({int? value, String? name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCommodityChartVo.copyWith(...)` or call `instanceOfCommodityChartVo.copyWith.fieldName(value)` for a single field.
class _$CommodityChartVoCWProxyImpl implements _$CommodityChartVoCWProxy {
  const _$CommodityChartVoCWProxyImpl(this._value);

  final CommodityChartVo _value;

  @override
  CommodityChartVo value(int? value) => call(value: value);

  @override
  CommodityChartVo name(String? name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CommodityChartVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CommodityChartVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CommodityChartVo call({
    Object? value = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return CommodityChartVo(
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $CommodityChartVoCopyWith on CommodityChartVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCommodityChartVo.copyWith(...)` or `instanceOfCommodityChartVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommodityChartVoCWProxy get copyWith => _$CommodityChartVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityChartVo _$CommodityChartVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CommodityChartVo', json, ($checkedConvert) {
      final val = CommodityChartVo(
        value: $checkedConvert('value', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CommodityChartVoToJson(CommodityChartVo instance) =>
    <String, dynamic>{'value': ?instance.value, 'name': ?instance.name};
