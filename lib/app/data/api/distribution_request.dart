//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distribution_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DistributionRequest {
  /// Returns a new [DistributionRequest] instance.
  DistributionRequest({

    required  this.driverId,

    required  this.vehicleId,

     this.warehouseId,

    required  this.phone,

    required  this.address,

     this.urgent,

     this.care,

    required  this.time,

    required  this.status,

     this.fromLat,

     this.fromLng,

     this.toLat,

     this.toLng,
  });

  @JsonKey(
    
    name: r'driverId',
    required: true,
    includeIfNull: false,
  )


  final String driverId;



  @JsonKey(
    
    name: r'vehicleId',
    required: true,
    includeIfNull: false,
  )


  final String vehicleId;



  @JsonKey(
    
    name: r'warehouseId',
    required: false,
    includeIfNull: false,
  )


  final String? warehouseId;



  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: false,
  )


  final String phone;



  @JsonKey(
    
    name: r'address',
    required: true,
    includeIfNull: false,
  )


  final String address;



  @JsonKey(
    
    name: r'urgent',
    required: false,
    includeIfNull: false,
  )


  final bool? urgent;



  @JsonKey(
    
    name: r'care',
    required: false,
    includeIfNull: false,
  )


  final String? care;



  @JsonKey(
    
    name: r'time',
    required: true,
    includeIfNull: false,
  )


  final DateTime time;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final DistributionRequestStatusEnum status;



          // minimum: -90.0
          // maximum: 90.0
  @JsonKey(
    
    name: r'fromLat',
    required: false,
    includeIfNull: false,
  )


  final double? fromLat;



          // minimum: -180.0
          // maximum: 180.0
  @JsonKey(
    
    name: r'fromLng',
    required: false,
    includeIfNull: false,
  )


  final double? fromLng;



          // minimum: -90.0
          // maximum: 90.0
  @JsonKey(
    
    name: r'toLat',
    required: false,
    includeIfNull: false,
  )


  final double? toLat;



          // minimum: -180.0
          // maximum: 180.0
  @JsonKey(
    
    name: r'toLng',
    required: false,
    includeIfNull: false,
  )


  final double? toLng;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DistributionRequest &&
      other.driverId == driverId &&
      other.vehicleId == vehicleId &&
      other.warehouseId == warehouseId &&
      other.phone == phone &&
      other.address == address &&
      other.urgent == urgent &&
      other.care == care &&
      other.time == time &&
      other.status == status &&
      other.fromLat == fromLat &&
      other.fromLng == fromLng &&
      other.toLat == toLat &&
      other.toLng == toLng;

    @override
    int get hashCode =>
        driverId.hashCode +
        vehicleId.hashCode +
        warehouseId.hashCode +
        phone.hashCode +
        address.hashCode +
        urgent.hashCode +
        care.hashCode +
        time.hashCode +
        status.hashCode +
        fromLat.hashCode +
        fromLng.hashCode +
        toLat.hashCode +
        toLng.hashCode;

  factory DistributionRequest.fromJson(Map<String, dynamic> json) => _$DistributionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DistributionRequestStatusEnum {
@JsonValue(r'REVIEWING')
REVIEWING(r'REVIEWING'),
@JsonValue(r'REVIEW_SUCCESS')
REVIEW_SUCCESS(r'REVIEW_SUCCESS'),
@JsonValue(r'END')
END(r'END');

const DistributionRequestStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


