// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_movement_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InventoryMovementRequestCWProxy {
  InventoryMovementRequest warehouseId(String warehouseId);

  InventoryMovementRequest commodityId(String commodityId);

  InventoryMovementRequest count(int count);

  InventoryMovementRequest description(String? description);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InventoryMovementRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InventoryMovementRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  InventoryMovementRequest call({
    String warehouseId,
    String commodityId,
    int count,
    String? description,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInventoryMovementRequest.copyWith(...)` or call `instanceOfInventoryMovementRequest.copyWith.fieldName(value)` for a single field.
class _$InventoryMovementRequestCWProxyImpl
    implements _$InventoryMovementRequestCWProxy {
  const _$InventoryMovementRequestCWProxyImpl(this._value);

  final InventoryMovementRequest _value;

  @override
  InventoryMovementRequest warehouseId(String warehouseId) =>
      call(warehouseId: warehouseId);

  @override
  InventoryMovementRequest commodityId(String commodityId) =>
      call(commodityId: commodityId);

  @override
  InventoryMovementRequest count(int count) => call(count: count);

  @override
  InventoryMovementRequest description(String? description) =>
      call(description: description);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InventoryMovementRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InventoryMovementRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InventoryMovementRequest call({
    Object? warehouseId = const $CopyWithPlaceholder(),
    Object? commodityId = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return InventoryMovementRequest(
      warehouseId:
          warehouseId == const $CopyWithPlaceholder() || warehouseId == null
          ? _value.warehouseId
          // ignore: cast_nullable_to_non_nullable
          : warehouseId as String,
      commodityId:
          commodityId == const $CopyWithPlaceholder() || commodityId == null
          ? _value.commodityId
          // ignore: cast_nullable_to_non_nullable
          : commodityId as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $InventoryMovementRequestCopyWith on InventoryMovementRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInventoryMovementRequest.copyWith(...)` or `instanceOfInventoryMovementRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InventoryMovementRequestCWProxy get copyWith =>
      _$InventoryMovementRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryMovementRequest _$InventoryMovementRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('InventoryMovementRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['warehouseId', 'commodityId', 'count']);
  final val = InventoryMovementRequest(
    warehouseId: $checkedConvert('warehouseId', (v) => v as String),
    commodityId: $checkedConvert('commodityId', (v) => v as String),
    count: $checkedConvert('count', (v) => (v as num).toInt()),
    description: $checkedConvert('description', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$InventoryMovementRequestToJson(
  InventoryMovementRequest instance,
) => <String, dynamic>{
  'warehouseId': instance.warehouseId,
  'commodityId': instance.commodityId,
  'count': instance.count,
  'description': ?instance.description,
};
