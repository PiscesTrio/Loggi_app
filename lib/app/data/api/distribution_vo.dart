//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'driver_summary.dart';
import 'vehicle_summary.dart';
import 'warehouse_summary.dart';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distribution_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DistributionVo {
  /// Returns a new [DistributionVo] instance.
  DistributionVo({
    this.id,

    this.driver,

    this.vehicle,

    this.warehouse,

    this.phone,

    this.address,

    this.urgent,

    this.care,

    this.time,

    this.status,

    this.fromLat,

    this.fromLng,

    this.toLat,

    this.toLng,

    this.createAt,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'driver', required: false, includeIfNull: false)
  final DriverSummary? driver;

  @JsonKey(name: r'vehicle', required: false, includeIfNull: false)
  final VehicleSummary? vehicle;

  @JsonKey(name: r'warehouse', required: false, includeIfNull: false)
  final WarehouseSummary? warehouse;

  @JsonKey(name: r'phone', required: false, includeIfNull: false)
  final String? phone;

  @JsonKey(name: r'address', required: false, includeIfNull: false)
  final String? address;

  @JsonKey(name: r'urgent', required: false, includeIfNull: false)
  final bool? urgent;

  @JsonKey(name: r'care', required: false, includeIfNull: false)
  final String? care;

  @JsonKey(name: r'time', required: false, includeIfNull: false)
  final DateTime? time;

  @JsonKey(name: r'status', required: false, includeIfNull: false)
  final DistributionVoStatusEnum? status;

  @JsonKey(name: r'fromLat', required: false, includeIfNull: false)
  final double? fromLat;

  @JsonKey(name: r'fromLng', required: false, includeIfNull: false)
  final double? fromLng;

  @JsonKey(name: r'toLat', required: false, includeIfNull: false)
  final double? toLat;

  @JsonKey(name: r'toLng', required: false, includeIfNull: false)
  final double? toLng;

  @JsonKey(name: r'createAt', required: false, includeIfNull: false)
  final DateTime? createAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DistributionVo &&
          other.id == id &&
          other.driver == driver &&
          other.vehicle == vehicle &&
          other.warehouse == warehouse &&
          other.phone == phone &&
          other.address == address &&
          other.urgent == urgent &&
          other.care == care &&
          other.time == time &&
          other.status == status &&
          other.fromLat == fromLat &&
          other.fromLng == fromLng &&
          other.toLat == toLat &&
          other.toLng == toLng &&
          other.createAt == createAt;

  @override
  int get hashCode =>
      id.hashCode +
      driver.hashCode +
      vehicle.hashCode +
      warehouse.hashCode +
      phone.hashCode +
      address.hashCode +
      urgent.hashCode +
      care.hashCode +
      time.hashCode +
      status.hashCode +
      fromLat.hashCode +
      fromLng.hashCode +
      toLat.hashCode +
      toLng.hashCode +
      createAt.hashCode;

  factory DistributionVo.fromJson(Map<String, dynamic> json) =>
      _$DistributionVoFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum DistributionVoStatusEnum {
  @JsonValue(r'REVIEWING')
  REVIEWING(r'REVIEWING'),
  @JsonValue(r'REVIEW_SUCCESS')
  REVIEW_SUCCESS(r'REVIEW_SUCCESS'),
  @JsonValue(r'END')
  END(r'END');

  const DistributionVoStatusEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
