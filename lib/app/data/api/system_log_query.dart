//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_log_query.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemLogQuery {
  /// Returns a new [SystemLogQuery] instance.
  SystemLogQuery({this.account, this.module});

  @JsonKey(name: r'account', required: false, includeIfNull: false)
  final String? account;

  @JsonKey(name: r'module', required: false, includeIfNull: false)
  final String? module;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemLogQuery &&
          other.account == account &&
          other.module == module;

  @override
  int get hashCode => account.hashCode + module.hashCode;

  factory SystemLogQuery.fromJson(Map<String, dynamic> json) =>
      _$SystemLogQueryFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogQueryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
