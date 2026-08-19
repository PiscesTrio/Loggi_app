//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_chart_vo.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityChartVo {
  /// Returns a new [CommodityChartVo] instance.
  CommodityChartVo({this.value, this.name});

  @JsonKey(name: r'value', required: false, includeIfNull: false)
  final int? value;

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommodityChartVo && other.value == value && other.name == name;

  @override
  int get hashCode => value.hashCode + name.hashCode;

  factory CommodityChartVo.fromJson(Map<String, dynamic> json) =>
      _$CommodityChartVoFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityChartVoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
