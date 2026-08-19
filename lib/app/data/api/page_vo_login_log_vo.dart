//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'login_log_vo.dart';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_vo_login_log_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PageVoLoginLogVo {
  /// Returns a new [PageVoLoginLogVo] instance.
  PageVoLoginLogVo({
    this.items,

    this.page,

    this.size,

    this.totalItems,

    this.totalPages,
  });

  @JsonKey(name: r'items', required: false, includeIfNull: false)
  final List<LoginLogVo>? items;

  @JsonKey(name: r'page', required: false, includeIfNull: false)
  final int? page;

  @JsonKey(name: r'size', required: false, includeIfNull: false)
  final int? size;

  @JsonKey(name: r'totalItems', required: false, includeIfNull: false)
  final int? totalItems;

  @JsonKey(name: r'totalPages', required: false, includeIfNull: false)
  final int? totalPages;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageVoLoginLogVo &&
          other.items == items &&
          other.page == page &&
          other.size == size &&
          other.totalItems == totalItems &&
          other.totalPages == totalPages;

  @override
  int get hashCode =>
      items.hashCode +
      page.hashCode +
      size.hashCode +
      totalItems.hashCode +
      totalPages.hashCode;

  factory PageVoLoginLogVo.fromJson(Map<String, dynamic> json) =>
      _$PageVoLoginLogVoFromJson(json);

  Map<String, dynamic> toJson() => _$PageVoLoginLogVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
