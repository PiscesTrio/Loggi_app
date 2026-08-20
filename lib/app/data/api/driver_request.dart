//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DriverRequest {
  /// Returns a new [DriverRequest] instance.
  DriverRequest({
    required this.name,

    this.gender,

    required this.phone,

    this.address,

    this.idCard,

    this.license,

    this.score,
  });

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'gender', required: false, includeIfNull: false)
  final String? gender;

  @JsonKey(name: r'phone', required: true, includeIfNull: false)
  final String phone;

  @JsonKey(name: r'address', required: false, includeIfNull: false)
  final String? address;

  @JsonKey(name: r'idCard', required: false, includeIfNull: false)
  final String? idCard;

  @JsonKey(name: r'license', required: false, includeIfNull: false)
  final String? license;

  @JsonKey(name: r'score', required: false, includeIfNull: false)
  final String? score;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverRequest &&
          other.name == name &&
          other.gender == gender &&
          other.phone == phone &&
          other.address == address &&
          other.idCard == idCard &&
          other.license == license &&
          other.score == score;

  @override
  int get hashCode =>
      name.hashCode +
      gender.hashCode +
      phone.hashCode +
      address.hashCode +
      idCard.hashCode +
      license.hashCode +
      score.hashCode;

  factory DriverRequest.fromJson(Map<String, dynamic> json) =>
      _$DriverRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DriverRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
