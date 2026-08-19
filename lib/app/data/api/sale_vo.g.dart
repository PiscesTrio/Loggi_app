// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SaleVoCWProxy {
  SaleVo id(String? id);

  SaleVo company(String? company);

  SaleVo number(String? number);

  SaleVo commodity(String? commodity);

  SaleVo count(int? count);

  SaleVo price(num? price);

  SaleVo phone(String? phone);

  SaleVo description(String? description);

  SaleVo pay(bool? pay);

  SaleVo createAt(DateTime? createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SaleVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SaleVo(...).copyWith(id: 12, name: "My name")
  /// ```
  SaleVo call({
    String? id,
    String? company,
    String? number,
    String? commodity,
    int? count,
    num? price,
    String? phone,
    String? description,
    bool? pay,
    DateTime? createAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSaleVo.copyWith(...)` or call `instanceOfSaleVo.copyWith.fieldName(value)` for a single field.
class _$SaleVoCWProxyImpl implements _$SaleVoCWProxy {
  const _$SaleVoCWProxyImpl(this._value);

  final SaleVo _value;

  @override
  SaleVo id(String? id) => call(id: id);

  @override
  SaleVo company(String? company) => call(company: company);

  @override
  SaleVo number(String? number) => call(number: number);

  @override
  SaleVo commodity(String? commodity) => call(commodity: commodity);

  @override
  SaleVo count(int? count) => call(count: count);

  @override
  SaleVo price(num? price) => call(price: price);

  @override
  SaleVo phone(String? phone) => call(phone: phone);

  @override
  SaleVo description(String? description) => call(description: description);

  @override
  SaleVo pay(bool? pay) => call(pay: pay);

  @override
  SaleVo createAt(DateTime? createAt) => call(createAt: createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SaleVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SaleVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SaleVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? company = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? commodity = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? pay = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
  }) {
    return SaleVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      company: company == const $CopyWithPlaceholder()
          ? _value.company
          // ignore: cast_nullable_to_non_nullable
          : company as String?,
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as String?,
      commodity: commodity == const $CopyWithPlaceholder()
          ? _value.commodity
          // ignore: cast_nullable_to_non_nullable
          : commodity as String?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as num?,
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
      createAt: createAt == const $CopyWithPlaceholder()
          ? _value.createAt
          // ignore: cast_nullable_to_non_nullable
          : createAt as DateTime?,
    );
  }
}

extension $SaleVoCopyWith on SaleVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSaleVo.copyWith(...)` or `instanceOfSaleVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SaleVoCWProxy get copyWith => _$SaleVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleVo _$SaleVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SaleVo', json, ($checkedConvert) {
      final val = SaleVo(
        id: $checkedConvert('id', (v) => v as String?),
        company: $checkedConvert('company', (v) => v as String?),
        number: $checkedConvert('number', (v) => v as String?),
        commodity: $checkedConvert('commodity', (v) => v as String?),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        price: $checkedConvert('price', (v) => v as num?),
        phone: $checkedConvert('phone', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
        pay: $checkedConvert('pay', (v) => v as bool?),
        createAt: $checkedConvert(
          'createAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SaleVoToJson(SaleVo instance) => <String, dynamic>{
  'id': ?instance.id,
  'company': ?instance.company,
  'number': ?instance.number,
  'commodity': ?instance.commodity,
  'count': ?instance.count,
  'price': ?instance.price,
  'phone': ?instance.phone,
  'description': ?instance.description,
  'pay': ?instance.pay,
  'createAt': ?instance.createAt?.toIso8601String(),
};
