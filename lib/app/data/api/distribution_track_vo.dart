//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distribution_track_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DistributionTrackVo {
  /// Returns a new [DistributionTrackVo] instance.
  DistributionTrackVo({
    this.id,

    this.distributionId,

    this.lat,

    this.lng,

    this.location,

    this.time,

    this.status,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'distributionId', required: false, includeIfNull: false)
  final String? distributionId;

  @JsonKey(name: r'lat', required: false, includeIfNull: false)
  final double? lat;

  @JsonKey(name: r'lng', required: false, includeIfNull: false)
  final double? lng;

  @JsonKey(name: r'location', required: false, includeIfNull: false)
  final String? location;

  @JsonKey(name: r'time', required: false, includeIfNull: false)
  final DateTime? time;

  @JsonKey(name: r'status', required: false, includeIfNull: false)
  final DistributionTrackVoStatusEnum? status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DistributionTrackVo &&
          other.id == id &&
          other.distributionId == distributionId &&
          other.lat == lat &&
          other.lng == lng &&
          other.location == location &&
          other.time == time &&
          other.status == status;

  @override
  int get hashCode =>
      id.hashCode +
      distributionId.hashCode +
      lat.hashCode +
      lng.hashCode +
      location.hashCode +
      time.hashCode +
      status.hashCode;

  factory DistributionTrackVo.fromJson(Map<String, dynamic> json) =>
      _$DistributionTrackVoFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionTrackVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum DistributionTrackVoStatusEnum {
  @JsonValue(r'REVIEWING')
  REVIEWING(r'REVIEWING'),
  @JsonValue(r'REVIEW_SUCCESS')
  REVIEW_SUCCESS(r'REVIEW_SUCCESS'),
  @JsonValue(r'END')
  END(r'END');

  const DistributionTrackVoStatusEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
