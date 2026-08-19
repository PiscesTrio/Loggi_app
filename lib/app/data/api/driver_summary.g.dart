// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_summary.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DriverSummaryCWProxy {
  DriverSummary id(String? id);

  DriverSummary name(String? name);

  DriverSummary phone(String? phone);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DriverSummary(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DriverSummary(...).copyWith(id: 12, name: "My name")
  /// ```
  DriverSummary call({String? id, String? name, String? phone});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDriverSummary.copyWith(...)` or call `instanceOfDriverSummary.copyWith.fieldName(value)` for a single field.
class _$DriverSummaryCWProxyImpl implements _$DriverSummaryCWProxy {
  const _$DriverSummaryCWProxyImpl(this._value);

  final DriverSummary _value;

  @override
  DriverSummary id(String? id) => call(id: id);

  @override
  DriverSummary name(String? name) => call(name: name);

  @override
  DriverSummary phone(String? phone) => call(phone: phone);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DriverSummary(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DriverSummary(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DriverSummary call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
  }) {
    return DriverSummary(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
    );
  }
}

extension $DriverSummaryCopyWith on DriverSummary {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDriverSummary.copyWith(...)` or `instanceOfDriverSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DriverSummaryCWProxy get copyWith => _$DriverSummaryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverSummary _$DriverSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DriverSummary', json, ($checkedConvert) {
      final val = DriverSummary(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DriverSummaryToJson(DriverSummary instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'phone': ?instance.phone,
    };
