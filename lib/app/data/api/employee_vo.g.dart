// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EmployeeVoCWProxy {
  EmployeeVo id(String? id);

  EmployeeVo name(String? name);

  EmployeeVo gender(String? gender);

  EmployeeVo phone(String? phone);

  EmployeeVo address(String? address);

  EmployeeVo department(String? department);

  EmployeeVo createAt(DateTime? createAt);

  EmployeeVo updateAt(DateTime? updateAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `EmployeeVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// EmployeeVo(...).copyWith(id: 12, name: "My name")
  /// ```
  EmployeeVo call({
    String? id,
    String? name,
    String? gender,
    String? phone,
    String? address,
    String? department,
    DateTime? createAt,
    DateTime? updateAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfEmployeeVo.copyWith(...)` or call `instanceOfEmployeeVo.copyWith.fieldName(value)` for a single field.
class _$EmployeeVoCWProxyImpl implements _$EmployeeVoCWProxy {
  const _$EmployeeVoCWProxyImpl(this._value);

  final EmployeeVo _value;

  @override
  EmployeeVo id(String? id) => call(id: id);

  @override
  EmployeeVo name(String? name) => call(name: name);

  @override
  EmployeeVo gender(String? gender) => call(gender: gender);

  @override
  EmployeeVo phone(String? phone) => call(phone: phone);

  @override
  EmployeeVo address(String? address) => call(address: address);

  @override
  EmployeeVo department(String? department) => call(department: department);

  @override
  EmployeeVo createAt(DateTime? createAt) => call(createAt: createAt);

  @override
  EmployeeVo updateAt(DateTime? updateAt) => call(updateAt: updateAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `EmployeeVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// EmployeeVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  EmployeeVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? department = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
    Object? updateAt = const $CopyWithPlaceholder(),
  }) {
    return EmployeeVo(
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
      department: department == const $CopyWithPlaceholder()
          ? _value.department
          // ignore: cast_nullable_to_non_nullable
          : department as String?,
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

extension $EmployeeVoCopyWith on EmployeeVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfEmployeeVo.copyWith(...)` or `instanceOfEmployeeVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EmployeeVoCWProxy get copyWith => _$EmployeeVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeVo _$EmployeeVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('EmployeeVo', json, ($checkedConvert) {
      final val = EmployeeVo(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        gender: $checkedConvert('gender', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
        address: $checkedConvert('address', (v) => v as String?),
        department: $checkedConvert('department', (v) => v as String?),
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

Map<String, dynamic> _$EmployeeVoToJson(EmployeeVo instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'gender': ?instance.gender,
      'phone': ?instance.phone,
      'address': ?instance.address,
      'department': ?instance.department,
      'createAt': ?instance.createAt?.toIso8601String(),
      'updateAt': ?instance.updateAt?.toIso8601String(),
    };
