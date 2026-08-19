// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SaleRequestCWProxy {
  SaleRequest company(String company);

  SaleRequest number(String? number);

  SaleRequest commodity(String commodity);

  SaleRequest count(int count);

  SaleRequest price(num price);

  SaleRequest phone(String? phone);

  SaleRequest description(String? description);

  SaleRequest pay(bool? pay);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SaleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SaleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  SaleRequest call({
    String company,
    String? number,
    String commodity,
    int count,
    num price,
    String? phone,
    String? description,
    bool? pay,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSaleRequest.copyWith(...)` or call `instanceOfSaleRequest.copyWith.fieldName(value)` for a single field.
class _$SaleRequestCWProxyImpl implements _$SaleRequestCWProxy {
  const _$SaleRequestCWProxyImpl(this._value);

  final SaleRequest _value;

  @override
  SaleRequest company(String company) => call(company: company);

  @override
  SaleRequest number(String? number) => call(number: number);

  @override
  SaleRequest commodity(String commodity) => call(commodity: commodity);

  @override
  SaleRequest count(int count) => call(count: count);

  @override
  SaleRequest price(num price) => call(price: price);

  @override
  SaleRequest phone(String? phone) => call(phone: phone);

  @override
  SaleRequest description(String? description) =>
      call(description: description);

  @override
  SaleRequest pay(bool? pay) => call(pay: pay);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SaleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SaleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SaleRequest call({
    Object? company = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? commodity = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? pay = const $CopyWithPlaceholder(),
  }) {
    return SaleRequest(
      company: company == const $CopyWithPlaceholder() || company == null
          ? _value.company
          // ignore: cast_nullable_to_non_nullable
          : company as String,
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as String?,
      commodity: commodity == const $CopyWithPlaceholder() || commodity == null
          ? _value.commodity
          // ignore: cast_nullable_to_non_nullable
          : commodity as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as num,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      pay: pay == const $CopyWithPlaceholder()
          ? _value.pay
          // ignore: cast_nullable_to_non_nullable
          : pay as bool?,
    );
  }
}

extension $SaleRequestCopyWith on SaleRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSaleRequest.copyWith(...)` or `instanceOfSaleRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SaleRequestCWProxy get copyWith => _$SaleRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleRequest _$SaleRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SaleRequest', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['company', 'commodity', 'count', 'price'],
      );
      final val = SaleRequest(
        company: $checkedConvert('company', (v) => v as String),
        number: $checkedConvert('number', (v) => v as String?),
        commodity: $checkedConvert('commodity', (v) => v as String),
        count: $checkedConvert('count', (v) => (v as num).toInt()),
        price: $checkedConvert('price', (v) => v as num),
        phone: $checkedConvert('phone', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
        pay: $checkedConvert('pay', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$SaleRequestToJson(SaleRequest instance) =>
    <String, dynamic>{
      'company': instance.company,
      'number': ?instance.number,
      'commodity': instance.commodity,
      'count': instance.count,
      'price': instance.price,
      'phone': ?instance.phone,
      'description': ?instance.description,
      'pay': ?instance.pay,
    };
