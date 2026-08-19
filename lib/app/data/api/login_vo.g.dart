// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginVoCWProxy {
  LoginVo admin(AdminVo? admin);

  LoginVo token(String? token);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginVo(...).copyWith(id: 12, name: "My name")
  /// ```
  LoginVo call({AdminVo? admin, String? token});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLoginVo.copyWith(...)` or call `instanceOfLoginVo.copyWith.fieldName(value)` for a single field.
class _$LoginVoCWProxyImpl implements _$LoginVoCWProxy {
  const _$LoginVoCWProxyImpl(this._value);

  final LoginVo _value;

  @override
  LoginVo admin(AdminVo? admin) => call(admin: admin);

  @override
  LoginVo token(String? token) => call(token: token);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  LoginVo call({
    Object? admin = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return LoginVo(
      admin: admin == const $CopyWithPlaceholder()
          ? _value.admin
          // ignore: cast_nullable_to_non_nullable
          : admin as AdminVo?,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
    );
  }
}

extension $LoginVoCopyWith on LoginVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLoginVo.copyWith(...)` or `instanceOfLoginVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginVoCWProxy get copyWith => _$LoginVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginVo _$LoginVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LoginVo', json, ($checkedConvert) {
      final val = LoginVo(
        admin: $checkedConvert(
          'admin',
          (v) => v == null ? null : AdminVo.fromJson(v as Map<String, dynamic>),
        ),
        token: $checkedConvert('token', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LoginVoToJson(LoginVo instance) => <String, dynamic>{
  'admin': ?instance.admin?.toJson(),
  'token': ?instance.token,
};
