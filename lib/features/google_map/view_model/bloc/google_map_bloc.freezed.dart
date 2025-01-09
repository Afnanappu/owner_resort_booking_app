// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoogleMapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitialized,
    required TResult Function(LatLng selectedLocation) selectLocation,
    required TResult Function(LatLng? selectedLocation) confirmLocation,
    required TResult Function() clearSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? mapInitialized,
    TResult? Function(LatLng selectedLocation)? selectLocation,
    TResult? Function(LatLng? selectedLocation)? confirmLocation,
    TResult? Function()? clearSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitialized,
    TResult Function(LatLng selectedLocation)? selectLocation,
    TResult Function(LatLng? selectedLocation)? confirmLocation,
    TResult Function()? clearSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MapInitialized value) mapInitialized,
    required TResult Function(_SelectLocation value) selectLocation,
    required TResult Function(_ConfirmLocation value) confirmLocation,
    required TResult Function(_ClearSelection value) clearSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MapInitialized value)? mapInitialized,
    TResult? Function(_SelectLocation value)? selectLocation,
    TResult? Function(_ConfirmLocation value)? confirmLocation,
    TResult? Function(_ClearSelection value)? clearSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MapInitialized value)? mapInitialized,
    TResult Function(_SelectLocation value)? selectLocation,
    TResult Function(_ConfirmLocation value)? confirmLocation,
    TResult Function(_ClearSelection value)? clearSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleMapEventCopyWith<$Res> {
  factory $GoogleMapEventCopyWith(
          GoogleMapEvent value, $Res Function(GoogleMapEvent) then) =
      _$GoogleMapEventCopyWithImpl<$Res, GoogleMapEvent>;
}

/// @nodoc
class _$GoogleMapEventCopyWithImpl<$Res, $Val extends GoogleMapEvent>
    implements $GoogleMapEventCopyWith<$Res> {
  _$GoogleMapEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MapInitializedImplCopyWith<$Res> {
  factory _$$MapInitializedImplCopyWith(_$MapInitializedImpl value,
          $Res Function(_$MapInitializedImpl) then) =
      __$$MapInitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapInitializedImplCopyWithImpl<$Res>
    extends _$GoogleMapEventCopyWithImpl<$Res, _$MapInitializedImpl>
    implements _$$MapInitializedImplCopyWith<$Res> {
  __$$MapInitializedImplCopyWithImpl(
      _$MapInitializedImpl _value, $Res Function(_$MapInitializedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MapInitializedImpl implements _MapInitialized {
  const _$MapInitializedImpl();

  @override
  String toString() {
    return 'GoogleMapEvent.mapInitialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapInitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitialized,
    required TResult Function(LatLng selectedLocation) selectLocation,
    required TResult Function(LatLng? selectedLocation) confirmLocation,
    required TResult Function() clearSelection,
  }) {
    return mapInitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? mapInitialized,
    TResult? Function(LatLng selectedLocation)? selectLocation,
    TResult? Function(LatLng? selectedLocation)? confirmLocation,
    TResult? Function()? clearSelection,
  }) {
    return mapInitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitialized,
    TResult Function(LatLng selectedLocation)? selectLocation,
    TResult Function(LatLng? selectedLocation)? confirmLocation,
    TResult Function()? clearSelection,
    required TResult orElse(),
  }) {
    if (mapInitialized != null) {
      return mapInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MapInitialized value) mapInitialized,
    required TResult Function(_SelectLocation value) selectLocation,
    required TResult Function(_ConfirmLocation value) confirmLocation,
    required TResult Function(_ClearSelection value) clearSelection,
  }) {
    return mapInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MapInitialized value)? mapInitialized,
    TResult? Function(_SelectLocation value)? selectLocation,
    TResult? Function(_ConfirmLocation value)? confirmLocation,
    TResult? Function(_ClearSelection value)? clearSelection,
  }) {
    return mapInitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MapInitialized value)? mapInitialized,
    TResult Function(_SelectLocation value)? selectLocation,
    TResult Function(_ConfirmLocation value)? confirmLocation,
    TResult Function(_ClearSelection value)? clearSelection,
    required TResult orElse(),
  }) {
    if (mapInitialized != null) {
      return mapInitialized(this);
    }
    return orElse();
  }
}

abstract class _MapInitialized implements GoogleMapEvent {
  const factory _MapInitialized() = _$MapInitializedImpl;
}

/// @nodoc
abstract class _$$SelectLocationImplCopyWith<$Res> {
  factory _$$SelectLocationImplCopyWith(_$SelectLocationImpl value,
          $Res Function(_$SelectLocationImpl) then) =
      __$$SelectLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng selectedLocation});
}

/// @nodoc
class __$$SelectLocationImplCopyWithImpl<$Res>
    extends _$GoogleMapEventCopyWithImpl<$Res, _$SelectLocationImpl>
    implements _$$SelectLocationImplCopyWith<$Res> {
  __$$SelectLocationImplCopyWithImpl(
      _$SelectLocationImpl _value, $Res Function(_$SelectLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLocation = null,
  }) {
    return _then(_$SelectLocationImpl(
      null == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$SelectLocationImpl implements _SelectLocation {
  const _$SelectLocationImpl(this.selectedLocation);

  @override
  final LatLng selectedLocation;

  @override
  String toString() {
    return 'GoogleMapEvent.selectLocation(selectedLocation: $selectedLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLocationImpl &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLocation);

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLocationImplCopyWith<_$SelectLocationImpl> get copyWith =>
      __$$SelectLocationImplCopyWithImpl<_$SelectLocationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitialized,
    required TResult Function(LatLng selectedLocation) selectLocation,
    required TResult Function(LatLng? selectedLocation) confirmLocation,
    required TResult Function() clearSelection,
  }) {
    return selectLocation(selectedLocation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? mapInitialized,
    TResult? Function(LatLng selectedLocation)? selectLocation,
    TResult? Function(LatLng? selectedLocation)? confirmLocation,
    TResult? Function()? clearSelection,
  }) {
    return selectLocation?.call(selectedLocation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitialized,
    TResult Function(LatLng selectedLocation)? selectLocation,
    TResult Function(LatLng? selectedLocation)? confirmLocation,
    TResult Function()? clearSelection,
    required TResult orElse(),
  }) {
    if (selectLocation != null) {
      return selectLocation(selectedLocation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MapInitialized value) mapInitialized,
    required TResult Function(_SelectLocation value) selectLocation,
    required TResult Function(_ConfirmLocation value) confirmLocation,
    required TResult Function(_ClearSelection value) clearSelection,
  }) {
    return selectLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MapInitialized value)? mapInitialized,
    TResult? Function(_SelectLocation value)? selectLocation,
    TResult? Function(_ConfirmLocation value)? confirmLocation,
    TResult? Function(_ClearSelection value)? clearSelection,
  }) {
    return selectLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MapInitialized value)? mapInitialized,
    TResult Function(_SelectLocation value)? selectLocation,
    TResult Function(_ConfirmLocation value)? confirmLocation,
    TResult Function(_ClearSelection value)? clearSelection,
    required TResult orElse(),
  }) {
    if (selectLocation != null) {
      return selectLocation(this);
    }
    return orElse();
  }
}

abstract class _SelectLocation implements GoogleMapEvent {
  const factory _SelectLocation(final LatLng selectedLocation) =
      _$SelectLocationImpl;

  LatLng get selectedLocation;

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectLocationImplCopyWith<_$SelectLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmLocationImplCopyWith<$Res> {
  factory _$$ConfirmLocationImplCopyWith(_$ConfirmLocationImpl value,
          $Res Function(_$ConfirmLocationImpl) then) =
      __$$ConfirmLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng? selectedLocation});
}

/// @nodoc
class __$$ConfirmLocationImplCopyWithImpl<$Res>
    extends _$GoogleMapEventCopyWithImpl<$Res, _$ConfirmLocationImpl>
    implements _$$ConfirmLocationImplCopyWith<$Res> {
  __$$ConfirmLocationImplCopyWithImpl(
      _$ConfirmLocationImpl _value, $Res Function(_$ConfirmLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLocation = freezed,
  }) {
    return _then(_$ConfirmLocationImpl(
      freezed == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$ConfirmLocationImpl implements _ConfirmLocation {
  const _$ConfirmLocationImpl(this.selectedLocation);

  @override
  final LatLng? selectedLocation;

  @override
  String toString() {
    return 'GoogleMapEvent.confirmLocation(selectedLocation: $selectedLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmLocationImpl &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLocation);

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmLocationImplCopyWith<_$ConfirmLocationImpl> get copyWith =>
      __$$ConfirmLocationImplCopyWithImpl<_$ConfirmLocationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitialized,
    required TResult Function(LatLng selectedLocation) selectLocation,
    required TResult Function(LatLng? selectedLocation) confirmLocation,
    required TResult Function() clearSelection,
  }) {
    return confirmLocation(selectedLocation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? mapInitialized,
    TResult? Function(LatLng selectedLocation)? selectLocation,
    TResult? Function(LatLng? selectedLocation)? confirmLocation,
    TResult? Function()? clearSelection,
  }) {
    return confirmLocation?.call(selectedLocation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitialized,
    TResult Function(LatLng selectedLocation)? selectLocation,
    TResult Function(LatLng? selectedLocation)? confirmLocation,
    TResult Function()? clearSelection,
    required TResult orElse(),
  }) {
    if (confirmLocation != null) {
      return confirmLocation(selectedLocation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MapInitialized value) mapInitialized,
    required TResult Function(_SelectLocation value) selectLocation,
    required TResult Function(_ConfirmLocation value) confirmLocation,
    required TResult Function(_ClearSelection value) clearSelection,
  }) {
    return confirmLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MapInitialized value)? mapInitialized,
    TResult? Function(_SelectLocation value)? selectLocation,
    TResult? Function(_ConfirmLocation value)? confirmLocation,
    TResult? Function(_ClearSelection value)? clearSelection,
  }) {
    return confirmLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MapInitialized value)? mapInitialized,
    TResult Function(_SelectLocation value)? selectLocation,
    TResult Function(_ConfirmLocation value)? confirmLocation,
    TResult Function(_ClearSelection value)? clearSelection,
    required TResult orElse(),
  }) {
    if (confirmLocation != null) {
      return confirmLocation(this);
    }
    return orElse();
  }
}

abstract class _ConfirmLocation implements GoogleMapEvent {
  const factory _ConfirmLocation(final LatLng? selectedLocation) =
      _$ConfirmLocationImpl;

  LatLng? get selectedLocation;

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmLocationImplCopyWith<_$ConfirmLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSelectionImplCopyWith<$Res> {
  factory _$$ClearSelectionImplCopyWith(_$ClearSelectionImpl value,
          $Res Function(_$ClearSelectionImpl) then) =
      __$$ClearSelectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSelectionImplCopyWithImpl<$Res>
    extends _$GoogleMapEventCopyWithImpl<$Res, _$ClearSelectionImpl>
    implements _$$ClearSelectionImplCopyWith<$Res> {
  __$$ClearSelectionImplCopyWithImpl(
      _$ClearSelectionImpl _value, $Res Function(_$ClearSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSelectionImpl implements _ClearSelection {
  const _$ClearSelectionImpl();

  @override
  String toString() {
    return 'GoogleMapEvent.clearSelection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSelectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitialized,
    required TResult Function(LatLng selectedLocation) selectLocation,
    required TResult Function(LatLng? selectedLocation) confirmLocation,
    required TResult Function() clearSelection,
  }) {
    return clearSelection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? mapInitialized,
    TResult? Function(LatLng selectedLocation)? selectLocation,
    TResult? Function(LatLng? selectedLocation)? confirmLocation,
    TResult? Function()? clearSelection,
  }) {
    return clearSelection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitialized,
    TResult Function(LatLng selectedLocation)? selectLocation,
    TResult Function(LatLng? selectedLocation)? confirmLocation,
    TResult Function()? clearSelection,
    required TResult orElse(),
  }) {
    if (clearSelection != null) {
      return clearSelection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MapInitialized value) mapInitialized,
    required TResult Function(_SelectLocation value) selectLocation,
    required TResult Function(_ConfirmLocation value) confirmLocation,
    required TResult Function(_ClearSelection value) clearSelection,
  }) {
    return clearSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MapInitialized value)? mapInitialized,
    TResult? Function(_SelectLocation value)? selectLocation,
    TResult? Function(_ConfirmLocation value)? confirmLocation,
    TResult? Function(_ClearSelection value)? clearSelection,
  }) {
    return clearSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MapInitialized value)? mapInitialized,
    TResult Function(_SelectLocation value)? selectLocation,
    TResult Function(_ConfirmLocation value)? confirmLocation,
    TResult Function(_ClearSelection value)? clearSelection,
    required TResult orElse(),
  }) {
    if (clearSelection != null) {
      return clearSelection(this);
    }
    return orElse();
  }
}

abstract class _ClearSelection implements GoogleMapEvent {
  const factory _ClearSelection() = _$ClearSelectionImpl;
}

/// @nodoc
mixin _$GoogleMapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)
        mapLoaded,
    required TResult Function(LatLng selectedLocation) locationSelected,
    required TResult Function(LocationModel confirmedLocation)
        locationConfirmed,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult? Function(LatLng selectedLocation)? locationSelected,
    TResult? Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult Function(LatLng selectedLocation)? locationSelected,
    TResult Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_MapLoaded value) mapLoaded,
    required TResult Function(_LocationSelected value) locationSelected,
    required TResult Function(_LocationConfirmed value) locationConfirmed,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_MapLoaded value)? mapLoaded,
    TResult? Function(_LocationSelected value)? locationSelected,
    TResult? Function(_LocationConfirmed value)? locationConfirmed,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_MapLoaded value)? mapLoaded,
    TResult Function(_LocationSelected value)? locationSelected,
    TResult Function(_LocationConfirmed value)? locationConfirmed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleMapStateCopyWith<$Res> {
  factory $GoogleMapStateCopyWith(
          GoogleMapState value, $Res Function(GoogleMapState) then) =
      _$GoogleMapStateCopyWithImpl<$Res, GoogleMapState>;
}

/// @nodoc
class _$GoogleMapStateCopyWithImpl<$Res, $Val extends GoogleMapState>
    implements $GoogleMapStateCopyWith<$Res> {
  _$GoogleMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GoogleMapState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)
        mapLoaded,
    required TResult Function(LatLng selectedLocation) locationSelected,
    required TResult Function(LocationModel confirmedLocation)
        locationConfirmed,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult? Function(LatLng selectedLocation)? locationSelected,
    TResult? Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult Function(LatLng selectedLocation)? locationSelected,
    TResult Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_MapLoaded value) mapLoaded,
    required TResult Function(_LocationSelected value) locationSelected,
    required TResult Function(_LocationConfirmed value) locationConfirmed,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_MapLoaded value)? mapLoaded,
    TResult? Function(_LocationSelected value)? locationSelected,
    TResult? Function(_LocationConfirmed value)? locationConfirmed,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_MapLoaded value)? mapLoaded,
    TResult Function(_LocationSelected value)? locationSelected,
    TResult Function(_LocationConfirmed value)? locationConfirmed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GoogleMapState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$MapLoadedImplCopyWith<$Res> {
  factory _$$MapLoadedImplCopyWith(
          _$MapLoadedImpl value, $Res Function(_$MapLoadedImpl) then) =
      __$$MapLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraPosition cameraPosition, Set<Marker> selectedMarker});
}

/// @nodoc
class __$$MapLoadedImplCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res, _$MapLoadedImpl>
    implements _$$MapLoadedImplCopyWith<$Res> {
  __$$MapLoadedImplCopyWithImpl(
      _$MapLoadedImpl _value, $Res Function(_$MapLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraPosition = null,
    Object? selectedMarker = null,
  }) {
    return _then(_$MapLoadedImpl(
      cameraPosition: null == cameraPosition
          ? _value.cameraPosition
          : cameraPosition // ignore: cast_nullable_to_non_nullable
              as CameraPosition,
      selectedMarker: null == selectedMarker
          ? _value._selectedMarker
          : selectedMarker // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ));
  }
}

/// @nodoc

class _$MapLoadedImpl implements _MapLoaded {
  const _$MapLoadedImpl(
      {required this.cameraPosition, required final Set<Marker> selectedMarker})
      : _selectedMarker = selectedMarker;

  @override
  final CameraPosition cameraPosition;
  final Set<Marker> _selectedMarker;
  @override
  Set<Marker> get selectedMarker {
    if (_selectedMarker is EqualUnmodifiableSetView) return _selectedMarker;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedMarker);
  }

  @override
  String toString() {
    return 'GoogleMapState.mapLoaded(cameraPosition: $cameraPosition, selectedMarker: $selectedMarker)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapLoadedImpl &&
            (identical(other.cameraPosition, cameraPosition) ||
                other.cameraPosition == cameraPosition) &&
            const DeepCollectionEquality()
                .equals(other._selectedMarker, _selectedMarker));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraPosition,
      const DeepCollectionEquality().hash(_selectedMarker));

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapLoadedImplCopyWith<_$MapLoadedImpl> get copyWith =>
      __$$MapLoadedImplCopyWithImpl<_$MapLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)
        mapLoaded,
    required TResult Function(LatLng selectedLocation) locationSelected,
    required TResult Function(LocationModel confirmedLocation)
        locationConfirmed,
    required TResult Function(String error) error,
  }) {
    return mapLoaded(cameraPosition, selectedMarker);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult? Function(LatLng selectedLocation)? locationSelected,
    TResult? Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult? Function(String error)? error,
  }) {
    return mapLoaded?.call(cameraPosition, selectedMarker);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult Function(LatLng selectedLocation)? locationSelected,
    TResult Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (mapLoaded != null) {
      return mapLoaded(cameraPosition, selectedMarker);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_MapLoaded value) mapLoaded,
    required TResult Function(_LocationSelected value) locationSelected,
    required TResult Function(_LocationConfirmed value) locationConfirmed,
    required TResult Function(_Error value) error,
  }) {
    return mapLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_MapLoaded value)? mapLoaded,
    TResult? Function(_LocationSelected value)? locationSelected,
    TResult? Function(_LocationConfirmed value)? locationConfirmed,
    TResult? Function(_Error value)? error,
  }) {
    return mapLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_MapLoaded value)? mapLoaded,
    TResult Function(_LocationSelected value)? locationSelected,
    TResult Function(_LocationConfirmed value)? locationConfirmed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (mapLoaded != null) {
      return mapLoaded(this);
    }
    return orElse();
  }
}

abstract class _MapLoaded implements GoogleMapState {
  const factory _MapLoaded(
      {required final CameraPosition cameraPosition,
      required final Set<Marker> selectedMarker}) = _$MapLoadedImpl;

  CameraPosition get cameraPosition;
  Set<Marker> get selectedMarker;

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapLoadedImplCopyWith<_$MapLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationSelectedImplCopyWith<$Res> {
  factory _$$LocationSelectedImplCopyWith(_$LocationSelectedImpl value,
          $Res Function(_$LocationSelectedImpl) then) =
      __$$LocationSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng selectedLocation});
}

/// @nodoc
class __$$LocationSelectedImplCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res, _$LocationSelectedImpl>
    implements _$$LocationSelectedImplCopyWith<$Res> {
  __$$LocationSelectedImplCopyWithImpl(_$LocationSelectedImpl _value,
      $Res Function(_$LocationSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLocation = null,
  }) {
    return _then(_$LocationSelectedImpl(
      selectedLocation: null == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$LocationSelectedImpl implements _LocationSelected {
  const _$LocationSelectedImpl({required this.selectedLocation});

  @override
  final LatLng selectedLocation;

  @override
  String toString() {
    return 'GoogleMapState.locationSelected(selectedLocation: $selectedLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationSelectedImpl &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLocation);

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationSelectedImplCopyWith<_$LocationSelectedImpl> get copyWith =>
      __$$LocationSelectedImplCopyWithImpl<_$LocationSelectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)
        mapLoaded,
    required TResult Function(LatLng selectedLocation) locationSelected,
    required TResult Function(LocationModel confirmedLocation)
        locationConfirmed,
    required TResult Function(String error) error,
  }) {
    return locationSelected(selectedLocation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult? Function(LatLng selectedLocation)? locationSelected,
    TResult? Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult? Function(String error)? error,
  }) {
    return locationSelected?.call(selectedLocation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult Function(LatLng selectedLocation)? locationSelected,
    TResult Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (locationSelected != null) {
      return locationSelected(selectedLocation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_MapLoaded value) mapLoaded,
    required TResult Function(_LocationSelected value) locationSelected,
    required TResult Function(_LocationConfirmed value) locationConfirmed,
    required TResult Function(_Error value) error,
  }) {
    return locationSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_MapLoaded value)? mapLoaded,
    TResult? Function(_LocationSelected value)? locationSelected,
    TResult? Function(_LocationConfirmed value)? locationConfirmed,
    TResult? Function(_Error value)? error,
  }) {
    return locationSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_MapLoaded value)? mapLoaded,
    TResult Function(_LocationSelected value)? locationSelected,
    TResult Function(_LocationConfirmed value)? locationConfirmed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (locationSelected != null) {
      return locationSelected(this);
    }
    return orElse();
  }
}

abstract class _LocationSelected implements GoogleMapState {
  const factory _LocationSelected({required final LatLng selectedLocation}) =
      _$LocationSelectedImpl;

  LatLng get selectedLocation;

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationSelectedImplCopyWith<_$LocationSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationConfirmedImplCopyWith<$Res> {
  factory _$$LocationConfirmedImplCopyWith(_$LocationConfirmedImpl value,
          $Res Function(_$LocationConfirmedImpl) then) =
      __$$LocationConfirmedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocationModel confirmedLocation});
}

/// @nodoc
class __$$LocationConfirmedImplCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res, _$LocationConfirmedImpl>
    implements _$$LocationConfirmedImplCopyWith<$Res> {
  __$$LocationConfirmedImplCopyWithImpl(_$LocationConfirmedImpl _value,
      $Res Function(_$LocationConfirmedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmedLocation = null,
  }) {
    return _then(_$LocationConfirmedImpl(
      confirmedLocation: null == confirmedLocation
          ? _value.confirmedLocation
          : confirmedLocation // ignore: cast_nullable_to_non_nullable
              as LocationModel,
    ));
  }
}

/// @nodoc

class _$LocationConfirmedImpl implements _LocationConfirmed {
  const _$LocationConfirmedImpl({required this.confirmedLocation});

  @override
  final LocationModel confirmedLocation;

  @override
  String toString() {
    return 'GoogleMapState.locationConfirmed(confirmedLocation: $confirmedLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationConfirmedImpl &&
            (identical(other.confirmedLocation, confirmedLocation) ||
                other.confirmedLocation == confirmedLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confirmedLocation);

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationConfirmedImplCopyWith<_$LocationConfirmedImpl> get copyWith =>
      __$$LocationConfirmedImplCopyWithImpl<_$LocationConfirmedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)
        mapLoaded,
    required TResult Function(LatLng selectedLocation) locationSelected,
    required TResult Function(LocationModel confirmedLocation)
        locationConfirmed,
    required TResult Function(String error) error,
  }) {
    return locationConfirmed(confirmedLocation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult? Function(LatLng selectedLocation)? locationSelected,
    TResult? Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult? Function(String error)? error,
  }) {
    return locationConfirmed?.call(confirmedLocation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult Function(LatLng selectedLocation)? locationSelected,
    TResult Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (locationConfirmed != null) {
      return locationConfirmed(confirmedLocation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_MapLoaded value) mapLoaded,
    required TResult Function(_LocationSelected value) locationSelected,
    required TResult Function(_LocationConfirmed value) locationConfirmed,
    required TResult Function(_Error value) error,
  }) {
    return locationConfirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_MapLoaded value)? mapLoaded,
    TResult? Function(_LocationSelected value)? locationSelected,
    TResult? Function(_LocationConfirmed value)? locationConfirmed,
    TResult? Function(_Error value)? error,
  }) {
    return locationConfirmed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_MapLoaded value)? mapLoaded,
    TResult Function(_LocationSelected value)? locationSelected,
    TResult Function(_LocationConfirmed value)? locationConfirmed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (locationConfirmed != null) {
      return locationConfirmed(this);
    }
    return orElse();
  }
}

abstract class _LocationConfirmed implements GoogleMapState {
  const factory _LocationConfirmed(
          {required final LocationModel confirmedLocation}) =
      _$LocationConfirmedImpl;

  LocationModel get confirmedLocation;

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationConfirmedImplCopyWith<_$LocationConfirmedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GoogleMapState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)
        mapLoaded,
    required TResult Function(LatLng selectedLocation) locationSelected,
    required TResult Function(LocationModel confirmedLocation)
        locationConfirmed,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult? Function(LatLng selectedLocation)? locationSelected,
    TResult? Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CameraPosition cameraPosition, Set<Marker> selectedMarker)?
        mapLoaded,
    TResult Function(LatLng selectedLocation)? locationSelected,
    TResult Function(LocationModel confirmedLocation)? locationConfirmed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_MapLoaded value) mapLoaded,
    required TResult Function(_LocationSelected value) locationSelected,
    required TResult Function(_LocationConfirmed value) locationConfirmed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_MapLoaded value)? mapLoaded,
    TResult? Function(_LocationSelected value)? locationSelected,
    TResult? Function(_LocationConfirmed value)? locationConfirmed,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_MapLoaded value)? mapLoaded,
    TResult Function(_LocationSelected value)? locationSelected,
    TResult Function(_LocationConfirmed value)? locationConfirmed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GoogleMapState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of GoogleMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
