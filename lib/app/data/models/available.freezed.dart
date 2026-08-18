// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Available {

 List<Driver>? get drivers; List<Vehicle>? get vehicles;
/// Create a copy of Available
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableCopyWith<Available> get copyWith => _$AvailableCopyWithImpl<Available>(this as Available, _$identity);

  /// Serializes this Available to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Available&&const DeepCollectionEquality().equals(other.drivers, drivers)&&const DeepCollectionEquality().equals(other.vehicles, vehicles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(drivers),const DeepCollectionEquality().hash(vehicles));

@override
String toString() {
  return 'Available(drivers: $drivers, vehicles: $vehicles)';
}


}

/// @nodoc
abstract mixin class $AvailableCopyWith<$Res>  {
  factory $AvailableCopyWith(Available value, $Res Function(Available) _then) = _$AvailableCopyWithImpl;
@useResult
$Res call({
 List<Driver>? drivers, List<Vehicle>? vehicles
});




}
/// @nodoc
class _$AvailableCopyWithImpl<$Res>
    implements $AvailableCopyWith<$Res> {
  _$AvailableCopyWithImpl(this._self, this._then);

  final Available _self;
  final $Res Function(Available) _then;

/// Create a copy of Available
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drivers = freezed,Object? vehicles = freezed,}) {
  return _then(Available(
drivers: freezed == drivers ? _self.drivers : drivers // ignore: cast_nullable_to_non_nullable
as List<Driver>?,vehicles: freezed == vehicles ? _self.vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<Vehicle>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Available].
extension AvailablePatterns on Available {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Available value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Available() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Available value)  $default,){
final _that = this;
switch (_that) {
case _Available():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Available value)?  $default,){
final _that = this;
switch (_that) {
case _Available() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Driver>? drivers,  List<Vehicle>? vehicles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Available() when $default != null:
return $default(_that.drivers,_that.vehicles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Driver>? drivers,  List<Vehicle>? vehicles)  $default,) {final _that = this;
switch (_that) {
case _Available():
return $default(_that.drivers,_that.vehicles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Driver>? drivers,  List<Vehicle>? vehicles)?  $default,) {final _that = this;
switch (_that) {
case _Available() when $default != null:
return $default(_that.drivers,_that.vehicles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Available implements Available {
  const _Available({ List<Driver>? drivers,  List<Vehicle>? vehicles}): _drivers = drivers,_vehicles = vehicles;
  factory _Available.fromJson(Map<String, dynamic> json) => _$AvailableFromJson(json);

 final  List<Driver>? _drivers;
@override List<Driver>? get drivers {
  final value = _drivers;
  if (value == null) return null;
  if (_drivers is EqualUnmodifiableListView) return _drivers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Vehicle>? _vehicles;
@override List<Vehicle>? get vehicles {
  final value = _vehicles;
  if (value == null) return null;
  if (_vehicles is EqualUnmodifiableListView) return _vehicles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Available
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailableCopyWith<_Available> get copyWith => __$AvailableCopyWithImpl<_Available>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailableToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Available&&const DeepCollectionEquality().equals(other._drivers, _drivers)&&const DeepCollectionEquality().equals(other._vehicles, _vehicles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_drivers),const DeepCollectionEquality().hash(_vehicles));

@override
String toString() {
  return 'Available(drivers: $drivers, vehicles: $vehicles)';
}


}

/// @nodoc
abstract mixin class _$AvailableCopyWith<$Res> implements $AvailableCopyWith<$Res> {
  factory _$AvailableCopyWith(_Available value, $Res Function(_Available) _then) = __$AvailableCopyWithImpl;
@override @useResult
$Res call({
 List<Driver>? drivers, List<Vehicle>? vehicles
});




}
/// @nodoc
class __$AvailableCopyWithImpl<$Res>
    implements _$AvailableCopyWith<$Res> {
  __$AvailableCopyWithImpl(this._self, this._then);

  final _Available _self;
  final $Res Function(_Available) _then;

/// Create a copy of Available
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drivers = freezed,Object? vehicles = freezed,}) {
  return _then(_Available(
drivers: freezed == drivers ? _self._drivers : drivers // ignore: cast_nullable_to_non_nullable
as List<Driver>?,vehicles: freezed == vehicles ? _self._vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<Vehicle>?,
  ));
}


}

// dart format on
