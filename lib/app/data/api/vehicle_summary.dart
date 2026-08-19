//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_summary.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleSummary {
  /// Returns a new [VehicleSummary] instance.
  VehicleSummary({

     this.id,

     this.number,

     this.type,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'number',
    required: false,
    includeIfNull: false,
  )


  final String? number;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleSummary &&
      other.id == id &&
      other.number == number &&
      other.type == type;

    @override
    int get hashCode =>
        id.hashCode +
        number.hashCode +
        type.hashCode;

  factory VehicleSummary.fromJson(Map<String, dynamic> json) => _$VehicleSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

