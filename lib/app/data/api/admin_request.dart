//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminRequest {
  /// Returns a new [AdminRequest] instance.
  AdminRequest({

    required  this.email,

    required  this.password,

     this.roles,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



  @JsonKey(
    
    name: r'roles',
    required: false,
    includeIfNull: false,
  )


  final Set<AdminRequestRolesEnum>? roles;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminRequest &&
      other.email == email &&
      other.password == password &&
      other.roles == roles;

    @override
    int get hashCode =>
        email.hashCode +
        password.hashCode +
        roles.hashCode;

  factory AdminRequest.fromJson(Map<String, dynamic> json) => _$AdminRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AdminRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum AdminRequestRolesEnum {
@JsonValue(r'ROLE_SUPER_ADMIN')
ROLE_SUPER_ADMIN(r'ROLE_SUPER_ADMIN'),
@JsonValue(r'ROLE_ADMIN')
ROLE_ADMIN(r'ROLE_ADMIN'),
@JsonValue(r'ROLE_COMMODITY')
ROLE_COMMODITY(r'ROLE_COMMODITY'),
@JsonValue(r'ROLE_EMPLOYEE')
ROLE_EMPLOYEE(r'ROLE_EMPLOYEE'),
@JsonValue(r'ROLE_SALE')
ROLE_SALE(r'ROLE_SALE'),
@JsonValue(r'ROLE_WAREHOUSE')
ROLE_WAREHOUSE(r'ROLE_WAREHOUSE');

const AdminRequestRolesEnum(this.value);

final String value;

@override
String toString() => value;
}


