// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommodityVoCWProxy {
  CommodityVo id(String? id);

  CommodityVo name(String? name);

  CommodityVo price(num? price);

  CommodityVo description(String? description);

  CommodityVo count(int? count);

  CommodityVo createAt(DateTime? createAt);

  CommodityVo updateAt(DateTime? updateAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CommodityVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CommodityVo(...).copyWith(id: 12, name: "My name")
  /// ```
  CommodityVo call({
    String? id,
    String? name,
    num? price,
    String? description,
    int? count,
    DateTime? createAt,
    DateTime? updateAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCommodityVo.copyWith(...)` or call `instanceOfCommodityVo.copyWith.fieldName(value)` for a single field.
class _$CommodityVoCWProxyImpl implements _$CommodityVoCWProxy {
  const _$CommodityVoCWProxyImpl(this._value);

  final CommodityVo _value;

  @override
  CommodityVo id(String? id) => call(id: id);

  @override
  CommodityVo name(String? name) => call(name: name);

  @override
  CommodityVo price(num? price) => call(price: price);

  @override
  CommodityVo description(String? description) =>
      call(description: description);

  @override
  CommodityVo count(int? count) => call(count: count);

  @override
  CommodityVo createAt(DateTime? createAt) => call(createAt: createAt);

  @override
  CommodityVo updateAt(DateTime? updateAt) => call(updateAt: updateAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CommodityVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CommodityVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CommodityVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
    Object? updateAt = const $CopyWithPlaceholder(),
  }) {
    return CommodityVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as num?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      createAt: createAt == const $CopyWithPlaceholder()
          ? _value.createAt
          // ignore: cast_nullable_to_non_nullable
          : createAt as DateTime?,
      updateAt: updateAt == const $CopyWithPlaceholder()
          ? _value.updateAt
          // ignore: cast_nullable_to_non_nullable
          : updateAt as DateTime?,
    );
  }
}

extension $CommodityVoCopyWith on CommodityVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCommodityVo.copyWith(...)` or `instanceOfCommodityVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommodityVoCWProxy get copyWith => _$CommodityVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityVo _$CommodityVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CommodityVo', json, ($checkedConvert) {
      final val = CommodityVo(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        price: $checkedConvert('price', (v) => v as num?),
        description: $checkedConvert('description', (v) => v as String?),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        createAt: $checkedConvert(
          'createAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        updateAt: $checkedConvert(
          'updateAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CommodityVoToJson(CommodityVo instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'price': ?instance.price,
      'description': ?instance.description,
      'count': ?instance.count,
      'createAt': ?instance.createAt?.toIso8601String(),
      'updateAt': ?instance.updateAt?.toIso8601String(),
    };
