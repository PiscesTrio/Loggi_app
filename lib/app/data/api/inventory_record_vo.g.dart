// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_record_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InventoryRecordVoCWProxy {
  InventoryRecordVo id(String? id);

  InventoryRecordVo warehouseId(String? warehouseId);

  InventoryRecordVo commodityId(String? commodityId);

  InventoryRecordVo name(String? name);

  InventoryRecordVo count(int? count);

  InventoryRecordVo type(InventoryRecordVoTypeEnum? type);

  InventoryRecordVo description(String? description);

  InventoryRecordVo createAt(DateTime? createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InventoryRecordVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InventoryRecordVo(...).copyWith(id: 12, name: "My name")
  /// ```
  InventoryRecordVo call({
    String? id,
    String? warehouseId,
    String? commodityId,
    String? name,
    int? count,
    InventoryRecordVoTypeEnum? type,
    String? description,
    DateTime? createAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInventoryRecordVo.copyWith(...)` or call `instanceOfInventoryRecordVo.copyWith.fieldName(value)` for a single field.
class _$InventoryRecordVoCWProxyImpl implements _$InventoryRecordVoCWProxy {
  const _$InventoryRecordVoCWProxyImpl(this._value);

  final InventoryRecordVo _value;

  @override
  InventoryRecordVo id(String? id) => call(id: id);

  @override
  InventoryRecordVo warehouseId(String? warehouseId) =>
      call(warehouseId: warehouseId);

  @override
  InventoryRecordVo commodityId(String? commodityId) =>
      call(commodityId: commodityId);

  @override
  InventoryRecordVo name(String? name) => call(name: name);

  @override
  InventoryRecordVo count(int? count) => call(count: count);

  @override
  InventoryRecordVo type(InventoryRecordVoTypeEnum? type) => call(type: type);

  @override
  InventoryRecordVo description(String? description) =>
      call(description: description);

  @override
  InventoryRecordVo createAt(DateTime? createAt) => call(createAt: createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InventoryRecordVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InventoryRecordVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InventoryRecordVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? warehouseId = const $CopyWithPlaceholder(),
    Object? commodityId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
  }) {
    return InventoryRecordVo(
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
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as InventoryRecordVoTypeEnum?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      createAt: createAt == const $CopyWithPlaceholder()
          ? _value.createAt
          // ignore: cast_nullable_to_non_nullable
          : createAt as DateTime?,
    );
  }
}

extension $InventoryRecordVoCopyWith on InventoryRecordVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInventoryRecordVo.copyWith(...)` or `instanceOfInventoryRecordVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InventoryRecordVoCWProxy get copyWith =>
      _$InventoryRecordVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryRecordVo _$InventoryRecordVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InventoryRecordVo', json, ($checkedConvert) {
      final val = InventoryRecordVo(
        id: $checkedConvert('id', (v) => v as String?),
        warehouseId: $checkedConvert('warehouseId', (v) => v as String?),
        commodityId: $checkedConvert('commodityId', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$InventoryRecordVoTypeEnumEnumMap, v),
        ),
        description: $checkedConvert('description', (v) => v as String?),
        createAt: $checkedConvert(
          'createAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InventoryRecordVoToJson(InventoryRecordVo instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'warehouseId': ?instance.warehouseId,
      'commodityId': ?instance.commodityId,
      'name': ?instance.name,
      'count': ?instance.count,
      'type': ?_$InventoryRecordVoTypeEnumEnumMap[instance.type],
      'description': ?instance.description,
      'createAt': ?instance.createAt?.toIso8601String(),
    };

const _$InventoryRecordVoTypeEnumEnumMap = {
  InventoryRecordVoTypeEnum.IN: 'IN',
  InventoryRecordVoTypeEnum.OUT: 'OUT',
};
