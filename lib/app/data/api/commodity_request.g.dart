// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommodityRequestCWProxy {
  CommodityRequest name(String name);

  CommodityRequest price(num price);

  CommodityRequest description(String? description);

  CommodityRequest count(int? count);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CommodityRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CommodityRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CommodityRequest call({
    String name,
    num price,
    String? description,
    int? count,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCommodityRequest.copyWith(...)` or call `instanceOfCommodityRequest.copyWith.fieldName(value)` for a single field.
class _$CommodityRequestCWProxyImpl implements _$CommodityRequestCWProxy {
  const _$CommodityRequestCWProxyImpl(this._value);

  final CommodityRequest _value;

  @override
  CommodityRequest name(String name) => call(name: name);

  @override
  CommodityRequest price(num price) => call(price: price);

  @override
  CommodityRequest description(String? description) =>
      call(description: description);

  @override
  CommodityRequest count(int? count) => call(count: count);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CommodityRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CommodityRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CommodityRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return CommodityRequest(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as num,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
    );
  }
}

extension $CommodityRequestCopyWith on CommodityRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCommodityRequest.copyWith(...)` or `instanceOfCommodityRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommodityRequestCWProxy get copyWith => _$CommodityRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityRequest _$CommodityRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CommodityRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name', 'price']);
      final val = CommodityRequest(
        name: $checkedConvert('name', (v) => v as String),
        price: $checkedConvert('price', (v) => v as num),
        description: $checkedConvert('description', (v) => v as String?),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$CommodityRequestToJson(CommodityRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'description': ?instance.description,
      'count': ?instance.count,
    };
