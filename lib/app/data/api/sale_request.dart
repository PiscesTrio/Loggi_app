//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SaleRequest {
  /// Returns a new [SaleRequest] instance.
  SaleRequest({
    required this.company,

    this.number,

    required this.commodity,

    required this.count,

    required this.price,

    this.phone,

    this.description,

    this.pay,
  });

  @JsonKey(name: r'company', required: true, includeIfNull: false)
  final String company;

  @JsonKey(name: r'number', required: false, includeIfNull: false)
  final String? number;

  @JsonKey(name: r'commodity', required: true, includeIfNull: false)
  final String commodity;

  @JsonKey(name: r'count', required: true, includeIfNull: false)
  final int count;

  // minimum: 0.0
  @JsonKey(name: r'price', required: true, includeIfNull: false)
  final num price;

  @JsonKey(name: r'phone', required: false, includeIfNull: false)
  final String? phone;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  @JsonKey(name: r'pay', required: false, includeIfNull: false)
  final bool? pay;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleRequest &&
          other.company == company &&
          other.number == number &&
          other.commodity == commodity &&
          other.count == count &&
          other.price == price &&
          other.phone == phone &&
          other.description == description &&
          other.pay == pay;

  @override
  int get hashCode =>
      company.hashCode +
      number.hashCode +
      commodity.hashCode +
      count.hashCode +
      price.hashCode +
      phone.hashCode +
      description.hashCode +
      pay.hashCode;

  factory SaleRequest.fromJson(Map<String, dynamic> json) =>
      _$SaleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaleRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
