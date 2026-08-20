//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleVo {
  /// Returns a new [VehicleVo] instance.
  VehicleVo({this.id, this.number, this.type, this.driving, this.createAt});

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'number', required: false, includeIfNull: false)
  final String? number;

  @JsonKey(name: r'type', required: false, includeIfNull: false)
  final VehicleVoTypeEnum? type;

  @JsonKey(name: r'driving', required: false, includeIfNull: false)
  final bool? driving;

  @JsonKey(name: r'createAt', required: false, includeIfNull: false)
  final DateTime? createAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleVo &&
          other.id == id &&
          other.number == number &&
          other.type == type &&
          other.driving == driving &&
          other.createAt == createAt;

  @override
  int get hashCode =>
      id.hashCode +
      number.hashCode +
      type.hashCode +
      driving.hashCode +
      createAt.hashCode;

  factory VehicleVo.fromJson(Map<String, dynamic> json) =>
      _$VehicleVoFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum VehicleVoTypeEnum {
  @JsonValue(r'LIGHT_TRUCK')
  LIGHT_TRUCK(r'LIGHT_TRUCK'),
  @JsonValue(r'TRUCK')
  TRUCK(r'TRUCK'),
  @JsonValue(r'HEAVY_TRUCK')
  HEAVY_TRUCK(r'HEAVY_TRUCK');

  const VehicleVoTypeEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
