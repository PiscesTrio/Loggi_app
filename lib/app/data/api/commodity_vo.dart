//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_vo.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityVo {
  /// Returns a new [CommodityVo] instance.
  CommodityVo({

     this.id,

     this.name,

     this.price,

     this.description,

     this.count,

     this.createAt,

     this.updateAt,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'price',
    required: false,
    includeIfNull: false,
  )


  final num? price;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



  @JsonKey(
    
    name: r'createAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createAt;



  @JsonKey(
    
    name: r'updateAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updateAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityVo &&
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.description == description &&
      other.count == count &&
      other.createAt == createAt &&
      other.updateAt == updateAt;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        price.hashCode +
        description.hashCode +
        count.hashCode +
        createAt.hashCode +
        updateAt.hashCode;

  factory CommodityVo.fromJson(Map<String, dynamic> json) => _$CommodityVoFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

