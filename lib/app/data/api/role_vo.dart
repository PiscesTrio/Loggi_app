//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RoleVo {
  /// Returns a new [RoleVo] instance.
  RoleVo({this.value});

  @JsonKey(name: r'value', required: false, includeIfNull: false)
  final String? value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is RoleVo && other.value == value;

  @override
  int get hashCode => value.hashCode;

  factory RoleVo.fromJson(Map<String, dynamic> json) => _$RoleVoFromJson(json);

  Map<String, dynamic> toJson() => _$RoleVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
