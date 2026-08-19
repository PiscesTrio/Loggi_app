// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WarehouseVoCWProxy {
  WarehouseVo id(String? id);

  WarehouseVo name(String? name);

  WarehouseVo principle(String? principle);

  WarehouseVo location(String? location);

  WarehouseVo lat(double? lat);

  WarehouseVo lng(double? lng);

  WarehouseVo createAt(DateTime? createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WarehouseVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WarehouseVo(...).copyWith(id: 12, name: "My name")
  /// ```
  WarehouseVo call({
    String? id,
    String? name,
    String? principle,
    String? location,
    double? lat,
    double? lng,
    DateTime? createAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfWarehouseVo.copyWith(...)` or call `instanceOfWarehouseVo.copyWith.fieldName(value)` for a single field.
class _$WarehouseVoCWProxyImpl implements _$WarehouseVoCWProxy {
  const _$WarehouseVoCWProxyImpl(this._value);

  final WarehouseVo _value;

  @override
  WarehouseVo id(String? id) => call(id: id);

  @override
  WarehouseVo name(String? name) => call(name: name);

  @override
  WarehouseVo principle(String? principle) => call(principle: principle);

  @override
  WarehouseVo location(String? location) => call(location: location);

  @override
  WarehouseVo lat(double? lat) => call(lat: lat);

  @override
  WarehouseVo lng(double? lng) => call(lng: lng);

  @override
  WarehouseVo createAt(DateTime? createAt) => call(createAt: createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WarehouseVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WarehouseVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  WarehouseVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? principle = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? lat = const $CopyWithPlaceholder(),
    Object? lng = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
  }) {
    return WarehouseVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      principle: principle == const $CopyWithPlaceholder()
          ? _value.principle
          // ignore: cast_nullable_to_non_nullable
          : principle as String?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      lat: lat == const $CopyWithPlaceholder()
          ? _value.lat
          // ignore: cast_nullable_to_non_nullable
          : lat as double?,
      lng: lng == const $CopyWithPlaceholder()
          ? _value.lng
          // ignore: cast_nullable_to_non_nullable
          : lng as double?,
      createAt: createAt == const $CopyWithPlaceholder()
          ? _value.createAt
          // ignore: cast_nullable_to_non_nullable
          : createAt as DateTime?,
    );
  }
}

extension $WarehouseVoCopyWith on WarehouseVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfWarehouseVo.copyWith(...)` or `instanceOfWarehouseVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WarehouseVoCWProxy get copyWith => _$WarehouseVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseVo _$WarehouseVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WarehouseVo', json, ($checkedConvert) {
      final val = WarehouseVo(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        principle: $checkedConvert('principle', (v) => v as String?),
        location: $checkedConvert('location', (v) => v as String?),
        lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
        lng: $checkedConvert('lng', (v) => (v as num?)?.toDouble()),
        createAt: $checkedConvert(
          'createAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$WarehouseVoToJson(WarehouseVo instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'principle': ?instance.principle,
      'location': ?instance.location,
      'lat': ?instance.lat,
      'lng': ?instance.lng,
      'createAt': ?instance.createAt?.toIso8601String(),
    };
