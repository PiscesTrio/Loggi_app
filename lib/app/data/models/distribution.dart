import 'package:freezed_annotation/freezed_annotation.dart';

part 'distribution.freezed.dart';
part 'distribution.g.dart';

/// A delivery order.
///
/// The four coordinates are why this model was named in the slice plan. The hand-written
/// `fromJson` did `fromLat = json['fromLat']` — assigning `dynamic` into a `double?`, which
/// works only as long as the server never sends a whole number as an int. The generated
/// reader is `(json['fromLat'] as num?)?.toDouble()`.
///
/// Immutable, which is the larger change: `distribution_apply` used to edit this object in
/// place through `Rx.update`, so the value a listener held could change underneath it
/// without the listener being told. Every edit now produces a new instance.
@freezed
abstract class Distribution with _$Distribution {
  const factory Distribution({
    String? id,
    String? did,
    String? vid,
    String? driver,
    String? number,
    String? phone,
    String? address,
    bool? urgent,
    String? care,
    String? time,
    int? status,
    String? wid,
    double? fromLat,
    double? fromLng,
    double? toLat,
    double? toLng,
  }) = _Distribution;

  factory Distribution.fromJson(Map<String, dynamic> json) =>
      _$DistributionFromJson(json);
}
