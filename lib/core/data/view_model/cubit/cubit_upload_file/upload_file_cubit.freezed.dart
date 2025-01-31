// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_file_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadFileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PickedFileModel> pickedFiles) initial,
    required TResult Function(List<PickedFileModel> pickedFiles) picked,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PickedFileModel> pickedFiles)? initial,
    TResult? Function(List<PickedFileModel> pickedFiles)? picked,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PickedFileModel> pickedFiles)? initial,
    TResult Function(List<PickedFileModel> pickedFiles)? picked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Picked value)? picked,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileStateCopyWith<$Res> {
  factory $UploadFileStateCopyWith(
          UploadFileState value, $Res Function(UploadFileState) then) =
      _$UploadFileStateCopyWithImpl<$Res, UploadFileState>;
}

/// @nodoc
class _$UploadFileStateCopyWithImpl<$Res, $Val extends UploadFileState>
    implements $UploadFileStateCopyWith<$Res> {
  _$UploadFileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PickedFileModel> pickedFiles});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UploadFileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedFiles = null,
  }) {
    return _then(_$InitialImpl(
      null == pickedFiles
          ? _value._pickedFiles
          : pickedFiles // ignore: cast_nullable_to_non_nullable
              as List<PickedFileModel>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(final List<PickedFileModel> pickedFiles)
      : _pickedFiles = pickedFiles;

  final List<PickedFileModel> _pickedFiles;
  @override
  List<PickedFileModel> get pickedFiles {
    if (_pickedFiles is EqualUnmodifiableListView) return _pickedFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pickedFiles);
  }

  @override
  String toString() {
    return 'UploadFileState.initial(pickedFiles: $pickedFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._pickedFiles, _pickedFiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_pickedFiles));

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PickedFileModel> pickedFiles) initial,
    required TResult Function(List<PickedFileModel> pickedFiles) picked,
    required TResult Function(String error) error,
  }) {
    return initial(pickedFiles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PickedFileModel> pickedFiles)? initial,
    TResult? Function(List<PickedFileModel> pickedFiles)? picked,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(pickedFiles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PickedFileModel> pickedFiles)? initial,
    TResult Function(List<PickedFileModel> pickedFiles)? picked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(pickedFiles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Picked value)? picked,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UploadFileState {
  const factory _Initial(final List<PickedFileModel> pickedFiles) =
      _$InitialImpl;

  List<PickedFileModel> get pickedFiles;

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PickedImplCopyWith<$Res> {
  factory _$$PickedImplCopyWith(
          _$PickedImpl value, $Res Function(_$PickedImpl) then) =
      __$$PickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PickedFileModel> pickedFiles});
}

/// @nodoc
class __$$PickedImplCopyWithImpl<$Res>
    extends _$UploadFileStateCopyWithImpl<$Res, _$PickedImpl>
    implements _$$PickedImplCopyWith<$Res> {
  __$$PickedImplCopyWithImpl(
      _$PickedImpl _value, $Res Function(_$PickedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedFiles = null,
  }) {
    return _then(_$PickedImpl(
      null == pickedFiles
          ? _value._pickedFiles
          : pickedFiles // ignore: cast_nullable_to_non_nullable
              as List<PickedFileModel>,
    ));
  }
}

/// @nodoc

class _$PickedImpl implements _Picked {
  const _$PickedImpl(final List<PickedFileModel> pickedFiles)
      : _pickedFiles = pickedFiles;

  final List<PickedFileModel> _pickedFiles;
  @override
  List<PickedFileModel> get pickedFiles {
    if (_pickedFiles is EqualUnmodifiableListView) return _pickedFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pickedFiles);
  }

  @override
  String toString() {
    return 'UploadFileState.picked(pickedFiles: $pickedFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickedImpl &&
            const DeepCollectionEquality()
                .equals(other._pickedFiles, _pickedFiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_pickedFiles));

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickedImplCopyWith<_$PickedImpl> get copyWith =>
      __$$PickedImplCopyWithImpl<_$PickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PickedFileModel> pickedFiles) initial,
    required TResult Function(List<PickedFileModel> pickedFiles) picked,
    required TResult Function(String error) error,
  }) {
    return picked(pickedFiles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PickedFileModel> pickedFiles)? initial,
    TResult? Function(List<PickedFileModel> pickedFiles)? picked,
    TResult? Function(String error)? error,
  }) {
    return picked?.call(pickedFiles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PickedFileModel> pickedFiles)? initial,
    TResult Function(List<PickedFileModel> pickedFiles)? picked,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(pickedFiles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Picked value) picked,
    required TResult Function(_Error value) error,
  }) {
    return picked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Picked value)? picked,
    TResult? Function(_Error value)? error,
  }) {
    return picked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (picked != null) {
      return picked(this);
    }
    return orElse();
  }
}

abstract class _Picked implements UploadFileState {
  const factory _Picked(final List<PickedFileModel> pickedFiles) = _$PickedImpl;

  List<PickedFileModel> get pickedFiles;

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickedImplCopyWith<_$PickedImpl> get copyWith =>
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
    extends _$UploadFileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadFileState
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
    return 'UploadFileState.error(error: $error)';
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

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PickedFileModel> pickedFiles) initial,
    required TResult Function(List<PickedFileModel> pickedFiles) picked,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PickedFileModel> pickedFiles)? initial,
    TResult? Function(List<PickedFileModel> pickedFiles)? picked,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PickedFileModel> pickedFiles)? initial,
    TResult Function(List<PickedFileModel> pickedFiles)? picked,
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
    required TResult Function(_Picked value) picked,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Picked value)? picked,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Picked value)? picked,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UploadFileState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of UploadFileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
