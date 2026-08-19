//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_log_vo.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginLogVo {
  /// Returns a new [LoginLogVo] instance.
  LoginLogVo({

     this.id,

     this.email,

     this.status,

     this.ip,

     this.browser,

     this.date,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final int? status;



  @JsonKey(
    
    name: r'ip',
    required: false,
    includeIfNull: false,
  )


  final String? ip;



  @JsonKey(
    
    name: r'browser',
    required: false,
    includeIfNull: false,
  )


  final String? browser;



  @JsonKey(
    
    name: r'date',
    required: false,
    includeIfNull: false,
  )


  final DateTime? date;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LoginLogVo &&
      other.id == id &&
      other.email == email &&
      other.status == status &&
      other.ip == ip &&
      other.browser == browser &&
      other.date == date;

    @override
    int get hashCode =>
        id.hashCode +
        email.hashCode +
        status.hashCode +
        ip.hashCode +
        browser.hashCode +
        date.hashCode;

  factory LoginLogVo.fromJson(Map<String, dynamic> json) => _$LoginLogVoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginLogVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

