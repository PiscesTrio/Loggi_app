//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distribution_track_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DistributionTrackRequest {
  /// Returns a new [DistributionTrackRequest] instance.
  DistributionTrackRequest({
    required this.distributionId,

    this.lat,

    this.lng,

    this.location,

    required this.status,
  });

  @JsonKey(name: r'distributionId', required: true, includeIfNull: false)
  final String distributionId;

  // minimum: -90.0
  // maximum: 90.0
  @JsonKey(name: r'lat', required: false, includeIfNull: false)
  final double? lat;

  // minimum: -180.0
  // maximum: 180.0
  @JsonKey(name: r'lng', required: false, includeIfNull: false)
  final double? lng;

  @JsonKey(name: r'location', required: false, includeIfNull: false)
  final String? location;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final DistributionTrackRequestStatusEnum status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DistributionTrackRequest &&
          other.distributionId == distributionId &&
          other.lat == lat &&
          other.lng == lng &&
          other.location == location &&
          other.status == status;

  @override
  int get hashCode =>
      distributionId.hashCode +
      lat.hashCode +
      lng.hashCode +
      location.hashCode +
      status.hashCode;

  factory DistributionTrackRequest.fromJson(Map<String, dynamic> json) =>
      _$DistributionTrackRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionTrackRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum DistributionTrackRequestStatusEnum {
  @JsonValue(r'REVIEWING')
  REVIEWING(r'REVIEWING'),
  @JsonValue(r'REVIEW_SUCCESS')
  REVIEW_SUCCESS(r'REVIEW_SUCCESS'),
  @JsonValue(r'END')
  END(r'END');

  const DistributionTrackRequestStatusEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
