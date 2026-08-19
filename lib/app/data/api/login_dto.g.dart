// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginDtoCWProxy {
  LoginDto email(String email);

  LoginDto password(String? password);

  LoginDto code(String? code);

  LoginDto remember(bool? remember);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginDto(...).copyWith(id: 12, name: "My name")
  /// ```
  LoginDto call({String email, String? password, String? code, bool? remember});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLoginDto.copyWith(...)` or call `instanceOfLoginDto.copyWith.fieldName(value)` for a single field.
class _$LoginDtoCWProxyImpl implements _$LoginDtoCWProxy {
  const _$LoginDtoCWProxyImpl(this._value);

  final LoginDto _value;

  @override
  LoginDto email(String email) => call(email: email);

  @override
  LoginDto password(String? password) => call(password: password);

  @override
  LoginDto code(String? code) => call(code: code);

  @override
  LoginDto remember(bool? remember) => call(remember: remember);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  LoginDto call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? remember = const $CopyWithPlaceholder(),
  }) {
    return LoginDto(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      remember: remember == const $CopyWithPlaceholder()
          ? _value.remember
          // ignore: cast_nullable_to_non_nullable
          : remember as bool?,
    );
  }
}

extension $LoginDtoCopyWith on LoginDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLoginDto.copyWith(...)` or `instanceOfLoginDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginDtoCWProxy get copyWith => _$LoginDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LoginDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email']);
      final val = LoginDto(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String?),
        remember: $checkedConvert('remember', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
  'email': instance.email,
  'password': ?instance.password,
  'code': ?instance.code,
  'remember': ?instance.remember,
};
