// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_summary.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WarehouseSummaryCWProxy {
  WarehouseSummary id(String? id);

  WarehouseSummary name(String? name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WarehouseSummary(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WarehouseSummary(...).copyWith(id: 12, name: "My name")
  /// ```
  WarehouseSummary call({String? id, String? name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfWarehouseSummary.copyWith(...)` or call `instanceOfWarehouseSummary.copyWith.fieldName(value)` for a single field.
class _$WarehouseSummaryCWProxyImpl implements _$WarehouseSummaryCWProxy {
  const _$WarehouseSummaryCWProxyImpl(this._value);

  final WarehouseSummary _value;

  @override
  WarehouseSummary id(String? id) => call(id: id);

  @override
  WarehouseSummary name(String? name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WarehouseSummary(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WarehouseSummary(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  WarehouseSummary call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return WarehouseSummary(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $WarehouseSummaryCopyWith on WarehouseSummary {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfWarehouseSummary.copyWith(...)` or `instanceOfWarehouseSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WarehouseSummaryCWProxy get copyWith => _$WarehouseSummaryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseSummary _$WarehouseSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WarehouseSummary', json, ($checkedConvert) {
      final val = WarehouseSummary(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$WarehouseSummaryToJson(WarehouseSummary instance) =>
    <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};
