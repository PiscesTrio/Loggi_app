import 'package:freezed_annotation/freezed_annotation.dart';

part 'distribution_status.freezed.dart';
part 'distribution_status.g.dart';

/// One recorded position along a delivery.
///
/// `lat`/`lng` are the reason this conversion matters beyond tidiness: the hand-written
/// `fromJson` assigned `json['lat']` straight into a `double?`, which throws if the server
/// ever sends a whole number as an int. The generated code reads
/// `(json['lat'] as num?)?.toDouble()` and accepts both.
@freezed
abstract class DistributionStatus with _$DistributionStatus {
  const factory DistributionStatus({
    String? id,
    String? disId,
    double? lat,
    double? lng,
    String? location,
    String? time,
    int? status,
  }) = _DistributionStatus;

  factory DistributionStatus.fromJson(Map<String, dynamic> json) =>
      _$DistributionStatusFromJson(json);
}
