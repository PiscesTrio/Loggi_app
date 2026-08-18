import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver.freezed.dart';
part 'driver.g.dart';

/// A driver, as the API returns one.
///
/// Immutable, with `==`, `copyWith` and `fromJson` generated. What it replaces was a
/// hand-written class whose `fromJson` assigned `dynamic` straight into typed fields — a
/// pattern that works until the server sends a number in a shape Dart will not implicitly
/// convert, and then throws inside the decode rather than at a place anyone would look.
@freezed
abstract class Driver with _$Driver {
  const factory Driver({
    String? id,
    String? name,
    String? gender,
    String? phone,
    String? address,
    String? idCard,
    String? license,
    String? score,
    bool? driving,
    String? createAt,
    String? updateAt,
  }) = _Driver;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}
