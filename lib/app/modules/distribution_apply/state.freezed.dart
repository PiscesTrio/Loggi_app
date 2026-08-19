// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplyFormState {

 Distribution get draft; List<Driver> get drivers; List<Vehicle> get vehicles; List<Warehouse> get warehouses; Driver? get selectedDriver; Vehicle? get selectedVehicle; Warehouse? get selectedWarehouse; DeliveryPoint? get selectedDeliveryPoint; DateTime get dateTime; List<String> get cares;
/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplyFormStateCopyWith<ApplyFormState> get copyWith => _$ApplyFormStateCopyWithImpl<ApplyFormState>(this as ApplyFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplyFormState&&(identical(other.draft, draft) || other.draft == draft)&&const DeepCollectionEquality().equals(other.drivers, drivers)&&const DeepCollectionEquality().equals(other.vehicles, vehicles)&&const DeepCollectionEquality().equals(other.warehouses, warehouses)&&(identical(other.selectedDriver, selectedDriver) || other.selectedDriver == selectedDriver)&&(identical(other.selectedVehicle, selectedVehicle) || other.selectedVehicle == selectedVehicle)&&(identical(other.selectedWarehouse, selectedWarehouse) || other.selectedWarehouse == selectedWarehouse)&&(identical(other.selectedDeliveryPoint, selectedDeliveryPoint) || other.selectedDeliveryPoint == selectedDeliveryPoint)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other.cares, cares));
}


@override
int get hashCode => Object.hash(runtimeType,draft,const DeepCollectionEquality().hash(drivers),const DeepCollectionEquality().hash(vehicles),const DeepCollectionEquality().hash(warehouses),selectedDriver,selectedVehicle,selectedWarehouse,selectedDeliveryPoint,dateTime,const DeepCollectionEquality().hash(cares));

@override
String toString() {
  return 'ApplyFormState(draft: $draft, drivers: $drivers, vehicles: $vehicles, warehouses: $warehouses, selectedDriver: $selectedDriver, selectedVehicle: $selectedVehicle, selectedWarehouse: $selectedWarehouse, selectedDeliveryPoint: $selectedDeliveryPoint, dateTime: $dateTime, cares: $cares)';
}


}

/// @nodoc
abstract mixin class $ApplyFormStateCopyWith<$Res>  {
  factory $ApplyFormStateCopyWith(ApplyFormState value, $Res Function(ApplyFormState) _then) = _$ApplyFormStateCopyWithImpl;
@useResult
$Res call({
 Distribution draft, List<Driver> drivers, List<Vehicle> vehicles, List<Warehouse> warehouses, Driver? selectedDriver, Vehicle? selectedVehicle, Warehouse? selectedWarehouse, DeliveryPoint? selectedDeliveryPoint, DateTime dateTime, List<String> cares
});


$DistributionCopyWith<$Res> get draft;$DriverCopyWith<$Res>? get selectedDriver;$VehicleCopyWith<$Res>? get selectedVehicle;

}
/// @nodoc
class _$ApplyFormStateCopyWithImpl<$Res>
    implements $ApplyFormStateCopyWith<$Res> {
  _$ApplyFormStateCopyWithImpl(this._self, this._then);

  final ApplyFormState _self;
  final $Res Function(ApplyFormState) _then;

/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draft = null,Object? drivers = null,Object? vehicles = null,Object? warehouses = null,Object? selectedDriver = freezed,Object? selectedVehicle = freezed,Object? selectedWarehouse = freezed,Object? selectedDeliveryPoint = freezed,Object? dateTime = null,Object? cares = null,}) {
  return _then(ApplyFormState(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as Distribution,drivers: null == drivers ? _self.drivers : drivers // ignore: cast_nullable_to_non_nullable
as List<Driver>,vehicles: null == vehicles ? _self.vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<Vehicle>,warehouses: null == warehouses ? _self.warehouses : warehouses // ignore: cast_nullable_to_non_nullable
as List<Warehouse>,selectedDriver: freezed == selectedDriver ? _self.selectedDriver : selectedDriver // ignore: cast_nullable_to_non_nullable
as Driver?,selectedVehicle: freezed == selectedVehicle ? _self.selectedVehicle : selectedVehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,selectedWarehouse: freezed == selectedWarehouse ? _self.selectedWarehouse : selectedWarehouse // ignore: cast_nullable_to_non_nullable
as Warehouse?,selectedDeliveryPoint: freezed == selectedDeliveryPoint ? _self.selectedDeliveryPoint : selectedDeliveryPoint // ignore: cast_nullable_to_non_nullable
as DeliveryPoint?,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,cares: null == cares ? _self.cares : cares // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistributionCopyWith<$Res> get draft {
  
  return $DistributionCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverCopyWith<$Res>? get selectedDriver {
    if (_self.selectedDriver == null) {
    return null;
  }

  return $DriverCopyWith<$Res>(_self.selectedDriver!, (value) {
    return _then(_self.copyWith(selectedDriver: value));
  });
}/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleCopyWith<$Res>? get selectedVehicle {
    if (_self.selectedVehicle == null) {
    return null;
  }

  return $VehicleCopyWith<$Res>(_self.selectedVehicle!, (value) {
    return _then(_self.copyWith(selectedVehicle: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplyFormState].
extension ApplyFormStatePatterns on ApplyFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplyFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplyFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplyFormState value)  $default,){
final _that = this;
switch (_that) {
case _ApplyFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplyFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ApplyFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Distribution draft,  List<Driver> drivers,  List<Vehicle> vehicles,  List<Warehouse> warehouses,  Driver? selectedDriver,  Vehicle? selectedVehicle,  Warehouse? selectedWarehouse,  DeliveryPoint? selectedDeliveryPoint,  DateTime dateTime,  List<String> cares)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplyFormState() when $default != null:
return $default(_that.draft,_that.drivers,_that.vehicles,_that.warehouses,_that.selectedDriver,_that.selectedVehicle,_that.selectedWarehouse,_that.selectedDeliveryPoint,_that.dateTime,_that.cares);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Distribution draft,  List<Driver> drivers,  List<Vehicle> vehicles,  List<Warehouse> warehouses,  Driver? selectedDriver,  Vehicle? selectedVehicle,  Warehouse? selectedWarehouse,  DeliveryPoint? selectedDeliveryPoint,  DateTime dateTime,  List<String> cares)  $default,) {final _that = this;
switch (_that) {
case _ApplyFormState():
return $default(_that.draft,_that.drivers,_that.vehicles,_that.warehouses,_that.selectedDriver,_that.selectedVehicle,_that.selectedWarehouse,_that.selectedDeliveryPoint,_that.dateTime,_that.cares);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Distribution draft,  List<Driver> drivers,  List<Vehicle> vehicles,  List<Warehouse> warehouses,  Driver? selectedDriver,  Vehicle? selectedVehicle,  Warehouse? selectedWarehouse,  DeliveryPoint? selectedDeliveryPoint,  DateTime dateTime,  List<String> cares)?  $default,) {final _that = this;
switch (_that) {
case _ApplyFormState() when $default != null:
return $default(_that.draft,_that.drivers,_that.vehicles,_that.warehouses,_that.selectedDriver,_that.selectedVehicle,_that.selectedWarehouse,_that.selectedDeliveryPoint,_that.dateTime,_that.cares);case _:
  return null;

}
}

}

/// @nodoc


class _ApplyFormState implements ApplyFormState {
  const _ApplyFormState({required this.draft, required  List<Driver> drivers, required  List<Vehicle> vehicles, required  List<Warehouse> warehouses, this.selectedDriver, this.selectedVehicle, this.selectedWarehouse, this.selectedDeliveryPoint, required this.dateTime,  List<String> cares = const <String>[]}): _drivers = drivers,_vehicles = vehicles,_warehouses = warehouses,_cares = cares;
  

@override final  Distribution draft;
 final  List<Driver> _drivers;
@override List<Driver> get drivers {
  if (_drivers is EqualUnmodifiableListView) return _drivers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drivers);
}

 final  List<Vehicle> _vehicles;
@override List<Vehicle> get vehicles {
  if (_vehicles is EqualUnmodifiableListView) return _vehicles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vehicles);
}

 final  List<Warehouse> _warehouses;
@override List<Warehouse> get warehouses {
  if (_warehouses is EqualUnmodifiableListView) return _warehouses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warehouses);
}

@override final  Driver? selectedDriver;
@override final  Vehicle? selectedVehicle;
@override final  Warehouse? selectedWarehouse;
@override final  DeliveryPoint? selectedDeliveryPoint;
@override final  DateTime dateTime;
 final  List<String> _cares;
@override@JsonKey() List<String> get cares {
  if (_cares is EqualUnmodifiableListView) return _cares;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cares);
}


/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyFormStateCopyWith<_ApplyFormState> get copyWith => __$ApplyFormStateCopyWithImpl<_ApplyFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyFormState&&(identical(other.draft, draft) || other.draft == draft)&&const DeepCollectionEquality().equals(other._drivers, _drivers)&&const DeepCollectionEquality().equals(other._vehicles, _vehicles)&&const DeepCollectionEquality().equals(other._warehouses, _warehouses)&&(identical(other.selectedDriver, selectedDriver) || other.selectedDriver == selectedDriver)&&(identical(other.selectedVehicle, selectedVehicle) || other.selectedVehicle == selectedVehicle)&&(identical(other.selectedWarehouse, selectedWarehouse) || other.selectedWarehouse == selectedWarehouse)&&(identical(other.selectedDeliveryPoint, selectedDeliveryPoint) || other.selectedDeliveryPoint == selectedDeliveryPoint)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other._cares, _cares));
}


@override
int get hashCode => Object.hash(runtimeType,draft,const DeepCollectionEquality().hash(_drivers),const DeepCollectionEquality().hash(_vehicles),const DeepCollectionEquality().hash(_warehouses),selectedDriver,selectedVehicle,selectedWarehouse,selectedDeliveryPoint,dateTime,const DeepCollectionEquality().hash(_cares));

@override
String toString() {
  return 'ApplyFormState(draft: $draft, drivers: $drivers, vehicles: $vehicles, warehouses: $warehouses, selectedDriver: $selectedDriver, selectedVehicle: $selectedVehicle, selectedWarehouse: $selectedWarehouse, selectedDeliveryPoint: $selectedDeliveryPoint, dateTime: $dateTime, cares: $cares)';
}


}

/// @nodoc
abstract mixin class _$ApplyFormStateCopyWith<$Res> implements $ApplyFormStateCopyWith<$Res> {
  factory _$ApplyFormStateCopyWith(_ApplyFormState value, $Res Function(_ApplyFormState) _then) = __$ApplyFormStateCopyWithImpl;
@override @useResult
$Res call({
 Distribution draft, List<Driver> drivers, List<Vehicle> vehicles, List<Warehouse> warehouses, Driver? selectedDriver, Vehicle? selectedVehicle, Warehouse? selectedWarehouse, DeliveryPoint? selectedDeliveryPoint, DateTime dateTime, List<String> cares
});


@override $DistributionCopyWith<$Res> get draft;@override $DriverCopyWith<$Res>? get selectedDriver;@override $VehicleCopyWith<$Res>? get selectedVehicle;

}
/// @nodoc
class __$ApplyFormStateCopyWithImpl<$Res>
    implements _$ApplyFormStateCopyWith<$Res> {
  __$ApplyFormStateCopyWithImpl(this._self, this._then);

  final _ApplyFormState _self;
  final $Res Function(_ApplyFormState) _then;

/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,Object? drivers = null,Object? vehicles = null,Object? warehouses = null,Object? selectedDriver = freezed,Object? selectedVehicle = freezed,Object? selectedWarehouse = freezed,Object? selectedDeliveryPoint = freezed,Object? dateTime = null,Object? cares = null,}) {
  return _then(_ApplyFormState(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as Distribution,drivers: null == drivers ? _self._drivers : drivers // ignore: cast_nullable_to_non_nullable
as List<Driver>,vehicles: null == vehicles ? _self._vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<Vehicle>,warehouses: null == warehouses ? _self._warehouses : warehouses // ignore: cast_nullable_to_non_nullable
as List<Warehouse>,selectedDriver: freezed == selectedDriver ? _self.selectedDriver : selectedDriver // ignore: cast_nullable_to_non_nullable
as Driver?,selectedVehicle: freezed == selectedVehicle ? _self.selectedVehicle : selectedVehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,selectedWarehouse: freezed == selectedWarehouse ? _self.selectedWarehouse : selectedWarehouse // ignore: cast_nullable_to_non_nullable
as Warehouse?,selectedDeliveryPoint: freezed == selectedDeliveryPoint ? _self.selectedDeliveryPoint : selectedDeliveryPoint // ignore: cast_nullable_to_non_nullable
as DeliveryPoint?,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,cares: null == cares ? _self._cares : cares // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistributionCopyWith<$Res> get draft {
  
  return $DistributionCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverCopyWith<$Res>? get selectedDriver {
    if (_self.selectedDriver == null) {
    return null;
  }

  return $DriverCopyWith<$Res>(_self.selectedDriver!, (value) {
    return _then(_self.copyWith(selectedDriver: value));
  });
}/// Create a copy of ApplyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleCopyWith<$Res>? get selectedVehicle {
    if (_self.selectedVehicle == null) {
    return null;
  }

  return $VehicleCopyWith<$Res>(_self.selectedVehicle!, (value) {
    return _then(_self.copyWith(selectedVehicle: value));
  });
}
}

// dart format on
