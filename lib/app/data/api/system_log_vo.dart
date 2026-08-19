//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_log_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemLogVo {
  /// Returns a new [SystemLogVo] instance.
  SystemLogVo({
    this.id,

    this.account,

    this.module,

    this.businessType,

    this.ip,

    this.method,

    this.costMs,

    this.success,

    this.time,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'account', required: false, includeIfNull: false)
  final String? account;

  @JsonKey(name: r'module', required: false, includeIfNull: false)
  final String? module;

  @JsonKey(name: r'businessType', required: false, includeIfNull: false)
  final SystemLogVoBusinessTypeEnum? businessType;

  @JsonKey(name: r'ip', required: false, includeIfNull: false)
  final String? ip;

  @JsonKey(name: r'method', required: false, includeIfNull: false)
  final String? method;

  @JsonKey(name: r'costMs', required: false, includeIfNull: false)
  final int? costMs;

  @JsonKey(name: r'success', required: false, includeIfNull: false)
  final bool? success;

  @JsonKey(name: r'time', required: false, includeIfNull: false)
  final DateTime? time;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemLogVo &&
          other.id == id &&
          other.account == account &&
          other.module == module &&
          other.businessType == businessType &&
          other.ip == ip &&
          other.method == method &&
          other.costMs == costMs &&
          other.success == success &&
          other.time == time;

  @override
  int get hashCode =>
      id.hashCode +
      account.hashCode +
      module.hashCode +
      businessType.hashCode +
      ip.hashCode +
      method.hashCode +
      costMs.hashCode +
      success.hashCode +
      time.hashCode;

  factory SystemLogVo.fromJson(Map<String, dynamic> json) =>
      _$SystemLogVoFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum SystemLogVoBusinessTypeEnum {
  @JsonValue(r'OTHER')
  OTHER(r'OTHER'),
  @JsonValue(r'QUERY')
  QUERY(r'QUERY'),
  @JsonValue(r'INSERT')
  INSERT(r'INSERT'),
  @JsonValue(r'UPDATE')
  UPDATE(r'UPDATE'),
  @JsonValue(r'DELETE')
  DELETE(r'DELETE'),
  @JsonValue(r'EXPORT')
  EXPORT(r'EXPORT'),
  @JsonValue(r'FORCE')
  FORCE(r'FORCE');

  const SystemLogVoBusinessTypeEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
