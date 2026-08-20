//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityRequest {
  /// Returns a new [CommodityRequest] instance.
  CommodityRequest({
    required this.name,

    required this.price,

    this.description,

    this.count,
  });

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  // minimum: 0.0
  @JsonKey(name: r'price', required: true, includeIfNull: false)
  final num price;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  @JsonKey(name: r'count', required: false, includeIfNull: false)
  final int? count;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommodityRequest &&
          other.name == name &&
          other.price == price &&
          other.description == description &&
          other.count == count;

  @override
  int get hashCode =>
      name.hashCode + price.hashCode + description.hashCode + count.hashCode;

  factory CommodityRequest.fromJson(Map<String, dynamic> json) =>
      _$CommodityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
