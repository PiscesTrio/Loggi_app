//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminVo {
  /// Returns a new [AdminVo] instance.
  AdminVo({this.id, this.email, this.roles, this.createAt});

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? email;

  @JsonKey(name: r'roles', required: false, includeIfNull: false)
  final List<String>? roles;

  @JsonKey(name: r'createAt', required: false, includeIfNull: false)
  final DateTime? createAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminVo &&
          other.id == id &&
          other.email == email &&
          other.roles == roles &&
          other.createAt == createAt;

  @override
  int get hashCode =>
      id.hashCode + email.hashCode + roles.hashCode + createAt.hashCode;

  factory AdminVo.fromJson(Map<String, dynamic> json) =>
      _$AdminVoFromJson(json);

  Map<String, dynamic> toJson() => _$AdminVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
