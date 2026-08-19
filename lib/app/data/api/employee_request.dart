//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EmployeeRequest {
  /// Returns a new [EmployeeRequest] instance.
  EmployeeRequest({

    required  this.name,

     this.gender,

    required  this.phone,

     this.address,

     this.idCard,

     this.department,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'gender',
    required: false,
    includeIfNull: false,
  )


  final String? gender;



  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: false,
  )


  final String phone;



  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;



  @JsonKey(
    
    name: r'idCard',
    required: false,
    includeIfNull: false,
  )


  final String? idCard;



  @JsonKey(
    
    name: r'department',
    required: false,
    includeIfNull: false,
  )


  final String? department;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EmployeeRequest &&
      other.name == name &&
      other.gender == gender &&
      other.phone == phone &&
      other.address == address &&
      other.idCard == idCard &&
      other.department == department;

    @override
    int get hashCode =>
        name.hashCode +
        gender.hashCode +
        phone.hashCode +
        address.hashCode +
        idCard.hashCode +
        department.hashCode;

  factory EmployeeRequest.fromJson(Map<String, dynamic> json) => _$EmployeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

