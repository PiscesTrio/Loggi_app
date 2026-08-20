// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EmployeeRequestCWProxy {
  EmployeeRequest name(String name);

  EmployeeRequest gender(EmployeeRequestGenderEnum? gender);

  EmployeeRequest phone(String phone);

  EmployeeRequest address(String? address);

  EmployeeRequest idCard(String? idCard);

  EmployeeRequest department(String? department);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `EmployeeRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// EmployeeRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  EmployeeRequest call({
    String name,
    EmployeeRequestGenderEnum? gender,
    String phone,
    String? address,
    String? idCard,
    String? department,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfEmployeeRequest.copyWith(...)` or call `instanceOfEmployeeRequest.copyWith.fieldName(value)` for a single field.
class _$EmployeeRequestCWProxyImpl implements _$EmployeeRequestCWProxy {
  const _$EmployeeRequestCWProxyImpl(this._value);

  final EmployeeRequest _value;

  @override
  EmployeeRequest name(String name) => call(name: name);

  @override
  EmployeeRequest gender(EmployeeRequestGenderEnum? gender) =>
      call(gender: gender);

  @override
  EmployeeRequest phone(String phone) => call(phone: phone);

  @override
  EmployeeRequest address(String? address) => call(address: address);

  @override
  EmployeeRequest idCard(String? idCard) => call(idCard: idCard);

  @override
  EmployeeRequest department(String? department) =>
      call(department: department);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `EmployeeRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// EmployeeRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  EmployeeRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? idCard = const $CopyWithPlaceholder(),
    Object? department = const $CopyWithPlaceholder(),
  }) {
    return EmployeeRequest(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as EmployeeRequestGenderEnum?,
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
      department: department == const $CopyWithPlaceholder()
          ? _value.department
          // ignore: cast_nullable_to_non_nullable
          : department as String?,
    );
  }
}

extension $EmployeeRequestCopyWith on EmployeeRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfEmployeeRequest.copyWith(...)` or `instanceOfEmployeeRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EmployeeRequestCWProxy get copyWith => _$EmployeeRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeRequest _$EmployeeRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('EmployeeRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name', 'phone']);
      final val = EmployeeRequest(
        name: $checkedConvert('name', (v) => v as String),
        gender: $checkedConvert(
          'gender',
          (v) => $enumDecodeNullable(_$EmployeeRequestGenderEnumEnumMap, v),
        ),
        phone: $checkedConvert('phone', (v) => v as String),
        address: $checkedConvert('address', (v) => v as String?),
        idCard: $checkedConvert('idCard', (v) => v as String?),
        department: $checkedConvert('department', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$EmployeeRequestToJson(EmployeeRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': ?_$EmployeeRequestGenderEnumEnumMap[instance.gender],
      'phone': instance.phone,
      'address': ?instance.address,
      'idCard': ?instance.idCard,
      'department': ?instance.department,
    };

const _$EmployeeRequestGenderEnumEnumMap = {
  EmployeeRequestGenderEnum.MALE: 'MALE',
  EmployeeRequestGenderEnum.FEMALE: 'FEMALE',
};
