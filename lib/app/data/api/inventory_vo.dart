//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InventoryVo {
  /// Returns a new [InventoryVo] instance.
  InventoryVo({
    this.id,

    this.warehouseId,

    this.commodityId,

    this.name,

    this.location,

    this.count,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final String? id;

  @JsonKey(name: r'warehouseId', required: false, includeIfNull: false)
  final String? warehouseId;

  @JsonKey(name: r'commodityId', required: false, includeIfNull: false)
  final String? commodityId;

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  @JsonKey(name: r'location', required: false, includeIfNull: false)
  final String? location;

  @JsonKey(name: r'count', required: false, includeIfNull: false)
  final int? count;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryVo &&
          other.id == id &&
          other.warehouseId == warehouseId &&
          other.commodityId == commodityId &&
          other.name == name &&
          other.location == location &&
          other.count == count;

  @override
  int get hashCode =>
      id.hashCode +
      warehouseId.hashCode +
      commodityId.hashCode +
      name.hashCode +
      location.hashCode +
      count.hashCode;

  factory InventoryVo.fromJson(Map<String, dynamic> json) =>
      _$InventoryVoFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
