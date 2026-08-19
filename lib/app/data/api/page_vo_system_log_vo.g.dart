// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_vo_system_log_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageVoSystemLogVoCWProxy {
  PageVoSystemLogVo items(List<SystemLogVo>? items);

  PageVoSystemLogVo page(int? page);

  PageVoSystemLogVo size(int? size);

  PageVoSystemLogVo totalItems(int? totalItems);

  PageVoSystemLogVo totalPages(int? totalPages);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `PageVoSystemLogVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PageVoSystemLogVo(...).copyWith(id: 12, name: "My name")
  /// ```
  PageVoSystemLogVo call({
    List<SystemLogVo>? items,
    int? page,
    int? size,
    int? totalItems,
    int? totalPages,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPageVoSystemLogVo.copyWith(...)` or call `instanceOfPageVoSystemLogVo.copyWith.fieldName(value)` for a single field.
class _$PageVoSystemLogVoCWProxyImpl implements _$PageVoSystemLogVoCWProxy {
  const _$PageVoSystemLogVoCWProxyImpl(this._value);

  final PageVoSystemLogVo _value;

  @override
  PageVoSystemLogVo items(List<SystemLogVo>? items) => call(items: items);

  @override
  PageVoSystemLogVo page(int? page) => call(page: page);

  @override
  PageVoSystemLogVo size(int? size) => call(size: size);

  @override
  PageVoSystemLogVo totalItems(int? totalItems) => call(totalItems: totalItems);

  @override
  PageVoSystemLogVo totalPages(int? totalPages) => call(totalPages: totalPages);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `PageVoSystemLogVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PageVoSystemLogVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PageVoSystemLogVo call({
    Object? items = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? totalItems = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
  }) {
    return PageVoSystemLogVo(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<SystemLogVo>?,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int?,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int?,
      totalItems: totalItems == const $CopyWithPlaceholder()
          ? _value.totalItems
          // ignore: cast_nullable_to_non_nullable
          : totalItems as int?,
      totalPages: totalPages == const $CopyWithPlaceholder()
          ? _value.totalPages
          // ignore: cast_nullable_to_non_nullable
          : totalPages as int?,
    );
  }
}

extension $PageVoSystemLogVoCopyWith on PageVoSystemLogVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPageVoSystemLogVo.copyWith(...)` or `instanceOfPageVoSystemLogVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageVoSystemLogVoCWProxy get copyWith =>
      _$PageVoSystemLogVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageVoSystemLogVo _$PageVoSystemLogVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PageVoSystemLogVo', json, ($checkedConvert) {
      final val = PageVoSystemLogVo(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>?)
              ?.map((e) => SystemLogVo.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        page: $checkedConvert('page', (v) => (v as num?)?.toInt()),
        size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
        totalItems: $checkedConvert('totalItems', (v) => (v as num?)?.toInt()),
        totalPages: $checkedConvert('totalPages', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PageVoSystemLogVoToJson(PageVoSystemLogVo instance) =>
    <String, dynamic>{
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
      'page': ?instance.page,
      'size': ?instance.size,
      'totalItems': ?instance.totalItems,
      'totalPages': ?instance.totalPages,
    };
