//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_summary.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DriverSummary {
  /// Returns a new [DriverSummary] instance.
  DriverSummary({

     this.id,

     this.name,

     this.phone,
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
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DriverSummary &&
      other.id == id &&
      other.name == name &&
      other.phone == phone;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        phone.hashCode;

  factory DriverSummary.fromJson(Map<String, dynamic> json) => _$DriverSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$DriverSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

