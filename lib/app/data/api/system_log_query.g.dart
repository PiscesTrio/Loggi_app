// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_log_query.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemLogQueryCWProxy {
  SystemLogQuery account(String? account);

  SystemLogQuery module(String? module);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SystemLogQuery(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SystemLogQuery(...).copyWith(id: 12, name: "My name")
  /// ```
  SystemLogQuery call({String? account, String? module});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSystemLogQuery.copyWith(...)` or call `instanceOfSystemLogQuery.copyWith.fieldName(value)` for a single field.
class _$SystemLogQueryCWProxyImpl implements _$SystemLogQueryCWProxy {
  const _$SystemLogQueryCWProxyImpl(this._value);

  final SystemLogQuery _value;

  @override
  SystemLogQuery account(String? account) => call(account: account);

  @override
  SystemLogQuery module(String? module) => call(module: module);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SystemLogQuery(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SystemLogQuery(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SystemLogQuery call({
    Object? account = const $CopyWithPlaceholder(),
    Object? module = const $CopyWithPlaceholder(),
  }) {
    return SystemLogQuery(
      account: account == const $CopyWithPlaceholder()
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as String?,
      module: module == const $CopyWithPlaceholder()
          ? _value.module
          // ignore: cast_nullable_to_non_nullable
          : module as String?,
    );
  }
}

extension $SystemLogQueryCopyWith on SystemLogQuery {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSystemLogQuery.copyWith(...)` or `instanceOfSystemLogQuery.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemLogQueryCWProxy get copyWith => _$SystemLogQueryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemLogQuery _$SystemLogQueryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SystemLogQuery', json, ($checkedConvert) {
      final val = SystemLogQuery(
        account: $checkedConvert('account', (v) => v as String?),
        module: $checkedConvert('module', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SystemLogQueryToJson(SystemLogQuery instance) =>
    <String, dynamic>{'account': ?instance.account, 'module': ?instance.module};
