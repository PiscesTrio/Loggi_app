//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distribution_status_change.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DistributionStatusChange {
  /// Returns a new [DistributionStatusChange] instance.
  DistributionStatusChange({required this.status});

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final DistributionStatusChangeStatusEnum status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DistributionStatusChange && other.status == status;

  @override
  int get hashCode => status.hashCode;

  factory DistributionStatusChange.fromJson(Map<String, dynamic> json) =>
      _$DistributionStatusChangeFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionStatusChangeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum DistributionStatusChangeStatusEnum {
  @JsonValue(r'REVIEWING')
  REVIEWING(r'REVIEWING'),
  @JsonValue(r'REVIEW_SUCCESS')
  REVIEW_SUCCESS(r'REVIEW_SUCCESS'),
  @JsonValue(r'END')
  END(r'END');

  const DistributionStatusChangeStatusEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
