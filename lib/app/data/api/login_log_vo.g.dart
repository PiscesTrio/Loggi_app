// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_log_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginLogVoCWProxy {
  LoginLogVo id(String? id);

  LoginLogVo email(String? email);

  LoginLogVo status(int? status);

  LoginLogVo ip(String? ip);

  LoginLogVo browser(LoginLogVoBrowserEnum? browser);

  LoginLogVo date(DateTime? date);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginLogVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginLogVo(...).copyWith(id: 12, name: "My name")
  /// ```
  LoginLogVo call({
    String? id,
    String? email,
    int? status,
    String? ip,
    LoginLogVoBrowserEnum? browser,
    DateTime? date,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLoginLogVo.copyWith(...)` or call `instanceOfLoginLogVo.copyWith.fieldName(value)` for a single field.
class _$LoginLogVoCWProxyImpl implements _$LoginLogVoCWProxy {
  const _$LoginLogVoCWProxyImpl(this._value);

  final LoginLogVo _value;

  @override
  LoginLogVo id(String? id) => call(id: id);

  @override
  LoginLogVo email(String? email) => call(email: email);

  @override
  LoginLogVo status(int? status) => call(status: status);

  @override
  LoginLogVo ip(String? ip) => call(ip: ip);

  @override
  LoginLogVo browser(LoginLogVoBrowserEnum? browser) => call(browser: browser);

  @override
  LoginLogVo date(DateTime? date) => call(date: date);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginLogVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginLogVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  LoginLogVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? ip = const $CopyWithPlaceholder(),
    Object? browser = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
  }) {
    return LoginLogVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      browser: browser == const $CopyWithPlaceholder()
          ? _value.browser
          // ignore: cast_nullable_to_non_nullable
          : browser as LoginLogVoBrowserEnum?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime?,
    );
  }
}

extension $LoginLogVoCopyWith on LoginLogVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLoginLogVo.copyWith(...)` or `instanceOfLoginLogVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginLogVoCWProxy get copyWith => _$LoginLogVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginLogVo _$LoginLogVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LoginLogVo', json, ($checkedConvert) {
      final val = LoginLogVo(
        id: $checkedConvert('id', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        ip: $checkedConvert('ip', (v) => v as String?),
        browser: $checkedConvert(
          'browser',
          (v) => $enumDecodeNullable(_$LoginLogVoBrowserEnumEnumMap, v),
        ),
        date: $checkedConvert(
          'date',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LoginLogVoToJson(LoginLogVo instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'email': ?instance.email,
      'status': ?instance.status,
      'ip': ?instance.ip,
      'browser': ?_$LoginLogVoBrowserEnumEnumMap[instance.browser],
      'date': ?instance.date?.toIso8601String(),
    };

const _$LoginLogVoBrowserEnumEnumMap = {
  LoginLogVoBrowserEnum.CHROME: 'CHROME',
  LoginLogVoBrowserEnum.SAFARI: 'SAFARI',
  LoginLogVoBrowserEnum.FIREFOX: 'FIREFOX',
  LoginLogVoBrowserEnum.EDGE: 'EDGE',
  LoginLogVoBrowserEnum.IE: 'IE',
  LoginLogVoBrowserEnum.OPERA: 'OPERA',
  LoginLogVoBrowserEnum.QQ: 'QQ',
  LoginLogVoBrowserEnum.UC: 'UC',
  LoginLogVoBrowserEnum.SOGOU: 'SOGOU',
  LoginLogVoBrowserEnum.BAIDU: 'BAIDU',
  LoginLogVoBrowserEnum.QIHOO_360: 'QIHOO_360',
  LoginLogVoBrowserEnum.LIEBAO: 'LIEBAO',
  LoginLogVoBrowserEnum.MAXTHON: 'MAXTHON',
  LoginLogVoBrowserEnum.THE_WORLD: 'THE_WORLD',
  LoginLogVoBrowserEnum.QUARK: 'QUARK',
  LoginLogVoBrowserEnum.KONQUEROR: 'KONQUEROR',
  LoginLogVoBrowserEnum.CAMINO: 'CAMINO',
  LoginLogVoBrowserEnum.AVAST: 'AVAST',
  LoginLogVoBrowserEnum.UNKNOWN: 'UNKNOWN',
};
