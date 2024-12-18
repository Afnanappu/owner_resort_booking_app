// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String ownerId) loginWithEmailAndId,
    required TResult Function() loginWithGoogle,
    required TResult Function(UserModel user) register,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String ownerId)? loginWithEmailAndId,
    TResult? Function()? loginWithGoogle,
    TResult? Function(UserModel user)? register,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String ownerId)? loginWithEmailAndId,
    TResult Function()? loginWithGoogle,
    TResult Function(UserModel user)? register,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithEmailAndId value) loginWithEmailAndId,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithEmailAndId value)? loginWithEmailAndId,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithEmailAndId value)? loginWithEmailAndId,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginWithEmailAndIdImplCopyWith<$Res> {
  factory _$$LoginWithEmailAndIdImplCopyWith(_$LoginWithEmailAndIdImpl value,
          $Res Function(_$LoginWithEmailAndIdImpl) then) =
      __$$LoginWithEmailAndIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String ownerId});
}

/// @nodoc
class __$$LoginWithEmailAndIdImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginWithEmailAndIdImpl>
    implements _$$LoginWithEmailAndIdImplCopyWith<$Res> {
  __$$LoginWithEmailAndIdImplCopyWithImpl(_$LoginWithEmailAndIdImpl _value,
      $Res Function(_$LoginWithEmailAndIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? ownerId = null,
  }) {
    return _then(_$LoginWithEmailAndIdImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginWithEmailAndIdImpl implements _LoginWithEmailAndId {
  const _$LoginWithEmailAndIdImpl(this.email, this.ownerId);

  @override
  final String email;
  @override
  final String ownerId;

  @override
  String toString() {
    return 'AuthEvent.loginWithEmailAndId(email: $email, ownerId: $ownerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithEmailAndIdImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, ownerId);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithEmailAndIdImplCopyWith<_$LoginWithEmailAndIdImpl> get copyWith =>
      __$$LoginWithEmailAndIdImplCopyWithImpl<_$LoginWithEmailAndIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String ownerId) loginWithEmailAndId,
    required TResult Function() loginWithGoogle,
    required TResult Function(UserModel user) register,
  }) {
    return loginWithEmailAndId(email, ownerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String ownerId)? loginWithEmailAndId,
    TResult? Function()? loginWithGoogle,
    TResult? Function(UserModel user)? register,
  }) {
    return loginWithEmailAndId?.call(email, ownerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String ownerId)? loginWithEmailAndId,
    TResult Function()? loginWithGoogle,
    TResult Function(UserModel user)? register,
    required TResult orElse(),
  }) {
    if (loginWithEmailAndId != null) {
      return loginWithEmailAndId(email, ownerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithEmailAndId value) loginWithEmailAndId,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
  }) {
    return loginWithEmailAndId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithEmailAndId value)? loginWithEmailAndId,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
  }) {
    return loginWithEmailAndId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithEmailAndId value)? loginWithEmailAndId,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    required TResult orElse(),
  }) {
    if (loginWithEmailAndId != null) {
      return loginWithEmailAndId(this);
    }
    return orElse();
  }
}

abstract class _LoginWithEmailAndId implements AuthEvent {
  const factory _LoginWithEmailAndId(final String email, final String ownerId) =
      _$LoginWithEmailAndIdImpl;

  String get email;
  String get ownerId;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithEmailAndIdImplCopyWith<_$LoginWithEmailAndIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithGoogleImplCopyWith<$Res> {
  factory _$$LoginWithGoogleImplCopyWith(_$LoginWithGoogleImpl value,
          $Res Function(_$LoginWithGoogleImpl) then) =
      __$$LoginWithGoogleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginWithGoogleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginWithGoogleImpl>
    implements _$$LoginWithGoogleImplCopyWith<$Res> {
  __$$LoginWithGoogleImplCopyWithImpl(
      _$LoginWithGoogleImpl _value, $Res Function(_$LoginWithGoogleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginWithGoogleImpl implements _LoginWithGoogle {
  const _$LoginWithGoogleImpl();

  @override
  String toString() {
    return 'AuthEvent.loginWithGoogle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginWithGoogleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String ownerId) loginWithEmailAndId,
    required TResult Function() loginWithGoogle,
    required TResult Function(UserModel user) register,
  }) {
    return loginWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String ownerId)? loginWithEmailAndId,
    TResult? Function()? loginWithGoogle,
    TResult? Function(UserModel user)? register,
  }) {
    return loginWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String ownerId)? loginWithEmailAndId,
    TResult Function()? loginWithGoogle,
    TResult Function(UserModel user)? register,
    required TResult orElse(),
  }) {
    if (loginWithGoogle != null) {
      return loginWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithEmailAndId value) loginWithEmailAndId,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
  }) {
    return loginWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithEmailAndId value)? loginWithEmailAndId,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
  }) {
    return loginWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithEmailAndId value)? loginWithEmailAndId,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    required TResult orElse(),
  }) {
    if (loginWithGoogle != null) {
      return loginWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _LoginWithGoogle implements AuthEvent {
  const factory _LoginWithGoogle() = _$LoginWithGoogleImpl;
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
          _$RegisterImpl value, $Res Function(_$RegisterImpl) then) =
      __$$RegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
      _$RegisterImpl _value, $Res Function(_$RegisterImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$RegisterImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$RegisterImpl implements _Register {
  const _$RegisterImpl(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthEvent.register(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String ownerId) loginWithEmailAndId,
    required TResult Function() loginWithGoogle,
    required TResult Function(UserModel user) register,
  }) {
    return register(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String ownerId)? loginWithEmailAndId,
    TResult? Function()? loginWithGoogle,
    TResult? Function(UserModel user)? register,
  }) {
    return register?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String ownerId)? loginWithEmailAndId,
    TResult Function()? loginWithGoogle,
    TResult Function(UserModel user)? register,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithEmailAndId value) loginWithEmailAndId,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_Register value) register,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithEmailAndId value)? loginWithEmailAndId,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_Register value)? register,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithEmailAndId value)? loginWithEmailAndId,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_Register value)? register,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements AuthEvent {
  const factory _Register(final UserModel user) = _$RegisterImpl;

  UserModel get user;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(String message) emailLoginFailed,
    required TResult Function(String message) googleLoginFailed,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(String message)? emailLoginFailed,
    TResult? Function(String message)? googleLoginFailed,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function(String message)? emailLoginFailed,
    TResult Function(String message)? googleLoginFailed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_EmailLoginFailed value) emailLoginFailed,
    required TResult Function(_GoogleLoginFailed value) googleLoginFailed,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult? Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
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
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
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
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(String message) emailLoginFailed,
    required TResult Function(String message) googleLoginFailed,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(String message)? emailLoginFailed,
    TResult? Function(String message)? googleLoginFailed,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function(String message)? emailLoginFailed,
    TResult Function(String message)? googleLoginFailed,
    TResult Function(String message)? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_EmailLoginFailed value) emailLoginFailed,
    required TResult Function(_GoogleLoginFailed value) googleLoginFailed,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult? Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
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
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(String message) emailLoginFailed,
    required TResult Function(String message) googleLoginFailed,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(String message)? emailLoginFailed,
    TResult? Function(String message)? googleLoginFailed,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function(String message)? emailLoginFailed,
    TResult Function(String message)? googleLoginFailed,
    TResult Function(String message)? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_EmailLoginFailed value) emailLoginFailed,
    required TResult Function(_GoogleLoginFailed value) googleLoginFailed,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult? Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthenticatedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(String message) emailLoginFailed,
    required TResult Function(String message) googleLoginFailed,
    required TResult Function(String message) error,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(String message)? emailLoginFailed,
    TResult? Function(String message)? googleLoginFailed,
    TResult? Function(String message)? error,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function(String message)? emailLoginFailed,
    TResult Function(String message)? googleLoginFailed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_EmailLoginFailed value) emailLoginFailed,
    required TResult Function(_GoogleLoginFailed value) googleLoginFailed,
    required TResult Function(_Error value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult? Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult? Function(_Error value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthState {
  const factory _Authenticated(final UserModel user) = _$AuthenticatedImpl;

  UserModel get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailLoginFailedImplCopyWith<$Res> {
  factory _$$EmailLoginFailedImplCopyWith(_$EmailLoginFailedImpl value,
          $Res Function(_$EmailLoginFailedImpl) then) =
      __$$EmailLoginFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EmailLoginFailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$EmailLoginFailedImpl>
    implements _$$EmailLoginFailedImplCopyWith<$Res> {
  __$$EmailLoginFailedImplCopyWithImpl(_$EmailLoginFailedImpl _value,
      $Res Function(_$EmailLoginFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$EmailLoginFailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailLoginFailedImpl implements _EmailLoginFailed {
  const _$EmailLoginFailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.emailLoginFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailLoginFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailLoginFailedImplCopyWith<_$EmailLoginFailedImpl> get copyWith =>
      __$$EmailLoginFailedImplCopyWithImpl<_$EmailLoginFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(String message) emailLoginFailed,
    required TResult Function(String message) googleLoginFailed,
    required TResult Function(String message) error,
  }) {
    return emailLoginFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(String message)? emailLoginFailed,
    TResult? Function(String message)? googleLoginFailed,
    TResult? Function(String message)? error,
  }) {
    return emailLoginFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function(String message)? emailLoginFailed,
    TResult Function(String message)? googleLoginFailed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (emailLoginFailed != null) {
      return emailLoginFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_EmailLoginFailed value) emailLoginFailed,
    required TResult Function(_GoogleLoginFailed value) googleLoginFailed,
    required TResult Function(_Error value) error,
  }) {
    return emailLoginFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult? Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult? Function(_Error value)? error,
  }) {
    return emailLoginFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (emailLoginFailed != null) {
      return emailLoginFailed(this);
    }
    return orElse();
  }
}

abstract class _EmailLoginFailed implements AuthState {
  const factory _EmailLoginFailed(final String message) =
      _$EmailLoginFailedImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailLoginFailedImplCopyWith<_$EmailLoginFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleLoginFailedImplCopyWith<$Res> {
  factory _$$GoogleLoginFailedImplCopyWith(_$GoogleLoginFailedImpl value,
          $Res Function(_$GoogleLoginFailedImpl) then) =
      __$$GoogleLoginFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GoogleLoginFailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$GoogleLoginFailedImpl>
    implements _$$GoogleLoginFailedImplCopyWith<$Res> {
  __$$GoogleLoginFailedImplCopyWithImpl(_$GoogleLoginFailedImpl _value,
      $Res Function(_$GoogleLoginFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GoogleLoginFailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoogleLoginFailedImpl implements _GoogleLoginFailed {
  const _$GoogleLoginFailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.googleLoginFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleLoginFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleLoginFailedImplCopyWith<_$GoogleLoginFailedImpl> get copyWith =>
      __$$GoogleLoginFailedImplCopyWithImpl<_$GoogleLoginFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(String message) emailLoginFailed,
    required TResult Function(String message) googleLoginFailed,
    required TResult Function(String message) error,
  }) {
    return googleLoginFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(String message)? emailLoginFailed,
    TResult? Function(String message)? googleLoginFailed,
    TResult? Function(String message)? error,
  }) {
    return googleLoginFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function(String message)? emailLoginFailed,
    TResult Function(String message)? googleLoginFailed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (googleLoginFailed != null) {
      return googleLoginFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_EmailLoginFailed value) emailLoginFailed,
    required TResult Function(_GoogleLoginFailed value) googleLoginFailed,
    required TResult Function(_Error value) error,
  }) {
    return googleLoginFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult? Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult? Function(_Error value)? error,
  }) {
    return googleLoginFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (googleLoginFailed != null) {
      return googleLoginFailed(this);
    }
    return orElse();
  }
}

abstract class _GoogleLoginFailed implements AuthState {
  const factory _GoogleLoginFailed(final String message) =
      _$GoogleLoginFailedImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleLoginFailedImplCopyWith<_$GoogleLoginFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
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
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(String message) emailLoginFailed,
    required TResult Function(String message) googleLoginFailed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(String message)? emailLoginFailed,
    TResult? Function(String message)? googleLoginFailed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function(String message)? emailLoginFailed,
    TResult Function(String message)? googleLoginFailed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_EmailLoginFailed value) emailLoginFailed,
    required TResult Function(_GoogleLoginFailed value) googleLoginFailed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult? Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_EmailLoginFailed value)? emailLoginFailed,
    TResult Function(_GoogleLoginFailed value)? googleLoginFailed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
