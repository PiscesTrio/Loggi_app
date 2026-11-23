// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_status_change.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DistributionStatusChangeCWProxy {
  DistributionStatusChange status(DistributionStatusChangeStatusEnum status);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DistributionStatusChange(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DistributionStatusChange(...).copyWith(id: 12, name: "My name")
  /// ```
  DistributionStatusChange call({DistributionStatusChangeStatusEnum status});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDistributionStatusChange.copyWith(...)` or call `instanceOfDistributionStatusChange.copyWith.fieldName(value)` for a single field.
class _$DistributionStatusChangeCWProxyImpl
    implements _$DistributionStatusChangeCWProxy {
  const _$DistributionStatusChangeCWProxyImpl(this._value);

  final DistributionStatusChange _value;

  @override
  DistributionStatusChange status(DistributionStatusChangeStatusEnum status) =>
      call(status: status);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DistributionStatusChange(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DistributionStatusChange(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  DistributionStatusChange call({
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return DistributionStatusChange(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as DistributionStatusChangeStatusEnum,
    );
  }
}

extension $DistributionStatusChangeCopyWith on DistributionStatusChange {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDistributionStatusChange.copyWith(...)` or `instanceOfDistributionStatusChange.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DistributionStatusChangeCWProxy get copyWith =>
      _$DistributionStatusChangeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributionStatusChange _$DistributionStatusChangeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DistributionStatusChange', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['status']);
  final val = DistributionStatusChange(
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$DistributionStatusChangeStatusEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$DistributionStatusChangeToJson(
  DistributionStatusChange instance,
) => <String, dynamic>{
  'status': _$DistributionStatusChangeStatusEnumEnumMap[instance.status]!,
};

const _$DistributionStatusChangeStatusEnumEnumMap = {
  DistributionStatusChangeStatusEnum.REVIEWING: 'REVIEWING',
  DistributionStatusChangeStatusEnum.REVIEW_SUCCESS: 'REVIEW_SUCCESS',
  DistributionStatusChangeStatusEnum.END: 'END',
};
