// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_fleet_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AvailableFleetVoCWProxy {
  AvailableFleetVo drivers(List<DriverSummary>? drivers);

  AvailableFleetVo vehicles(List<VehicleSummary>? vehicles);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AvailableFleetVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AvailableFleetVo(...).copyWith(id: 12, name: "My name")
  /// ```
  AvailableFleetVo call({
    List<DriverSummary>? drivers,
    List<VehicleSummary>? vehicles,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAvailableFleetVo.copyWith(...)` or call `instanceOfAvailableFleetVo.copyWith.fieldName(value)` for a single field.
class _$AvailableFleetVoCWProxyImpl implements _$AvailableFleetVoCWProxy {
  const _$AvailableFleetVoCWProxyImpl(this._value);

  final AvailableFleetVo _value;

  @override
  AvailableFleetVo drivers(List<DriverSummary>? drivers) =>
      call(drivers: drivers);

  @override
  AvailableFleetVo vehicles(List<VehicleSummary>? vehicles) =>
      call(vehicles: vehicles);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AvailableFleetVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AvailableFleetVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AvailableFleetVo call({
    Object? drivers = const $CopyWithPlaceholder(),
    Object? vehicles = const $CopyWithPlaceholder(),
  }) {
    return AvailableFleetVo(
      drivers: drivers == const $CopyWithPlaceholder()
          ? _value.drivers
          // ignore: cast_nullable_to_non_nullable
          : drivers as List<DriverSummary>?,
      vehicles: vehicles == const $CopyWithPlaceholder()
          ? _value.vehicles
          // ignore: cast_nullable_to_non_nullable
          : vehicles as List<VehicleSummary>?,
    );
  }
}

extension $AvailableFleetVoCopyWith on AvailableFleetVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAvailableFleetVo.copyWith(...)` or `instanceOfAvailableFleetVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AvailableFleetVoCWProxy get copyWith => _$AvailableFleetVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableFleetVo _$AvailableFleetVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AvailableFleetVo', json, ($checkedConvert) {
      final val = AvailableFleetVo(
        drivers: $checkedConvert(
          'drivers',
          (v) => (v as List<dynamic>?)
              ?.map((e) => DriverSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        vehicles: $checkedConvert(
          'vehicles',
          (v) => (v as List<dynamic>?)
              ?.map((e) => VehicleSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AvailableFleetVoToJson(AvailableFleetVo instance) =>
    <String, dynamic>{
      'drivers': ?instance.drivers?.map((e) => e.toJson()).toList(),
      'vehicles': ?instance.vehicles?.map((e) => e.toJson()).toList(),
    };
