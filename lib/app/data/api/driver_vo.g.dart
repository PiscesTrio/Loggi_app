// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DriverVoCWProxy {
  DriverVo id(String? id);

  DriverVo name(String? name);

  DriverVo gender(String? gender);

  DriverVo phone(String? phone);

  DriverVo address(String? address);

  DriverVo license(String? license);

  DriverVo score(String? score);

  DriverVo driving(bool? driving);

  DriverVo createAt(DateTime? createAt);

  DriverVo updateAt(DateTime? updateAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DriverVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DriverVo(...).copyWith(id: 12, name: "My name")
  /// ```
  DriverVo call({
    String? id,
    String? name,
    String? gender,
    String? phone,
    String? address,
    String? license,
    String? score,
    bool? driving,
    DateTime? createAt,
    DateTime? updateAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDriverVo.copyWith(...)` or call `instanceOfDriverVo.copyWith.fieldName(value)` for a single field.
class _$DriverVoCWProxyImpl implements _$DriverVoCWProxy {
  const _$DriverVoCWProxyImpl(this._value);

  final DriverVo _value;

  @override
  DriverVo id(String? id) => call(id: id);

  @override
  DriverVo name(String? name) => call(name: name);

  @override
  DriverVo gender(String? gender) => call(gender: gender);

  @override
  DriverVo phone(String? phone) => call(phone: phone);

  @override
  DriverVo address(String? address) => call(address: address);

  @override
  DriverVo license(String? license) => call(license: license);

  @override
  DriverVo score(String? score) => call(score: score);

  @override
  DriverVo driving(bool? driving) => call(driving: driving);

  @override
  DriverVo createAt(DateTime? createAt) => call(createAt: createAt);

  @override
  DriverVo updateAt(DateTime? updateAt) => call(updateAt: updateAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DriverVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DriverVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DriverVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? license = const $CopyWithPlaceholder(),
    Object? score = const $CopyWithPlaceholder(),
    Object? driving = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
    Object? updateAt = const $CopyWithPlaceholder(),
  }) {
    return DriverVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      license: license == const $CopyWithPlaceholder()
          ? _value.license
          // ignore: cast_nullable_to_non_nullable
          : license as String?,
      score: score == const $CopyWithPlaceholder()
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as String?,
      driving: driving == const $CopyWithPlaceholder()
          ? _value.driving
          // ignore: cast_nullable_to_non_nullable
          : driving as bool?,
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

extension $DriverVoCopyWith on DriverVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDriverVo.copyWith(...)` or `instanceOfDriverVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DriverVoCWProxy get copyWith => _$DriverVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverVo _$DriverVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DriverVo', json, ($checkedConvert) {
      final val = DriverVo(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        gender: $checkedConvert('gender', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
        address: $checkedConvert('address', (v) => v as String?),
        license: $checkedConvert('license', (v) => v as String?),
        score: $checkedConvert('score', (v) => v as String?),
        driving: $checkedConvert('driving', (v) => v as bool?),
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

Map<String, dynamic> _$DriverVoToJson(DriverVo instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'gender': ?instance.gender,
  'phone': ?instance.phone,
  'address': ?instance.address,
  'license': ?instance.license,
  'score': ?instance.score,
  'driving': ?instance.driving,
  'createAt': ?instance.createAt?.toIso8601String(),
  'updateAt': ?instance.updateAt?.toIso8601String(),
};
