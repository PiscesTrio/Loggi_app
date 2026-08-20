//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WarehouseRequest {
  /// Returns a new [WarehouseRequest] instance.
  WarehouseRequest({
    required this.name,

    this.principle,

    required this.location,

    this.lat,

    this.lng,
  });

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'principle', required: false, includeIfNull: false)
  final String? principle;

  @JsonKey(name: r'location', required: true, includeIfNull: false)
  final String location;

  // minimum: -90.0
  // maximum: 90.0
  @JsonKey(name: r'lat', required: false, includeIfNull: false)
  final double? lat;

  // minimum: -180.0
  // maximum: 180.0
  @JsonKey(name: r'lng', required: false, includeIfNull: false)
  final double? lng;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WarehouseRequest &&
          other.name == name &&
          other.principle == principle &&
          other.location == location &&
          other.lat == lat &&
          other.lng == lng;

  @override
  int get hashCode =>
      name.hashCode +
      principle.hashCode +
      location.hashCode +
      lat.hashCode +
      lng.hashCode;

  factory WarehouseRequest.fromJson(Map<String, dynamic> json) =>
      _$WarehouseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
