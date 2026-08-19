// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_vo_login_log_vo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageVoLoginLogVoCWProxy {
  PageVoLoginLogVo items(List<LoginLogVo>? items);

  PageVoLoginLogVo page(int? page);

  PageVoLoginLogVo size(int? size);

  PageVoLoginLogVo totalItems(int? totalItems);

  PageVoLoginLogVo totalPages(int? totalPages);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `PageVoLoginLogVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PageVoLoginLogVo(...).copyWith(id: 12, name: "My name")
  /// ```
  PageVoLoginLogVo call({
    List<LoginLogVo>? items,
    int? page,
    int? size,
    int? totalItems,
    int? totalPages,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPageVoLoginLogVo.copyWith(...)` or call `instanceOfPageVoLoginLogVo.copyWith.fieldName(value)` for a single field.
class _$PageVoLoginLogVoCWProxyImpl implements _$PageVoLoginLogVoCWProxy {
  const _$PageVoLoginLogVoCWProxyImpl(this._value);

  final PageVoLoginLogVo _value;

  @override
  PageVoLoginLogVo items(List<LoginLogVo>? items) => call(items: items);

  @override
  PageVoLoginLogVo page(int? page) => call(page: page);

  @override
  PageVoLoginLogVo size(int? size) => call(size: size);

  @override
  PageVoLoginLogVo totalItems(int? totalItems) => call(totalItems: totalItems);

  @override
  PageVoLoginLogVo totalPages(int? totalPages) => call(totalPages: totalPages);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `PageVoLoginLogVo(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PageVoLoginLogVo(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PageVoLoginLogVo call({
    Object? items = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? totalItems = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
  }) {
    return PageVoLoginLogVo(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<LoginLogVo>?,
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

extension $PageVoLoginLogVoCopyWith on PageVoLoginLogVo {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPageVoLoginLogVo.copyWith(...)` or `instanceOfPageVoLoginLogVo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageVoLoginLogVoCWProxy get copyWith => _$PageVoLoginLogVoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageVoLoginLogVo _$PageVoLoginLogVoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PageVoLoginLogVo', json, ($checkedConvert) {
      final val = PageVoLoginLogVo(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>?)
              ?.map((e) => LoginLogVo.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        page: $checkedConvert('page', (v) => (v as num?)?.toInt()),
        size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
        totalItems: $checkedConvert('totalItems', (v) => (v as num?)?.toInt()),
        totalPages: $checkedConvert('totalPages', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PageVoLoginLogVoToJson(PageVoLoginLogVo instance) =>
    <String, dynamic>{
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
      'page': ?instance.page,
      'size': ?instance.size,
      'totalItems': ?instance.totalItems,
      'totalPages': ?instance.totalPages,
    };
