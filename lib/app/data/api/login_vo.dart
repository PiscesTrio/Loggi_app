//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'admin_vo.dart';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginVo {
  /// Returns a new [LoginVo] instance.
  LoginVo({this.admin, this.token});

  @JsonKey(name: r'admin', required: false, includeIfNull: false)
  final AdminVo? admin;

  @JsonKey(name: r'token', required: false, includeIfNull: false)
  final String? token;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginVo && other.admin == admin && other.token == token;

  @override
  int get hashCode => admin.hashCode + token.hashCode;

  factory LoginVo.fromJson(Map<String, dynamic> json) =>
      _$LoginVoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
