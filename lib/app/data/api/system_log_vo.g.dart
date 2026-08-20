// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_log_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemLogVoCWProxy {
  SystemLogVo id(String? id);

  SystemLogVo account(String? account);

  SystemLogVo module(SystemLogVoModuleEnum? module);

  SystemLogVo businessType(SystemLogVoBusinessTypeEnum? businessType);

  SystemLogVo ip(String? ip);

  SystemLogVo method(String? method);

  SystemLogVo costMs(int? costMs);

  SystemLogVo success(bool? success);

  SystemLogVo time(DateTime? time);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SystemLogVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SystemLogVo(...).copyWith(id: 12, name: "My name")
  /// ```
  SystemLogVo call({
    String? id,
    String? account,
    SystemLogVoModuleEnum? module,
    SystemLogVoBusinessTypeEnum? businessType,
    String? ip,
    String? method,
    int? costMs,
    bool? success,
    DateTime? time,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSystemLogVo.copyWith(...)` or call `instanceOfSystemLogVo.copyWith.fieldName(value)` for a single field.
class _$SystemLogVoCWProxyImpl implements _$SystemLogVoCWProxy {
  const _$SystemLogVoCWProxyImpl(this._value);

  final SystemLogVo _value;

  @override
  SystemLogVo id(String? id) => call(id: id);

  @override
  SystemLogVo account(String? account) => call(account: account);

  @override
  SystemLogVo module(SystemLogVoModuleEnum? module) => call(module: module);

  @override
  SystemLogVo businessType(SystemLogVoBusinessTypeEnum? businessType) =>
      call(businessType: businessType);

  @override
  SystemLogVo ip(String? ip) => call(ip: ip);

  @override
  SystemLogVo method(String? method) => call(method: method);

  @override
  SystemLogVo costMs(int? costMs) => call(costMs: costMs);

  @override
  SystemLogVo success(bool? success) => call(success: success);

  @override
  SystemLogVo time(DateTime? time) => call(time: time);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SystemLogVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SystemLogVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SystemLogVo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? account = const $CopyWithPlaceholder(),
    Object? module = const $CopyWithPlaceholder(),
    Object? businessType = const $CopyWithPlaceholder(),
    Object? ip = const $CopyWithPlaceholder(),
    Object? method = const $CopyWithPlaceholder(),
    Object? costMs = const $CopyWithPlaceholder(),
    Object? success = const $CopyWithPlaceholder(),
    Object? time = const $CopyWithPlaceholder(),
  }) {
    return SystemLogVo(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      account: account == const $CopyWithPlaceholder()
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as String?,
      module: module == const $CopyWithPlaceholder()
          ? _value.module
          // ignore: cast_nullable_to_non_nullable
          : module as SystemLogVoModuleEnum?,
      businessType: businessType == const $CopyWithPlaceholder()
          ? _value.businessType
          // ignore: cast_nullable_to_non_nullable
          : businessType as SystemLogVoBusinessTypeEnum?,
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String?,
      costMs: costMs == const $CopyWithPlaceholder()
          ? _value.costMs
          // ignore: cast_nullable_to_non_nullable
          : costMs as int?,
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
      time: time == const $CopyWithPlaceholder()
          ? _value.time
          // ignore: cast_nullable_to_non_nullable
          : time as DateTime?,
    );
  }
}

extension $SystemLogVoCopyWith on SystemLogVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSystemLogVo.copyWith(...)` or `instanceOfSystemLogVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemLogVoCWProxy get copyWith => _$SystemLogVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemLogVo _$SystemLogVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SystemLogVo', json, ($checkedConvert) {
      final val = SystemLogVo(
        id: $checkedConvert('id', (v) => v as String?),
        account: $checkedConvert('account', (v) => v as String?),
        module: $checkedConvert(
          'module',
          (v) => $enumDecodeNullable(_$SystemLogVoModuleEnumEnumMap, v),
        ),
        businessType: $checkedConvert(
          'businessType',
          (v) => $enumDecodeNullable(_$SystemLogVoBusinessTypeEnumEnumMap, v),
        ),
        ip: $checkedConvert('ip', (v) => v as String?),
        method: $checkedConvert('method', (v) => v as String?),
        costMs: $checkedConvert('costMs', (v) => (v as num?)?.toInt()),
        success: $checkedConvert('success', (v) => v as bool?),
        time: $checkedConvert(
          'time',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SystemLogVoToJson(
  SystemLogVo instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'account': ?instance.account,
  'module': ?_$SystemLogVoModuleEnumEnumMap[instance.module],
  'businessType': ?_$SystemLogVoBusinessTypeEnumEnumMap[instance.businessType],
  'ip': ?instance.ip,
  'method': ?instance.method,
  'costMs': ?instance.costMs,
  'success': ?instance.success,
  'time': ?instance.time?.toIso8601String(),
};

const _$SystemLogVoModuleEnumEnumMap = {
  SystemLogVoModuleEnum.COMMODITY: 'COMMODITY',
  SystemLogVoModuleEnum.WAREHOUSE: 'WAREHOUSE',
  SystemLogVoModuleEnum.EMPLOYEE: 'EMPLOYEE',
  SystemLogVoModuleEnum.DRIVER: 'DRIVER',
  SystemLogVoModuleEnum.VEHICLE: 'VEHICLE',
  SystemLogVoModuleEnum.DISTRIBUTION: 'DISTRIBUTION',
  SystemLogVoModuleEnum.DISTRIBUTION_TRACK: 'DISTRIBUTION_TRACK',
};

const _$SystemLogVoBusinessTypeEnumEnumMap = {
  SystemLogVoBusinessTypeEnum.OTHER: 'OTHER',
  SystemLogVoBusinessTypeEnum.QUERY: 'QUERY',
  SystemLogVoBusinessTypeEnum.INSERT: 'INSERT',
  SystemLogVoBusinessTypeEnum.UPDATE: 'UPDATE',
  SystemLogVoBusinessTypeEnum.DELETE: 'DELETE',
  SystemLogVoBusinessTypeEnum.EXPORT: 'EXPORT',
  SystemLogVoBusinessTypeEnum.FORCE: 'FORCE',
};
