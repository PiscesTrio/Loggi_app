// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Distribution {

 String? get id; String? get did; String? get vid; String? get driver; String? get number; String? get phone; String? get address; bool? get urgent; String? get care; String? get time; int? get status; String? get wid; double? get fromLat; double? get fromLng; double? get toLat; double? get toLng;
/// Create a copy of Distribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistributionCopyWith<Distribution> get copyWith => _$DistributionCopyWithImpl<Distribution>(this as Distribution, _$identity);

  /// Serializes this Distribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Distribution&&(identical(other.id, id) || other.id == id)&&(identical(other.did, did) || other.did == did)&&(identical(other.vid, vid) || other.vid == vid)&&(identical(other.driver, driver) || other.driver == driver)&&(identical(other.number, number) || other.number == number)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.urgent, urgent) || other.urgent == urgent)&&(identical(other.care, care) || other.care == care)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.wid, wid) || other.wid == wid)&&(identical(other.fromLat, fromLat) || other.fromLat == fromLat)&&(identical(other.fromLng, fromLng) || other.fromLng == fromLng)&&(identical(other.toLat, toLat) || other.toLat == toLat)&&(identical(other.toLng, toLng) || other.toLng == toLng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,did,vid,driver,number,phone,address,urgent,care,time,status,wid,fromLat,fromLng,toLat,toLng);

@override
String toString() {
  return 'Distribution(id: $id, did: $did, vid: $vid, driver: $driver, number: $number, phone: $phone, address: $address, urgent: $urgent, care: $care, time: $time, status: $status, wid: $wid, fromLat: $fromLat, fromLng: $fromLng, toLat: $toLat, toLng: $toLng)';
}


}

/// @nodoc
abstract mixin class $DistributionCopyWith<$Res>  {
  factory $DistributionCopyWith(Distribution value, $Res Function(Distribution) _then) = _$DistributionCopyWithImpl;
@useResult
$Res call({
 String? id, String? did, String? vid, String? driver, String? number, String? phone, String? address, bool? urgent, String? care, String? time, int? status, String? wid, double? fromLat, double? fromLng, double? toLat, double? toLng
});




}
/// @nodoc
class _$DistributionCopyWithImpl<$Res>
    implements $DistributionCopyWith<$Res> {
  _$DistributionCopyWithImpl(this._self, this._then);

  final Distribution _self;
  final $Res Function(Distribution) _then;

/// Create a copy of Distribution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? did = freezed,Object? vid = freezed,Object? driver = freezed,Object? number = freezed,Object? phone = freezed,Object? address = freezed,Object? urgent = freezed,Object? care = freezed,Object? time = freezed,Object? status = freezed,Object? wid = freezed,Object? fromLat = freezed,Object? fromLng = freezed,Object? toLat = freezed,Object? toLng = freezed,}) {
  return _then(Distribution(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,did: freezed == did ? _self.did : did // ignore: cast_nullable_to_non_nullable
as String?,vid: freezed == vid ? _self.vid : vid // ignore: cast_nullable_to_non_nullable
as String?,driver: freezed == driver ? _self.driver : driver // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,urgent: freezed == urgent ? _self.urgent : urgent // ignore: cast_nullable_to_non_nullable
as bool?,care: freezed == care ? _self.care : care // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,wid: freezed == wid ? _self.wid : wid // ignore: cast_nullable_to_non_nullable
as String?,fromLat: freezed == fromLat ? _self.fromLat : fromLat // ignore: cast_nullable_to_non_nullable
as double?,fromLng: freezed == fromLng ? _self.fromLng : fromLng // ignore: cast_nullable_to_non_nullable
as double?,toLat: freezed == toLat ? _self.toLat : toLat // ignore: cast_nullable_to_non_nullable
as double?,toLng: freezed == toLng ? _self.toLng : toLng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Distribution].
extension DistributionPatterns on Distribution {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Distribution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Distribution() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Distribution value)  $default,){
final _that = this;
switch (_that) {
case _Distribution():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Distribution value)?  $default,){
final _that = this;
switch (_that) {
case _Distribution() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? did,  String? vid,  String? driver,  String? number,  String? phone,  String? address,  bool? urgent,  String? care,  String? time,  int? status,  String? wid,  double? fromLat,  double? fromLng,  double? toLat,  double? toLng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Distribution() when $default != null:
return $default(_that.id,_that.did,_that.vid,_that.driver,_that.number,_that.phone,_that.address,_that.urgent,_that.care,_that.time,_that.status,_that.wid,_that.fromLat,_that.fromLng,_that.toLat,_that.toLng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? did,  String? vid,  String? driver,  String? number,  String? phone,  String? address,  bool? urgent,  String? care,  String? time,  int? status,  String? wid,  double? fromLat,  double? fromLng,  double? toLat,  double? toLng)  $default,) {final _that = this;
switch (_that) {
case _Distribution():
return $default(_that.id,_that.did,_that.vid,_that.driver,_that.number,_that.phone,_that.address,_that.urgent,_that.care,_that.time,_that.status,_that.wid,_that.fromLat,_that.fromLng,_that.toLat,_that.toLng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? did,  String? vid,  String? driver,  String? number,  String? phone,  String? address,  bool? urgent,  String? care,  String? time,  int? status,  String? wid,  double? fromLat,  double? fromLng,  double? toLat,  double? toLng)?  $default,) {final _that = this;
switch (_that) {
case _Distribution() when $default != null:
return $default(_that.id,_that.did,_that.vid,_that.driver,_that.number,_that.phone,_that.address,_that.urgent,_that.care,_that.time,_that.status,_that.wid,_that.fromLat,_that.fromLng,_that.toLat,_that.toLng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Distribution implements Distribution {
  const _Distribution({this.id, this.did, this.vid, this.driver, this.number, this.phone, this.address, this.urgent, this.care, this.time, this.status, this.wid, this.fromLat, this.fromLng, this.toLat, this.toLng});
  factory _Distribution.fromJson(Map<String, dynamic> json) => _$DistributionFromJson(json);

@override final  String? id;
@override final  String? did;
@override final  String? vid;
@override final  String? driver;
@override final  String? number;
@override final  String? phone;
@override final  String? address;
@override final  bool? urgent;
@override final  String? care;
@override final  String? time;
@override final  int? status;
@override final  String? wid;
@override final  double? fromLat;
@override final  double? fromLng;
@override final  double? toLat;
@override final  double? toLng;

/// Create a copy of Distribution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistributionCopyWith<_Distribution> get copyWith => __$DistributionCopyWithImpl<_Distribution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistributionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Distribution&&(identical(other.id, id) || other.id == id)&&(identical(other.did, did) || other.did == did)&&(identical(other.vid, vid) || other.vid == vid)&&(identical(other.driver, driver) || other.driver == driver)&&(identical(other.number, number) || other.number == number)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.urgent, urgent) || other.urgent == urgent)&&(identical(other.care, care) || other.care == care)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.wid, wid) || other.wid == wid)&&(identical(other.fromLat, fromLat) || other.fromLat == fromLat)&&(identical(other.fromLng, fromLng) || other.fromLng == fromLng)&&(identical(other.toLat, toLat) || other.toLat == toLat)&&(identical(other.toLng, toLng) || other.toLng == toLng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,did,vid,driver,number,phone,address,urgent,care,time,status,wid,fromLat,fromLng,toLat,toLng);

@override
String toString() {
  return 'Distribution(id: $id, did: $did, vid: $vid, driver: $driver, number: $number, phone: $phone, address: $address, urgent: $urgent, care: $care, time: $time, status: $status, wid: $wid, fromLat: $fromLat, fromLng: $fromLng, toLat: $toLat, toLng: $toLng)';
}


}

/// @nodoc
abstract mixin class _$DistributionCopyWith<$Res> implements $DistributionCopyWith<$Res> {
  factory _$DistributionCopyWith(_Distribution value, $Res Function(_Distribution) _then) = __$DistributionCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? did, String? vid, String? driver, String? number, String? phone, String? address, bool? urgent, String? care, String? time, int? status, String? wid, double? fromLat, double? fromLng, double? toLat, double? toLng
});




}
/// @nodoc
class __$DistributionCopyWithImpl<$Res>
    implements _$DistributionCopyWith<$Res> {
  __$DistributionCopyWithImpl(this._self, this._then);

  final _Distribution _self;
  final $Res Function(_Distribution) _then;

/// Create a copy of Distribution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? did = freezed,Object? vid = freezed,Object? driver = freezed,Object? number = freezed,Object? phone = freezed,Object? address = freezed,Object? urgent = freezed,Object? care = freezed,Object? time = freezed,Object? status = freezed,Object? wid = freezed,Object? fromLat = freezed,Object? fromLng = freezed,Object? toLat = freezed,Object? toLng = freezed,}) {
  return _then(_Distribution(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,did: freezed == did ? _self.did : did // ignore: cast_nullable_to_non_nullable
as String?,vid: freezed == vid ? _self.vid : vid // ignore: cast_nullable_to_non_nullable
as String?,driver: freezed == driver ? _self.driver : driver // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,urgent: freezed == urgent ? _self.urgent : urgent // ignore: cast_nullable_to_non_nullable
as bool?,care: freezed == care ? _self.care : care // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,wid: freezed == wid ? _self.wid : wid // ignore: cast_nullable_to_non_nullable
as String?,fromLat: freezed == fromLat ? _self.fromLat : fromLat // ignore: cast_nullable_to_non_nullable
as double?,fromLng: freezed == fromLng ? _self.fromLng : fromLng // ignore: cast_nullable_to_non_nullable
as double?,toLat: freezed == toLat ? _self.toLat : toLat // ignore: cast_nullable_to_non_nullable
as double?,toLng: freezed == toLng ? _self.toLng : toLng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
