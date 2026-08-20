// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DriverRequestCWProxy {
  DriverRequest name(String name);

  DriverRequest gender(DriverRequestGenderEnum? gender);

  DriverRequest phone(String phone);

  DriverRequest address(String? address);

  DriverRequest idCard(String? idCard);

  DriverRequest license(String? license);

  DriverRequest score(String? score);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DriverRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DriverRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  DriverRequest call({
    String name,
    DriverRequestGenderEnum? gender,
    String phone,
    String? address,
    String? idCard,
    String? license,
    String? score,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDriverRequest.copyWith(...)` or call `instanceOfDriverRequest.copyWith.fieldName(value)` for a single field.
class _$DriverRequestCWProxyImpl implements _$DriverRequestCWProxy {
  const _$DriverRequestCWProxyImpl(this._value);

  final DriverRequest _value;

  @override
  DriverRequest name(String name) => call(name: name);

  @override
  DriverRequest gender(DriverRequestGenderEnum? gender) => call(gender: gender);

  @override
  DriverRequest phone(String phone) => call(phone: phone);

  @override
  DriverRequest address(String? address) => call(address: address);

  @override
  DriverRequest idCard(String? idCard) => call(idCard: idCard);

  @override
  DriverRequest license(String? license) => call(license: license);

  @override
  DriverRequest score(String? score) => call(score: score);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DriverRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DriverRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DriverRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? idCard = const $CopyWithPlaceholder(),
    Object? license = const $CopyWithPlaceholder(),
    Object? score = const $CopyWithPlaceholder(),
  }) {
    return DriverRequest(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as DriverRequestGenderEnum?,
      phone: phone == const $CopyWithPlaceholder() || phone == null
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      idCard: idCard == const $CopyWithPlaceholder()
          ? _value.idCard
          // ignore: cast_nullable_to_non_nullable
          : idCard as String?,
      license: license == const $CopyWithPlaceholder()
          ? _value.license
          // ignore: cast_nullable_to_non_nullable
          : license as String?,
      score: score == const $CopyWithPlaceholder()
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as String?,
    );
  }
}

extension $DriverRequestCopyWith on DriverRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDriverRequest.copyWith(...)` or `instanceOfDriverRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DriverRequestCWProxy get copyWith => _$DriverRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverRequest _$DriverRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DriverRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name', 'phone']);
      final val = DriverRequest(
        name: $checkedConvert('name', (v) => v as String),
        gender: $checkedConvert(
          'gender',
          (v) => $enumDecodeNullable(_$DriverRequestGenderEnumEnumMap, v),
        ),
        phone: $checkedConvert('phone', (v) => v as String),
        address: $checkedConvert('address', (v) => v as String?),
        idCard: $checkedConvert('idCard', (v) => v as String?),
        license: $checkedConvert('license', (v) => v as String?),
        score: $checkedConvert('score', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DriverRequestToJson(DriverRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': ?_$DriverRequestGenderEnumEnumMap[instance.gender],
      'phone': instance.phone,
      'address': ?instance.address,
      'idCard': ?instance.idCard,
      'license': ?instance.license,
      'score': ?instance.score,
    };

const _$DriverRequestGenderEnumEnumMap = {
  DriverRequestGenderEnum.MALE: 'MALE',
  DriverRequestGenderEnum.FEMALE: 'FEMALE',
};
