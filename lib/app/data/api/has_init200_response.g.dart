// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'has_init200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HasInit200ResponseCWProxy {
  HasInit200Response msg(String? msg);

  HasInit200Response status(bool? status);

  HasInit200Response data(bool? data);

  HasInit200Response code(int? code);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HasInit200Response(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HasInit200Response(...).copyWith(id: 12, name: "My name")
  /// ```
  HasInit200Response call({String? msg, bool? status, bool? data, int? code});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfHasInit200Response.copyWith(...)` or call `instanceOfHasInit200Response.copyWith.fieldName(value)` for a single field.
class _$HasInit200ResponseCWProxyImpl implements _$HasInit200ResponseCWProxy {
  const _$HasInit200ResponseCWProxyImpl(this._value);

  final HasInit200Response _value;

  @override
  HasInit200Response msg(String? msg) => call(msg: msg);

  @override
  HasInit200Response status(bool? status) => call(status: status);

  @override
  HasInit200Response data(bool? data) => call(data: data);

  @override
  HasInit200Response code(int? code) => call(code: code);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HasInit200Response(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HasInit200Response(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  HasInit200Response call({
    Object? msg = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
  }) {
    return HasInit200Response(
      msg: msg == const $CopyWithPlaceholder()
          ? _value.msg
          // ignore: cast_nullable_to_non_nullable
          : msg as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as bool?,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as bool?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as int?,
    );
  }
}

extension $HasInit200ResponseCopyWith on HasInit200Response {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfHasInit200Response.copyWith(...)` or `instanceOfHasInit200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HasInit200ResponseCWProxy get copyWith =>
      _$HasInit200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HasInit200Response _$HasInit200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HasInit200Response', json, ($checkedConvert) {
      final val = HasInit200Response(
        msg: $checkedConvert('msg', (v) => v as String?),
        status: $checkedConvert('status', (v) => v as bool?),
        data: $checkedConvert('data', (v) => v as bool?),
        code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$HasInit200ResponseToJson(HasInit200Response instance) =>
    <String, dynamic>{
      'msg': ?instance.msg,
      'status': ?instance.status,
      'data': ?instance.data,
      'code': ?instance.code,
    };
