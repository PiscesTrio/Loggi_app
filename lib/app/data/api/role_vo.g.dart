// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoleVoCWProxy {
  RoleVo value(String? value);

  RoleVo description(String? description);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RoleVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RoleVo(...).copyWith(id: 12, name: "My name")
  /// ```
  RoleVo call({String? value, String? description});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRoleVo.copyWith(...)` or call `instanceOfRoleVo.copyWith.fieldName(value)` for a single field.
class _$RoleVoCWProxyImpl implements _$RoleVoCWProxy {
  const _$RoleVoCWProxyImpl(this._value);

  final RoleVo _value;

  @override
  RoleVo value(String? value) => call(value: value);

  @override
  RoleVo description(String? description) => call(description: description);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RoleVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RoleVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RoleVo call({
    Object? value = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return RoleVo(
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $RoleVoCopyWith on RoleVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRoleVo.copyWith(...)` or `instanceOfRoleVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoleVoCWProxy get copyWith => _$RoleVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleVo _$RoleVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RoleVo', json, ($checkedConvert) {
      final val = RoleVo(
        value: $checkedConvert('value', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RoleVoToJson(RoleVo instance) => <String, dynamic>{
  'value': ?instance.value,
  'description': ?instance.description,
};
