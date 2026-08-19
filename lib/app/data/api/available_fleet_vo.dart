//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'driver_summary.dart';
import 'vehicle_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'available_fleet_vo.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AvailableFleetVo {
  /// Returns a new [AvailableFleetVo] instance.
  AvailableFleetVo({

     this.drivers,

     this.vehicles,
  });

  @JsonKey(
    
    name: r'drivers',
    required: false,
    includeIfNull: false,
  )


  final List<DriverSummary>? drivers;



  @JsonKey(
    
    name: r'vehicles',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleSummary>? vehicles;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AvailableFleetVo &&
      other.drivers == drivers &&
      other.vehicles == vehicles;

    @override
    int get hashCode =>
        drivers.hashCode +
        vehicles.hashCode;

  factory AvailableFleetVo.fromJson(Map<String, dynamic> json) => _$AvailableFleetVoFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableFleetVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

