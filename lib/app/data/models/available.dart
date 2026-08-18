import 'package:freezed_annotation/freezed_annotation.dart';

import 'driver.dart';
import 'vehicle.dart';

part 'available.freezed.dart';
part 'available.g.dart';

/// Who and what is free to be dispatched.
///
/// The hand-written version did `json['drivers'].map(...)` with no null check, so a
/// response missing either key threw a NoSuchMethodError on null from inside the decode.
/// The generated reader treats an absent list as null, which is what the callers already
/// test for.
@freezed
abstract class Available with _$Available {
  const factory Available({
    List<Driver>? drivers,
    List<Vehicle>? vehicles,
  }) = _Available;

  factory Available.fromJson(Map<String, dynamic> json) => _$AvailableFromJson(json);
}
