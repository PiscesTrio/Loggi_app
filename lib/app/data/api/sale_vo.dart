//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale_vo.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SaleVo {
  /// Returns a new [SaleVo] instance.
  SaleVo({

     this.id,

     this.company,

     this.number,

     this.commodity,

     this.count,

     this.price,

     this.phone,

     this.description,

     this.pay,

     this.createAt,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'company',
    required: false,
    includeIfNull: false,
  )


  final String? company;



  @JsonKey(
    
    name: r'number',
    required: false,
    includeIfNull: false,
  )


  final String? number;



  @JsonKey(
    
    name: r'commodity',
    required: false,
    includeIfNull: false,
  )


  final String? commodity;



  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



  @JsonKey(
    
    name: r'price',
    required: false,
    includeIfNull: false,
  )


  final num? price;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'pay',
    required: false,
    includeIfNull: false,
  )


  final bool? pay;



  @JsonKey(
    
    name: r'createAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SaleVo &&
      other.id == id &&
      other.company == company &&
      other.number == number &&
      other.commodity == commodity &&
      other.count == count &&
      other.price == price &&
      other.phone == phone &&
      other.description == description &&
      other.pay == pay &&
      other.createAt == createAt;

    @override
    int get hashCode =>
        id.hashCode +
        company.hashCode +
        number.hashCode +
        commodity.hashCode +
        count.hashCode +
        price.hashCode +
        phone.hashCode +
        description.hashCode +
        pay.hashCode +
        createAt.hashCode;

  factory SaleVo.fromJson(Map<String, dynamic> json) => _$SaleVoFromJson(json);

  Map<String, dynamic> toJson() => _$SaleVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

