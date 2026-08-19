//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'system_log_vo.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_vo_system_log_vo.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PageVoSystemLogVo {
  /// Returns a new [PageVoSystemLogVo] instance.
  PageVoSystemLogVo({

     this.items,

     this.page,

     this.size,

     this.totalItems,

     this.totalPages,
  });

  @JsonKey(
    
    name: r'items',
    required: false,
    includeIfNull: false,
  )


  final List<SystemLogVo>? items;



  @JsonKey(
    
    name: r'page',
    required: false,
    includeIfNull: false,
  )


  final int? page;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



  @JsonKey(
    
    name: r'totalItems',
    required: false,
    includeIfNull: false,
  )


  final int? totalItems;



  @JsonKey(
    
    name: r'totalPages',
    required: false,
    includeIfNull: false,
  )


  final int? totalPages;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PageVoSystemLogVo &&
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

  factory PageVoSystemLogVo.fromJson(Map<String, dynamic> json) => _$PageVoSystemLogVoFromJson(json);

  Map<String, dynamic> toJson() => _$PageVoSystemLogVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

