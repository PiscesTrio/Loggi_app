// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminRequestCWProxy {
  AdminRequest email(String email);

  AdminRequest password(String password);

  AdminRequest roles(Set<AdminRequestRolesEnum>? roles);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AdminRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminRequest call({
    String email,
    String password,
    Set<AdminRequestRolesEnum>? roles,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminRequest.copyWith(...)` or call `instanceOfAdminRequest.copyWith.fieldName(value)` for a single field.
class _$AdminRequestCWProxyImpl implements _$AdminRequestCWProxy {
  const _$AdminRequestCWProxyImpl(this._value);

  final AdminRequest _value;

  @override
  AdminRequest email(String email) => call(email: email);

  @override
  AdminRequest password(String password) => call(password: password);

  @override
  AdminRequest roles(Set<AdminRequestRolesEnum>? roles) => call(roles: roles);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AdminRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? roles = const $CopyWithPlaceholder(),
  }) {
    return AdminRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      roles: roles == const $CopyWithPlaceholder()
          ? _value.roles
          // ignore: cast_nullable_to_non_nullable
          : roles as Set<AdminRequestRolesEnum>?,
    );
  }
}

extension $AdminRequestCopyWith on AdminRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminRequest.copyWith(...)` or `instanceOfAdminRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminRequestCWProxy get copyWith => _$AdminRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminRequest _$AdminRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email', 'password']);
      final val = AdminRequest(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        roles: $checkedConvert(
          'roles',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AdminRequestRolesEnumEnumMap, e))
              .toSet(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminRequestToJson(AdminRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'roles': ?instance.roles
          ?.map((e) => _$AdminRequestRolesEnumEnumMap[e]!)
          .toList(),
    };

const _$AdminRequestRolesEnumEnumMap = {
  AdminRequestRolesEnum.ROLE_SUPER_ADMIN: 'ROLE_SUPER_ADMIN',
  AdminRequestRolesEnum.ROLE_ADMIN: 'ROLE_ADMIN',
  AdminRequestRolesEnum.ROLE_COMMODITY: 'ROLE_COMMODITY',
  AdminRequestRolesEnum.ROLE_EMPLOYEE: 'ROLE_EMPLOYEE',
  AdminRequestRolesEnum.ROLE_SALE: 'ROLE_SALE',
  AdminRequestRolesEnum.ROLE_WAREHOUSE: 'ROLE_WAREHOUSE',
};
