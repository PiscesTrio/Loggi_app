// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WarehouseRequestCWProxy {
  WarehouseRequest name(String name);

  WarehouseRequest principle(String? principle);

  WarehouseRequest location(String location);

  WarehouseRequest lat(double? lat);

  WarehouseRequest lng(double? lng);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WarehouseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WarehouseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  WarehouseRequest call({
    String name,
    String? principle,
    String location,
    double? lat,
    double? lng,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfWarehouseRequest.copyWith(...)` or call `instanceOfWarehouseRequest.copyWith.fieldName(value)` for a single field.
class _$WarehouseRequestCWProxyImpl implements _$WarehouseRequestCWProxy {
  const _$WarehouseRequestCWProxyImpl(this._value);

  final WarehouseRequest _value;

  @override
  WarehouseRequest name(String name) => call(name: name);

  @override
  WarehouseRequest principle(String? principle) => call(principle: principle);

  @override
  WarehouseRequest location(String location) => call(location: location);

  @override
  WarehouseRequest lat(double? lat) => call(lat: lat);

  @override
  WarehouseRequest lng(double? lng) => call(lng: lng);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WarehouseRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WarehouseRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  WarehouseRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? principle = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? lat = const $CopyWithPlaceholder(),
    Object? lng = const $CopyWithPlaceholder(),
  }) {
    return WarehouseRequest(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      principle: principle == const $CopyWithPlaceholder()
          ? _value.principle
          // ignore: cast_nullable_to_non_nullable
          : principle as String?,
      location: location == const $CopyWithPlaceholder() || location == null
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String,
      lat: lat == const $CopyWithPlaceholder()
          ? _value.lat
          // ignore: cast_nullable_to_non_nullable
          : lat as double?,
      lng: lng == const $CopyWithPlaceholder()
          ? _value.lng
          // ignore: cast_nullable_to_non_nullable
          : lng as double?,
    );
  }
}

extension $WarehouseRequestCopyWith on WarehouseRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfWarehouseRequest.copyWith(...)` or `instanceOfWarehouseRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WarehouseRequestCWProxy get copyWith => _$WarehouseRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseRequest _$WarehouseRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WarehouseRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name', 'location']);
      final val = WarehouseRequest(
        name: $checkedConvert('name', (v) => v as String),
        principle: $checkedConvert('principle', (v) => v as String?),
        location: $checkedConvert('location', (v) => v as String),
        lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
        lng: $checkedConvert('lng', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$WarehouseRequestToJson(WarehouseRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'principle': ?instance.principle,
      'location': instance.location,
      'lat': ?instance.lat,
      'lng': ?instance.lng,
    };
