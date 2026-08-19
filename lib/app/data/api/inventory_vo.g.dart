// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InventoryVoCWProxy {
  InventoryVo id(String? id);

  InventoryVo warehouseId(String? warehouseId);

  InventoryVo commodityId(String? commodityId);

  InventoryVo name(String? name);

  InventoryVo location(String? location);

  InventoryVo count(int? count);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InventoryVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InventoryVo(...).copyWith(id: 12, name: "My name")
  /// ```
  InventoryVo call({
    String? id,
    String? warehouseId,
    String? commodityId,
    String? name,
    String? location,
    int? count,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInventoryVo.copyWith(...)` or call `instanceOfInventoryVo.copyWith.fieldName(value)` for a single field.
class _$InventoryVoCWProxyImpl implements _$InventoryVoCWProxy {
  const _$InventoryVoCWProxyImpl(this._value);

  final InventoryVo _value;

  @override
  InventoryVo id(String? id) => call(id: id);

  @override
  InventoryVo warehouseId(String? warehouseId) =>
      call(warehouseId: warehouseId);

  @override
  InventoryVo commodityId(String? commodityId) =>
      call(commodityId: commodityId);

  @override
  InventoryVo name(String? name) => call(name: name);

  @override
  InventoryVo location(String? location) => call(location: location);

  @override
  InventoryVo count(int? count) => call(count: count);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InventoryVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InventoryVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InventoryVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? warehouseId = const $CopyWithPlaceholder(),
    Object? commodityId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return InventoryVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      warehouseId: warehouseId == const $CopyWithPlaceholder()
          ? _value.warehouseId
          // ignore: cast_nullable_to_non_nullable
          : warehouseId as String?,
      commodityId: commodityId == const $CopyWithPlaceholder()
          ? _value.commodityId
          // ignore: cast_nullable_to_non_nullable
          : commodityId as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
    );
  }
}

extension $InventoryVoCopyWith on InventoryVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInventoryVo.copyWith(...)` or `instanceOfInventoryVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InventoryVoCWProxy get copyWith => _$InventoryVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryVo _$InventoryVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InventoryVo', json, ($checkedConvert) {
      final val = InventoryVo(
        id: $checkedConvert('id', (v) => v as String?),
        warehouseId: $checkedConvert('warehouseId', (v) => v as String?),
        commodityId: $checkedConvert('commodityId', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        location: $checkedConvert('location', (v) => v as String?),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$InventoryVoToJson(InventoryVo instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'warehouseId': ?instance.warehouseId,
      'commodityId': ?instance.commodityId,
      'name': ?instance.name,
      'location': ?instance.location,
      'count': ?instance.count,
    };
