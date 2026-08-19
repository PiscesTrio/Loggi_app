//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DriverVo {
  /// Returns a new [DriverVo] instance.
  DriverVo({
    this.id,

    this.name,

    this.gender,

    this.phone,

    this.address,

    this.license,

    this.score,

    this.driving,

    this.createAt,

    this.updateAt,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  @JsonKey(name: r'gender', required: false, includeIfNull: false)
  final String? gender;

  @JsonKey(name: r'phone', required: false, includeIfNull: false)
  final String? phone;

  @JsonKey(name: r'address', required: false, includeIfNull: false)
  final String? address;

  @JsonKey(name: r'license', required: false, includeIfNull: false)
  final String? license;

  @JsonKey(name: r'score', required: false, includeIfNull: false)
  final String? score;

  @JsonKey(name: r'driving', required: false, includeIfNull: false)
  final bool? driving;

  @JsonKey(name: r'createAt', required: false, includeIfNull: false)
  final DateTime? createAt;

  @JsonKey(name: r'updateAt', required: false, includeIfNull: false)
  final DateTime? updateAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverVo &&
          other.id == id &&
          other.name == name &&
          other.gender == gender &&
          other.phone == phone &&
          other.address == address &&
          other.license == license &&
          other.score == score &&
          other.driving == driving &&
          other.createAt == createAt &&
          other.updateAt == updateAt;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      gender.hashCode +
      phone.hashCode +
      address.hashCode +
      license.hashCode +
      score.hashCode +
      driving.hashCode +
      createAt.hashCode +
      updateAt.hashCode;

  factory DriverVo.fromJson(Map<String, dynamic> json) =>
      _$DriverVoFromJson(json);

  Map<String, dynamic> toJson() => _$DriverVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
