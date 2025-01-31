// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_property_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddPropertyEvent {
  PropertyModel get propertyModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)
        addProperty,
    required TResult Function(PropertyModel propertyModel) setProperty,
    required TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)
        updateProperty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        addProperty,
    TResult? Function(PropertyModel propertyModel)? setProperty,
    TResult? Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        updateProperty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        addProperty,
    TResult Function(PropertyModel propertyModel)? setProperty,
    TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        updateProperty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProperty value) addProperty,
    required TResult Function(_SetProperty value) setProperty,
    required TResult Function(_UpdateProperty value) updateProperty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProperty value)? addProperty,
    TResult? Function(_SetProperty value)? setProperty,
    TResult? Function(_UpdateProperty value)? updateProperty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProperty value)? addProperty,
    TResult Function(_SetProperty value)? setProperty,
    TResult Function(_UpdateProperty value)? updateProperty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPropertyEventCopyWith<AddPropertyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPropertyEventCopyWith<$Res> {
  factory $AddPropertyEventCopyWith(
          AddPropertyEvent value, $Res Function(AddPropertyEvent) then) =
      _$AddPropertyEventCopyWithImpl<$Res, AddPropertyEvent>;
  @useResult
  $Res call({PropertyModel propertyModel});
}

/// @nodoc
class _$AddPropertyEventCopyWithImpl<$Res, $Val extends AddPropertyEvent>
    implements $AddPropertyEventCopyWith<$Res> {
  _$AddPropertyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyModel = null,
  }) {
    return _then(_value.copyWith(
      propertyModel: null == propertyModel
          ? _value.propertyModel
          : propertyModel // ignore: cast_nullable_to_non_nullable
              as PropertyModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPropertyImplCopyWith<$Res>
    implements $AddPropertyEventCopyWith<$Res> {
  factory _$$AddPropertyImplCopyWith(
          _$AddPropertyImpl value, $Res Function(_$AddPropertyImpl) then) =
      __$$AddPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PropertyModel propertyModel, List<RoomModel> roomModelList});
}

/// @nodoc
class __$$AddPropertyImplCopyWithImpl<$Res>
    extends _$AddPropertyEventCopyWithImpl<$Res, _$AddPropertyImpl>
    implements _$$AddPropertyImplCopyWith<$Res> {
  __$$AddPropertyImplCopyWithImpl(
      _$AddPropertyImpl _value, $Res Function(_$AddPropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyModel = null,
    Object? roomModelList = null,
  }) {
    return _then(_$AddPropertyImpl(
      propertyModel: null == propertyModel
          ? _value.propertyModel
          : propertyModel // ignore: cast_nullable_to_non_nullable
              as PropertyModel,
      roomModelList: null == roomModelList
          ? _value._roomModelList
          : roomModelList // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>,
    ));
  }
}

/// @nodoc

class _$AddPropertyImpl implements _AddProperty {
  const _$AddPropertyImpl(
      {required this.propertyModel,
      required final List<RoomModel> roomModelList})
      : _roomModelList = roomModelList;

  @override
  final PropertyModel propertyModel;
  final List<RoomModel> _roomModelList;
  @override
  List<RoomModel> get roomModelList {
    if (_roomModelList is EqualUnmodifiableListView) return _roomModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roomModelList);
  }

  @override
  String toString() {
    return 'AddPropertyEvent.addProperty(propertyModel: $propertyModel, roomModelList: $roomModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPropertyImpl &&
            (identical(other.propertyModel, propertyModel) ||
                other.propertyModel == propertyModel) &&
            const DeepCollectionEquality()
                .equals(other._roomModelList, _roomModelList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyModel,
      const DeepCollectionEquality().hash(_roomModelList));

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPropertyImplCopyWith<_$AddPropertyImpl> get copyWith =>
      __$$AddPropertyImplCopyWithImpl<_$AddPropertyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)
        addProperty,
    required TResult Function(PropertyModel propertyModel) setProperty,
    required TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)
        updateProperty,
  }) {
    return addProperty(propertyModel, roomModelList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        addProperty,
    TResult? Function(PropertyModel propertyModel)? setProperty,
    TResult? Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        updateProperty,
  }) {
    return addProperty?.call(propertyModel, roomModelList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        addProperty,
    TResult Function(PropertyModel propertyModel)? setProperty,
    TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        updateProperty,
    required TResult orElse(),
  }) {
    if (addProperty != null) {
      return addProperty(propertyModel, roomModelList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProperty value) addProperty,
    required TResult Function(_SetProperty value) setProperty,
    required TResult Function(_UpdateProperty value) updateProperty,
  }) {
    return addProperty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProperty value)? addProperty,
    TResult? Function(_SetProperty value)? setProperty,
    TResult? Function(_UpdateProperty value)? updateProperty,
  }) {
    return addProperty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProperty value)? addProperty,
    TResult Function(_SetProperty value)? setProperty,
    TResult Function(_UpdateProperty value)? updateProperty,
    required TResult orElse(),
  }) {
    if (addProperty != null) {
      return addProperty(this);
    }
    return orElse();
  }
}

abstract class _AddProperty implements AddPropertyEvent {
  const factory _AddProperty(
      {required final PropertyModel propertyModel,
      required final List<RoomModel> roomModelList}) = _$AddPropertyImpl;

  @override
  PropertyModel get propertyModel;
  List<RoomModel> get roomModelList;

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPropertyImplCopyWith<_$AddPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPropertyImplCopyWith<$Res>
    implements $AddPropertyEventCopyWith<$Res> {
  factory _$$SetPropertyImplCopyWith(
          _$SetPropertyImpl value, $Res Function(_$SetPropertyImpl) then) =
      __$$SetPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PropertyModel propertyModel});
}

/// @nodoc
class __$$SetPropertyImplCopyWithImpl<$Res>
    extends _$AddPropertyEventCopyWithImpl<$Res, _$SetPropertyImpl>
    implements _$$SetPropertyImplCopyWith<$Res> {
  __$$SetPropertyImplCopyWithImpl(
      _$SetPropertyImpl _value, $Res Function(_$SetPropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyModel = null,
  }) {
    return _then(_$SetPropertyImpl(
      propertyModel: null == propertyModel
          ? _value.propertyModel
          : propertyModel // ignore: cast_nullable_to_non_nullable
              as PropertyModel,
    ));
  }
}

/// @nodoc

class _$SetPropertyImpl implements _SetProperty {
  const _$SetPropertyImpl({required this.propertyModel});

  @override
  final PropertyModel propertyModel;

  @override
  String toString() {
    return 'AddPropertyEvent.setProperty(propertyModel: $propertyModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPropertyImpl &&
            (identical(other.propertyModel, propertyModel) ||
                other.propertyModel == propertyModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyModel);

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPropertyImplCopyWith<_$SetPropertyImpl> get copyWith =>
      __$$SetPropertyImplCopyWithImpl<_$SetPropertyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)
        addProperty,
    required TResult Function(PropertyModel propertyModel) setProperty,
    required TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)
        updateProperty,
  }) {
    return setProperty(propertyModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        addProperty,
    TResult? Function(PropertyModel propertyModel)? setProperty,
    TResult? Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        updateProperty,
  }) {
    return setProperty?.call(propertyModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        addProperty,
    TResult Function(PropertyModel propertyModel)? setProperty,
    TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        updateProperty,
    required TResult orElse(),
  }) {
    if (setProperty != null) {
      return setProperty(propertyModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProperty value) addProperty,
    required TResult Function(_SetProperty value) setProperty,
    required TResult Function(_UpdateProperty value) updateProperty,
  }) {
    return setProperty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProperty value)? addProperty,
    TResult? Function(_SetProperty value)? setProperty,
    TResult? Function(_UpdateProperty value)? updateProperty,
  }) {
    return setProperty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProperty value)? addProperty,
    TResult Function(_SetProperty value)? setProperty,
    TResult Function(_UpdateProperty value)? updateProperty,
    required TResult orElse(),
  }) {
    if (setProperty != null) {
      return setProperty(this);
    }
    return orElse();
  }
}

abstract class _SetProperty implements AddPropertyEvent {
  const factory _SetProperty({required final PropertyModel propertyModel}) =
      _$SetPropertyImpl;

  @override
  PropertyModel get propertyModel;

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetPropertyImplCopyWith<_$SetPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePropertyImplCopyWith<$Res>
    implements $AddPropertyEventCopyWith<$Res> {
  factory _$$UpdatePropertyImplCopyWith(_$UpdatePropertyImpl value,
          $Res Function(_$UpdatePropertyImpl) then) =
      __$$UpdatePropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PropertyModel propertyModel, List<RoomModel> roomModelList});
}

/// @nodoc
class __$$UpdatePropertyImplCopyWithImpl<$Res>
    extends _$AddPropertyEventCopyWithImpl<$Res, _$UpdatePropertyImpl>
    implements _$$UpdatePropertyImplCopyWith<$Res> {
  __$$UpdatePropertyImplCopyWithImpl(
      _$UpdatePropertyImpl _value, $Res Function(_$UpdatePropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyModel = null,
    Object? roomModelList = null,
  }) {
    return _then(_$UpdatePropertyImpl(
      propertyModel: null == propertyModel
          ? _value.propertyModel
          : propertyModel // ignore: cast_nullable_to_non_nullable
              as PropertyModel,
      roomModelList: null == roomModelList
          ? _value._roomModelList
          : roomModelList // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>,
    ));
  }
}

/// @nodoc

class _$UpdatePropertyImpl implements _UpdateProperty {
  const _$UpdatePropertyImpl(
      {required this.propertyModel,
      required final List<RoomModel> roomModelList})
      : _roomModelList = roomModelList;

  @override
  final PropertyModel propertyModel;
  final List<RoomModel> _roomModelList;
  @override
  List<RoomModel> get roomModelList {
    if (_roomModelList is EqualUnmodifiableListView) return _roomModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roomModelList);
  }

  @override
  String toString() {
    return 'AddPropertyEvent.updateProperty(propertyModel: $propertyModel, roomModelList: $roomModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePropertyImpl &&
            (identical(other.propertyModel, propertyModel) ||
                other.propertyModel == propertyModel) &&
            const DeepCollectionEquality()
                .equals(other._roomModelList, _roomModelList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyModel,
      const DeepCollectionEquality().hash(_roomModelList));

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePropertyImplCopyWith<_$UpdatePropertyImpl> get copyWith =>
      __$$UpdatePropertyImplCopyWithImpl<_$UpdatePropertyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)
        addProperty,
    required TResult Function(PropertyModel propertyModel) setProperty,
    required TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)
        updateProperty,
  }) {
    return updateProperty(propertyModel, roomModelList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        addProperty,
    TResult? Function(PropertyModel propertyModel)? setProperty,
    TResult? Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        updateProperty,
  }) {
    return updateProperty?.call(propertyModel, roomModelList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        addProperty,
    TResult Function(PropertyModel propertyModel)? setProperty,
    TResult Function(
            PropertyModel propertyModel, List<RoomModel> roomModelList)?
        updateProperty,
    required TResult orElse(),
  }) {
    if (updateProperty != null) {
      return updateProperty(propertyModel, roomModelList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProperty value) addProperty,
    required TResult Function(_SetProperty value) setProperty,
    required TResult Function(_UpdateProperty value) updateProperty,
  }) {
    return updateProperty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProperty value)? addProperty,
    TResult? Function(_SetProperty value)? setProperty,
    TResult? Function(_UpdateProperty value)? updateProperty,
  }) {
    return updateProperty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProperty value)? addProperty,
    TResult Function(_SetProperty value)? setProperty,
    TResult Function(_UpdateProperty value)? updateProperty,
    required TResult orElse(),
  }) {
    if (updateProperty != null) {
      return updateProperty(this);
    }
    return orElse();
  }
}

abstract class _UpdateProperty implements AddPropertyEvent {
  const factory _UpdateProperty(
      {required final PropertyModel propertyModel,
      required final List<RoomModel> roomModelList}) = _$UpdatePropertyImpl;

  @override
  PropertyModel get propertyModel;
  List<RoomModel> get roomModelList;

  /// Create a copy of AddPropertyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePropertyImplCopyWith<_$UpdatePropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddPropertyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPropertyStateCopyWith<$Res> {
  factory $AddPropertyStateCopyWith(
          AddPropertyState value, $Res Function(AddPropertyState) then) =
      _$AddPropertyStateCopyWithImpl<$Res, AddPropertyState>;
}

/// @nodoc
class _$AddPropertyStateCopyWithImpl<$Res, $Val extends AddPropertyState>
    implements $AddPropertyStateCopyWith<$Res> {
  _$AddPropertyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPropertyState
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
    extends _$AddPropertyStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPropertyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AddPropertyState.initial()';
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
    required TResult Function() added,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? loading,
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
    required TResult Function(_Added value) added,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddPropertyState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddedImplCopyWith<$Res> {
  factory _$$AddedImplCopyWith(
          _$AddedImpl value, $Res Function(_$AddedImpl) then) =
      __$$AddedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddedImplCopyWithImpl<$Res>
    extends _$AddPropertyStateCopyWithImpl<$Res, _$AddedImpl>
    implements _$$AddedImplCopyWith<$Res> {
  __$$AddedImplCopyWithImpl(
      _$AddedImpl _value, $Res Function(_$AddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPropertyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddedImpl implements _Added {
  const _$AddedImpl();

  @override
  String toString() {
    return 'AddPropertyState.added()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return added();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return added?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _Added implements AddPropertyState {
  const factory _Added() = _$AddedImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AddPropertyStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPropertyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AddPropertyState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? loading,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AddPropertyState {
  const factory _Loading() = _$LoadingImpl;
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
    extends _$AddPropertyStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPropertyState
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
    return 'AddPropertyState.error(error: $error)';
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

  /// Create a copy of AddPropertyState
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
    required TResult Function() added,
    required TResult Function() loading,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? loading,
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
    required TResult Function(_Added value) added,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AddPropertyState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of AddPropertyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
