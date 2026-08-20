//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WarehouseVo {
  /// Returns a new [WarehouseVo] instance.
  WarehouseVo({
    this.id,

    this.name,

    this.principle,

    this.location,

    this.lat,

    this.lng,

    this.createAt,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  @JsonKey(name: r'principle', required: false, includeIfNull: false)
  final String? principle;

  @JsonKey(name: r'location', required: false, includeIfNull: false)
  final String? location;

  @JsonKey(name: r'lat', required: false, includeIfNull: false)
  final double? lat;

  @JsonKey(name: r'lng', required: false, includeIfNull: false)
  final double? lng;

  @JsonKey(name: r'createAt', required: false, includeIfNull: false)
  final DateTime? createAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WarehouseVo &&
          other.id == id &&
          other.name == name &&
          other.principle == principle &&
          other.location == location &&
          other.lat == lat &&
          other.lng == lng &&
          other.createAt == createAt;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      principle.hashCode +
      location.hashCode +
      lat.hashCode +
      lng.hashCode +
      createAt.hashCode;

  factory WarehouseVo.fromJson(Map<String, dynamic> json) =>
      _$WarehouseVoFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
