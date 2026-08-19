//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory_record_vo.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InventoryRecordVo {
  /// Returns a new [InventoryRecordVo] instance.
  InventoryRecordVo({

     this.id,

     this.warehouseId,

     this.commodityId,

     this.name,

     this.count,

     this.type,

     this.description,

     this.createAt,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'warehouseId',
    required: false,
    includeIfNull: false,
  )


  final String? warehouseId;



  @JsonKey(
    
    name: r'commodityId',
    required: false,
    includeIfNull: false,
  )


  final String? commodityId;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final InventoryRecordVoTypeEnum? type;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'createAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InventoryRecordVo &&
      other.id == id &&
      other.warehouseId == warehouseId &&
      other.commodityId == commodityId &&
      other.name == name &&
      other.count == count &&
      other.type == type &&
      other.description == description &&
      other.createAt == createAt;

    @override
    int get hashCode =>
        id.hashCode +
        warehouseId.hashCode +
        commodityId.hashCode +
        name.hashCode +
        count.hashCode +
        type.hashCode +
        description.hashCode +
        createAt.hashCode;

  factory InventoryRecordVo.fromJson(Map<String, dynamic> json) => _$InventoryRecordVoFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryRecordVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum InventoryRecordVoTypeEnum {
@JsonValue(r'IN')
IN(r'IN'),
@JsonValue(r'OUT')
OUT(r'OUT');

const InventoryRecordVoTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


