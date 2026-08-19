// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageableCWProxy {
  Pageable page(int? page);

  Pageable size(int? size);

  Pageable sort(List<String>? sort);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `Pageable(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Pageable(...).copyWith(id: 12, name: "My name")
  /// ```
  Pageable call({int? page, int? size, List<String>? sort});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPageable.copyWith(...)` or call `instanceOfPageable.copyWith.fieldName(value)` for a single field.
class _$PageableCWProxyImpl implements _$PageableCWProxy {
  const _$PageableCWProxyImpl(this._value);

  final Pageable _value;

  @override
  Pageable page(int? page) => call(page: page);

  @override
  Pageable size(int? size) => call(size: size);

  @override
  Pageable sort(List<String>? sort) => call(sort: sort);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `Pageable(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// Pageable(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  Pageable call({
    Object? page = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
  }) {
    return Pageable(
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int?,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int?,
      sort: sort == const $CopyWithPlaceholder()
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as List<String>?,
    );
  }
}

extension $PageableCopyWith on Pageable {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPageable.copyWith(...)` or `instanceOfPageable.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageableCWProxy get copyWith => _$PageableCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pageable _$PageableFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Pageable', json, ($checkedConvert) {
      final val = Pageable(
        page: $checkedConvert('page', (v) => (v as num?)?.toInt()),
        size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
        sort: $checkedConvert(
          'sort',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
  'page': ?instance.page,
  'size': ?instance.size,
  'sort': ?instance.sort,
};
