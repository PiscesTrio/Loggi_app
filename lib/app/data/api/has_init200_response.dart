//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'has_init200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HasInit200Response {
  /// Returns a new [HasInit200Response] instance.
  HasInit200Response({this.code, this.data, this.status, this.msg});

  /// Repeats the HTTP status.
  @JsonKey(name: r'code', required: false, includeIfNull: false)
  final int? code;

  @JsonKey(name: r'data', required: false, includeIfNull: false)
  final bool? data;

  /// False on a failure.
  @JsonKey(name: r'status', required: false, includeIfNull: false)
  final bool? status;

  /// Set on a failure.
  @JsonKey(name: r'msg', required: false, includeIfNull: false)
  final String? msg;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HasInit200Response &&
          other.code == code &&
          other.data == data &&
          other.status == status &&
          other.msg == msg;

  @override
  int get hashCode =>
      code.hashCode + data.hashCode + status.hashCode + msg.hashCode;

  factory HasInit200Response.fromJson(Map<String, dynamic> json) =>
      _$HasInit200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HasInit200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
