//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_log_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginLogVo {
  /// Returns a new [LoginLogVo] instance.
  LoginLogVo({
    this.id,

    this.email,

    this.status,

    this.ip,

    this.browser,

    this.date,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? email;

  @JsonKey(name: r'status', required: false, includeIfNull: false)
  final int? status;

  @JsonKey(name: r'ip', required: false, includeIfNull: false)
  final String? ip;

  @JsonKey(name: r'browser', required: false, includeIfNull: false)
  final LoginLogVoBrowserEnum? browser;

  @JsonKey(name: r'date', required: false, includeIfNull: false)
  final DateTime? date;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginLogVo &&
          other.id == id &&
          other.email == email &&
          other.status == status &&
          other.ip == ip &&
          other.browser == browser &&
          other.date == date;

  @override
  int get hashCode =>
      id.hashCode +
      email.hashCode +
      status.hashCode +
      ip.hashCode +
      browser.hashCode +
      date.hashCode;

  factory LoginLogVo.fromJson(Map<String, dynamic> json) =>
      _$LoginLogVoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginLogVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum LoginLogVoBrowserEnum {
  @JsonValue(r'CHROME')
  CHROME(r'CHROME'),
  @JsonValue(r'SAFARI')
  SAFARI(r'SAFARI'),
  @JsonValue(r'FIREFOX')
  FIREFOX(r'FIREFOX'),
  @JsonValue(r'EDGE')
  EDGE(r'EDGE'),
  @JsonValue(r'IE')
  IE(r'IE'),
  @JsonValue(r'OPERA')
  OPERA(r'OPERA'),
  @JsonValue(r'QQ')
  QQ(r'QQ'),
  @JsonValue(r'UC')
  UC(r'UC'),
  @JsonValue(r'SOGOU')
  SOGOU(r'SOGOU'),
  @JsonValue(r'BAIDU')
  BAIDU(r'BAIDU'),
  @JsonValue(r'QIHOO_360')
  QIHOO_360(r'QIHOO_360'),
  @JsonValue(r'LIEBAO')
  LIEBAO(r'LIEBAO'),
  @JsonValue(r'MAXTHON')
  MAXTHON(r'MAXTHON'),
  @JsonValue(r'THE_WORLD')
  THE_WORLD(r'THE_WORLD'),
  @JsonValue(r'QUARK')
  QUARK(r'QUARK'),
  @JsonValue(r'KONQUEROR')
  KONQUEROR(r'KONQUEROR'),
  @JsonValue(r'CAMINO')
  CAMINO(r'CAMINO'),
  @JsonValue(r'AVAST')
  AVAST(r'AVAST'),
  @JsonValue(r'UNKNOWN')
  UNKNOWN(r'UNKNOWN');

  const LoginLogVoBrowserEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
