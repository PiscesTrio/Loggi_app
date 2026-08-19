// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distribution_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistributionStatus {

 String? get id; String? get disId; double? get lat; double? get lng; String? get location; String? get time; int? get status;
/// Create a copy of DistributionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistributionStatusCopyWith<DistributionStatus> get copyWith => _$DistributionStatusCopyWithImpl<DistributionStatus>(this as DistributionStatus, _$identity);

  /// Serializes this DistributionStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistributionStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.disId, disId) || other.disId == disId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.location, location) || other.location == location)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,disId,lat,lng,location,time,status);

@override
String toString() {
  return 'DistributionStatus(id: $id, disId: $disId, lat: $lat, lng: $lng, location: $location, time: $time, status: $status)';
}


}

/// @nodoc
abstract mixin class $DistributionStatusCopyWith<$Res>  {
  factory $DistributionStatusCopyWith(DistributionStatus value, $Res Function(DistributionStatus) _then) = _$DistributionStatusCopyWithImpl;
@useResult
$Res call({
 String? id, String? disId, double? lat, double? lng, String? location, String? time, int? status
});




}
/// @nodoc
class _$DistributionStatusCopyWithImpl<$Res>
    implements $DistributionStatusCopyWith<$Res> {
  _$DistributionStatusCopyWithImpl(this._self, this._then);

  final DistributionStatus _self;
  final $Res Function(DistributionStatus) _then;

/// Create a copy of DistributionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? disId = freezed,Object? lat = freezed,Object? lng = freezed,Object? location = freezed,Object? time = freezed,Object? status = freezed,}) {
  return _then(DistributionStatus(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,disId: freezed == disId ? _self.disId : disId // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DistributionStatus].
extension DistributionStatusPatterns on DistributionStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistributionStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistributionStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistributionStatus value)  $default,){
final _that = this;
switch (_that) {
case _DistributionStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistributionStatus value)?  $default,){
final _that = this;
switch (_that) {
case _DistributionStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? disId,  double? lat,  double? lng,  String? location,  String? time,  int? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistributionStatus() when $default != null:
return $default(_that.id,_that.disId,_that.lat,_that.lng,_that.location,_that.time,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? disId,  double? lat,  double? lng,  String? location,  String? time,  int? status)  $default,) {final _that = this;
switch (_that) {
case _DistributionStatus():
return $default(_that.id,_that.disId,_that.lat,_that.lng,_that.location,_that.time,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? disId,  double? lat,  double? lng,  String? location,  String? time,  int? status)?  $default,) {final _that = this;
switch (_that) {
case _DistributionStatus() when $default != null:
return $default(_that.id,_that.disId,_that.lat,_that.lng,_that.location,_that.time,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistributionStatus implements DistributionStatus {
  const _DistributionStatus({this.id, this.disId, this.lat, this.lng, this.location, this.time, this.status});
  factory _DistributionStatus.fromJson(Map<String, dynamic> json) => _$DistributionStatusFromJson(json);

@override final  String? id;
@override final  String? disId;
@override final  double? lat;
@override final  double? lng;
@override final  String? location;
@override final  String? time;
@override final  int? status;

/// Create a copy of DistributionStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistributionStatusCopyWith<_DistributionStatus> get copyWith => __$DistributionStatusCopyWithImpl<_DistributionStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistributionStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistributionStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.disId, disId) || other.disId == disId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.location, location) || other.location == location)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,disId,lat,lng,location,time,status);

@override
String toString() {
  return 'DistributionStatus(id: $id, disId: $disId, lat: $lat, lng: $lng, location: $location, time: $time, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DistributionStatusCopyWith<$Res> implements $DistributionStatusCopyWith<$Res> {
  factory _$DistributionStatusCopyWith(_DistributionStatus value, $Res Function(_DistributionStatus) _then) = __$DistributionStatusCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? disId, double? lat, double? lng, String? location, String? time, int? status
});




}
/// @nodoc
class __$DistributionStatusCopyWithImpl<$Res>
    implements _$DistributionStatusCopyWith<$Res> {
  __$DistributionStatusCopyWithImpl(this._self, this._then);

  final _DistributionStatus _self;
  final $Res Function(_DistributionStatus) _then;

/// Create a copy of DistributionStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? disId = freezed,Object? lat = freezed,Object? lng = freezed,Object? location = freezed,Object? time = freezed,Object? status = freezed,}) {
  return _then(_DistributionStatus(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,disId: freezed == disId ? _self.disId : disId // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
