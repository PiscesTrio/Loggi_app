//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory_movement_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InventoryMovementRequest {
  /// Returns a new [InventoryMovementRequest] instance.
  InventoryMovementRequest({
    required this.warehouseId,

    required this.commodityId,

    required this.count,

    this.description,
  });

  @JsonKey(name: r'warehouseId', required: true, includeIfNull: false)
  final String warehouseId;

  @JsonKey(name: r'commodityId', required: true, includeIfNull: false)
  final String commodityId;

  // minimum: 1
  @JsonKey(name: r'count', required: true, includeIfNull: false)
  final int count;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryMovementRequest &&
          other.warehouseId == warehouseId &&
          other.commodityId == commodityId &&
          other.count == count &&
          other.description == description;

  @override
  int get hashCode =>
      warehouseId.hashCode +
      commodityId.hashCode +
      count.hashCode +
      description.hashCode;

  factory InventoryMovementRequest.fromJson(Map<String, dynamic> json) =>
      _$InventoryMovementRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryMovementRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
