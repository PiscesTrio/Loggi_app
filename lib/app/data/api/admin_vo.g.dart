// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminVoCWProxy {
  AdminVo id(String? id);

  AdminVo email(String? email);

  AdminVo roles(List<String>? roles);

  AdminVo createAt(DateTime? createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AdminVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminVo(...).copyWith(id: 12, name: "My name")
  /// ```
  AdminVo call({
    String? id,
    String? email,
    List<String>? roles,
    DateTime? createAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAdminVo.copyWith(...)` or call `instanceOfAdminVo.copyWith.fieldName(value)` for a single field.
class _$AdminVoCWProxyImpl implements _$AdminVoCWProxy {
  const _$AdminVoCWProxyImpl(this._value);

  final AdminVo _value;

  @override
  AdminVo id(String? id) => call(id: id);

  @override
  AdminVo email(String? email) => call(email: email);

  @override
  AdminVo roles(List<String>? roles) => call(roles: roles);

  @override
  AdminVo createAt(DateTime? createAt) => call(createAt: createAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AdminVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AdminVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AdminVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? roles = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
  }) {
    return AdminVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      roles: roles == const $CopyWithPlaceholder()
          ? _value.roles
          // ignore: cast_nullable_to_non_nullable
          : roles as List<String>?,
      createAt: createAt == const $CopyWithPlaceholder()
          ? _value.createAt
          // ignore: cast_nullable_to_non_nullable
          : createAt as DateTime?,
    );
  }
}

extension $AdminVoCopyWith on AdminVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAdminVo.copyWith(...)` or `instanceOfAdminVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminVoCWProxy get copyWith => _$AdminVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminVo _$AdminVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminVo', json, ($checkedConvert) {
      final val = AdminVo(
        id: $checkedConvert('id', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
        roles: $checkedConvert(
          'roles',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        createAt: $checkedConvert(
          'createAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminVoToJson(AdminVo instance) => <String, dynamic>{
  'id': ?instance.id,
  'email': ?instance.email,
  'roles': ?instance.roles,
  'createAt': ?instance.createAt?.toIso8601String(),
};
