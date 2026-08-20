//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EmployeeVo {
  /// Returns a new [EmployeeVo] instance.
  EmployeeVo({
    this.id,

    this.name,

    this.gender,

    this.phone,

    this.address,

    this.department,

    this.createAt,

    this.updateAt,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  @JsonKey(name: r'gender', required: false, includeIfNull: false)
  final EmployeeVoGenderEnum? gender;

  @JsonKey(name: r'phone', required: false, includeIfNull: false)
  final String? phone;

  @JsonKey(name: r'address', required: false, includeIfNull: false)
  final String? address;

  @JsonKey(name: r'department', required: false, includeIfNull: false)
  final String? department;

  @JsonKey(name: r'createAt', required: false, includeIfNull: false)
  final DateTime? createAt;

  @JsonKey(name: r'updateAt', required: false, includeIfNull: false)
  final DateTime? updateAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeVo &&
          other.id == id &&
          other.name == name &&
          other.gender == gender &&
          other.phone == phone &&
          other.address == address &&
          other.department == department &&
          other.createAt == createAt &&
          other.updateAt == updateAt;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      gender.hashCode +
      phone.hashCode +
      address.hashCode +
      department.hashCode +
      createAt.hashCode +
      updateAt.hashCode;

  factory EmployeeVo.fromJson(Map<String, dynamic> json) =>
      _$EmployeeVoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum EmployeeVoGenderEnum {
  @JsonValue(r'MALE')
  MALE(r'MALE'),
  @JsonValue(r'FEMALE')
  FEMALE(r'FEMALE');

  const EmployeeVoGenderEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
