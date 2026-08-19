//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleRequest {
  /// Returns a new [VehicleRequest] instance.
  VehicleRequest({required this.number, required this.type});

  @JsonKey(name: r'number', required: true, includeIfNull: false)
  final String number;

  @JsonKey(name: r'type', required: true, includeIfNull: false)
  final String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleRequest && other.number == number && other.type == type;

  @override
  int get hashCode => number.hashCode + type.hashCode;

  factory VehicleRequest.fromJson(Map<String, dynamic> json) =>
      _$VehicleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
