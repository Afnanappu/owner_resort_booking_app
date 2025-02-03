// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initNotification,
    required TResult Function(RemoteMessage notification) showNotification,
    required TResult Function() fetchNotification,
    required TResult Function() updateNotification,
    required TResult Function(String uid, String title, String content)
        sendNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initNotification,
    TResult? Function(RemoteMessage notification)? showNotification,
    TResult? Function()? fetchNotification,
    TResult? Function()? updateNotification,
    TResult? Function(String uid, String title, String content)?
        sendNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initNotification,
    TResult Function(RemoteMessage notification)? showNotification,
    TResult Function()? fetchNotification,
    TResult Function()? updateNotification,
    TResult Function(String uid, String title, String content)?
        sendNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitNotification value) initNotification,
    required TResult Function(_ShowNotification value) showNotification,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_UpdateNotification value) updateNotification,
    required TResult Function(_SendNotification value) sendNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitNotification value)? initNotification,
    TResult? Function(_ShowNotification value)? showNotification,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_UpdateNotification value)? updateNotification,
    TResult? Function(_SendNotification value)? sendNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitNotification value)? initNotification,
    TResult Function(_ShowNotification value)? showNotification,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_UpdateNotification value)? updateNotification,
    TResult Function(_SendNotification value)? sendNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitNotificationImplCopyWith<$Res> {
  factory _$$InitNotificationImplCopyWith(_$InitNotificationImpl value,
          $Res Function(_$InitNotificationImpl) then) =
      __$$InitNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$InitNotificationImpl>
    implements _$$InitNotificationImplCopyWith<$Res> {
  __$$InitNotificationImplCopyWithImpl(_$InitNotificationImpl _value,
      $Res Function(_$InitNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitNotificationImpl implements _InitNotification {
  const _$InitNotificationImpl();

  @override
  String toString() {
    return 'NotificationEvent.initNotification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initNotification,
    required TResult Function(RemoteMessage notification) showNotification,
    required TResult Function() fetchNotification,
    required TResult Function() updateNotification,
    required TResult Function(String uid, String title, String content)
        sendNotification,
  }) {
    return initNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initNotification,
    TResult? Function(RemoteMessage notification)? showNotification,
    TResult? Function()? fetchNotification,
    TResult? Function()? updateNotification,
    TResult? Function(String uid, String title, String content)?
        sendNotification,
  }) {
    return initNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initNotification,
    TResult Function(RemoteMessage notification)? showNotification,
    TResult Function()? fetchNotification,
    TResult Function()? updateNotification,
    TResult Function(String uid, String title, String content)?
        sendNotification,
    required TResult orElse(),
  }) {
    if (initNotification != null) {
      return initNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitNotification value) initNotification,
    required TResult Function(_ShowNotification value) showNotification,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_UpdateNotification value) updateNotification,
    required TResult Function(_SendNotification value) sendNotification,
  }) {
    return initNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitNotification value)? initNotification,
    TResult? Function(_ShowNotification value)? showNotification,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_UpdateNotification value)? updateNotification,
    TResult? Function(_SendNotification value)? sendNotification,
  }) {
    return initNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitNotification value)? initNotification,
    TResult Function(_ShowNotification value)? showNotification,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_UpdateNotification value)? updateNotification,
    TResult Function(_SendNotification value)? sendNotification,
    required TResult orElse(),
  }) {
    if (initNotification != null) {
      return initNotification(this);
    }
    return orElse();
  }
}

abstract class _InitNotification implements NotificationEvent {
  const factory _InitNotification() = _$InitNotificationImpl;
}

/// @nodoc
abstract class _$$ShowNotificationImplCopyWith<$Res> {
  factory _$$ShowNotificationImplCopyWith(_$ShowNotificationImpl value,
          $Res Function(_$ShowNotificationImpl) then) =
      __$$ShowNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RemoteMessage notification});
}

/// @nodoc
class __$$ShowNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ShowNotificationImpl>
    implements _$$ShowNotificationImplCopyWith<$Res> {
  __$$ShowNotificationImplCopyWithImpl(_$ShowNotificationImpl _value,
      $Res Function(_$ShowNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$ShowNotificationImpl(
      null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as RemoteMessage,
    ));
  }
}

/// @nodoc

class _$ShowNotificationImpl implements _ShowNotification {
  const _$ShowNotificationImpl(this.notification);

  @override
  final RemoteMessage notification;

  @override
  String toString() {
    return 'NotificationEvent.showNotification(notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowNotificationImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowNotificationImplCopyWith<_$ShowNotificationImpl> get copyWith =>
      __$$ShowNotificationImplCopyWithImpl<_$ShowNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initNotification,
    required TResult Function(RemoteMessage notification) showNotification,
    required TResult Function() fetchNotification,
    required TResult Function() updateNotification,
    required TResult Function(String uid, String title, String content)
        sendNotification,
  }) {
    return showNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initNotification,
    TResult? Function(RemoteMessage notification)? showNotification,
    TResult? Function()? fetchNotification,
    TResult? Function()? updateNotification,
    TResult? Function(String uid, String title, String content)?
        sendNotification,
  }) {
    return showNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initNotification,
    TResult Function(RemoteMessage notification)? showNotification,
    TResult Function()? fetchNotification,
    TResult Function()? updateNotification,
    TResult Function(String uid, String title, String content)?
        sendNotification,
    required TResult orElse(),
  }) {
    if (showNotification != null) {
      return showNotification(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitNotification value) initNotification,
    required TResult Function(_ShowNotification value) showNotification,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_UpdateNotification value) updateNotification,
    required TResult Function(_SendNotification value) sendNotification,
  }) {
    return showNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitNotification value)? initNotification,
    TResult? Function(_ShowNotification value)? showNotification,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_UpdateNotification value)? updateNotification,
    TResult? Function(_SendNotification value)? sendNotification,
  }) {
    return showNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitNotification value)? initNotification,
    TResult Function(_ShowNotification value)? showNotification,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_UpdateNotification value)? updateNotification,
    TResult Function(_SendNotification value)? sendNotification,
    required TResult orElse(),
  }) {
    if (showNotification != null) {
      return showNotification(this);
    }
    return orElse();
  }
}

abstract class _ShowNotification implements NotificationEvent {
  const factory _ShowNotification(final RemoteMessage notification) =
      _$ShowNotificationImpl;

  RemoteMessage get notification;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowNotificationImplCopyWith<_$ShowNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchNotificationImplCopyWith<$Res> {
  factory _$$FetchNotificationImplCopyWith(_$FetchNotificationImpl value,
          $Res Function(_$FetchNotificationImpl) then) =
      __$$FetchNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$FetchNotificationImpl>
    implements _$$FetchNotificationImplCopyWith<$Res> {
  __$$FetchNotificationImplCopyWithImpl(_$FetchNotificationImpl _value,
      $Res Function(_$FetchNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchNotificationImpl implements _FetchNotification {
  const _$FetchNotificationImpl();

  @override
  String toString() {
    return 'NotificationEvent.fetchNotification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initNotification,
    required TResult Function(RemoteMessage notification) showNotification,
    required TResult Function() fetchNotification,
    required TResult Function() updateNotification,
    required TResult Function(String uid, String title, String content)
        sendNotification,
  }) {
    return fetchNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initNotification,
    TResult? Function(RemoteMessage notification)? showNotification,
    TResult? Function()? fetchNotification,
    TResult? Function()? updateNotification,
    TResult? Function(String uid, String title, String content)?
        sendNotification,
  }) {
    return fetchNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initNotification,
    TResult Function(RemoteMessage notification)? showNotification,
    TResult Function()? fetchNotification,
    TResult Function()? updateNotification,
    TResult Function(String uid, String title, String content)?
        sendNotification,
    required TResult orElse(),
  }) {
    if (fetchNotification != null) {
      return fetchNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitNotification value) initNotification,
    required TResult Function(_ShowNotification value) showNotification,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_UpdateNotification value) updateNotification,
    required TResult Function(_SendNotification value) sendNotification,
  }) {
    return fetchNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitNotification value)? initNotification,
    TResult? Function(_ShowNotification value)? showNotification,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_UpdateNotification value)? updateNotification,
    TResult? Function(_SendNotification value)? sendNotification,
  }) {
    return fetchNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitNotification value)? initNotification,
    TResult Function(_ShowNotification value)? showNotification,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_UpdateNotification value)? updateNotification,
    TResult Function(_SendNotification value)? sendNotification,
    required TResult orElse(),
  }) {
    if (fetchNotification != null) {
      return fetchNotification(this);
    }
    return orElse();
  }
}

abstract class _FetchNotification implements NotificationEvent {
  const factory _FetchNotification() = _$FetchNotificationImpl;
}

/// @nodoc
abstract class _$$UpdateNotificationImplCopyWith<$Res> {
  factory _$$UpdateNotificationImplCopyWith(_$UpdateNotificationImpl value,
          $Res Function(_$UpdateNotificationImpl) then) =
      __$$UpdateNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$UpdateNotificationImpl>
    implements _$$UpdateNotificationImplCopyWith<$Res> {
  __$$UpdateNotificationImplCopyWithImpl(_$UpdateNotificationImpl _value,
      $Res Function(_$UpdateNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateNotificationImpl implements _UpdateNotification {
  const _$UpdateNotificationImpl();

  @override
  String toString() {
    return 'NotificationEvent.updateNotification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initNotification,
    required TResult Function(RemoteMessage notification) showNotification,
    required TResult Function() fetchNotification,
    required TResult Function() updateNotification,
    required TResult Function(String uid, String title, String content)
        sendNotification,
  }) {
    return updateNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initNotification,
    TResult? Function(RemoteMessage notification)? showNotification,
    TResult? Function()? fetchNotification,
    TResult? Function()? updateNotification,
    TResult? Function(String uid, String title, String content)?
        sendNotification,
  }) {
    return updateNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initNotification,
    TResult Function(RemoteMessage notification)? showNotification,
    TResult Function()? fetchNotification,
    TResult Function()? updateNotification,
    TResult Function(String uid, String title, String content)?
        sendNotification,
    required TResult orElse(),
  }) {
    if (updateNotification != null) {
      return updateNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitNotification value) initNotification,
    required TResult Function(_ShowNotification value) showNotification,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_UpdateNotification value) updateNotification,
    required TResult Function(_SendNotification value) sendNotification,
  }) {
    return updateNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitNotification value)? initNotification,
    TResult? Function(_ShowNotification value)? showNotification,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_UpdateNotification value)? updateNotification,
    TResult? Function(_SendNotification value)? sendNotification,
  }) {
    return updateNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitNotification value)? initNotification,
    TResult Function(_ShowNotification value)? showNotification,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_UpdateNotification value)? updateNotification,
    TResult Function(_SendNotification value)? sendNotification,
    required TResult orElse(),
  }) {
    if (updateNotification != null) {
      return updateNotification(this);
    }
    return orElse();
  }
}

abstract class _UpdateNotification implements NotificationEvent {
  const factory _UpdateNotification() = _$UpdateNotificationImpl;
}

/// @nodoc
abstract class _$$SendNotificationImplCopyWith<$Res> {
  factory _$$SendNotificationImplCopyWith(_$SendNotificationImpl value,
          $Res Function(_$SendNotificationImpl) then) =
      __$$SendNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid, String title, String content});
}

/// @nodoc
class __$$SendNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$SendNotificationImpl>
    implements _$$SendNotificationImplCopyWith<$Res> {
  __$$SendNotificationImplCopyWithImpl(_$SendNotificationImpl _value,
      $Res Function(_$SendNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$SendNotificationImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendNotificationImpl implements _SendNotification {
  const _$SendNotificationImpl(
      {required this.uid, required this.title, required this.content});

  @override
  final String uid;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'NotificationEvent.sendNotification(uid: $uid, title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendNotificationImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, title, content);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendNotificationImplCopyWith<_$SendNotificationImpl> get copyWith =>
      __$$SendNotificationImplCopyWithImpl<_$SendNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initNotification,
    required TResult Function(RemoteMessage notification) showNotification,
    required TResult Function() fetchNotification,
    required TResult Function() updateNotification,
    required TResult Function(String uid, String title, String content)
        sendNotification,
  }) {
    return sendNotification(uid, title, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initNotification,
    TResult? Function(RemoteMessage notification)? showNotification,
    TResult? Function()? fetchNotification,
    TResult? Function()? updateNotification,
    TResult? Function(String uid, String title, String content)?
        sendNotification,
  }) {
    return sendNotification?.call(uid, title, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initNotification,
    TResult Function(RemoteMessage notification)? showNotification,
    TResult Function()? fetchNotification,
    TResult Function()? updateNotification,
    TResult Function(String uid, String title, String content)?
        sendNotification,
    required TResult orElse(),
  }) {
    if (sendNotification != null) {
      return sendNotification(uid, title, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitNotification value) initNotification,
    required TResult Function(_ShowNotification value) showNotification,
    required TResult Function(_FetchNotification value) fetchNotification,
    required TResult Function(_UpdateNotification value) updateNotification,
    required TResult Function(_SendNotification value) sendNotification,
  }) {
    return sendNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitNotification value)? initNotification,
    TResult? Function(_ShowNotification value)? showNotification,
    TResult? Function(_FetchNotification value)? fetchNotification,
    TResult? Function(_UpdateNotification value)? updateNotification,
    TResult? Function(_SendNotification value)? sendNotification,
  }) {
    return sendNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitNotification value)? initNotification,
    TResult Function(_ShowNotification value)? showNotification,
    TResult Function(_FetchNotification value)? fetchNotification,
    TResult Function(_UpdateNotification value)? updateNotification,
    TResult Function(_SendNotification value)? sendNotification,
    required TResult orElse(),
  }) {
    if (sendNotification != null) {
      return sendNotification(this);
    }
    return orElse();
  }
}

abstract class _SendNotification implements NotificationEvent {
  const factory _SendNotification(
      {required final String uid,
      required final String title,
      required final String content}) = _$SendNotificationImpl;

  String get uid;
  String get title;
  String get content;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendNotificationImplCopyWith<_$SendNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NotificationModel> notifications)
        onNotification,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? onNotification,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? onNotification,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnNotification value)? onNotification,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationState
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
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotificationState.initial()';
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
    required TResult Function(List<NotificationModel> notifications)
        onNotification,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? onNotification,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? onNotification,
    TResult Function()? loading,
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
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnNotification value)? onNotification,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnNotification value)? onNotification,
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

abstract class _Initial implements NotificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$OnNotificationImplCopyWith<$Res> {
  factory _$$OnNotificationImplCopyWith(_$OnNotificationImpl value,
          $Res Function(_$OnNotificationImpl) then) =
      __$$OnNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationModel> notifications});
}

/// @nodoc
class __$$OnNotificationImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$OnNotificationImpl>
    implements _$$OnNotificationImplCopyWith<$Res> {
  __$$OnNotificationImplCopyWithImpl(
      _$OnNotificationImpl _value, $Res Function(_$OnNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$OnNotificationImpl(
      null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc

class _$OnNotificationImpl implements _OnNotification {
  const _$OnNotificationImpl(final List<NotificationModel> notifications)
      : _notifications = notifications;

  final List<NotificationModel> _notifications;
  @override
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationState.onNotification(notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnNotificationImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnNotificationImplCopyWith<_$OnNotificationImpl> get copyWith =>
      __$$OnNotificationImplCopyWithImpl<_$OnNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NotificationModel> notifications)
        onNotification,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return onNotification(notifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? onNotification,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return onNotification?.call(notifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? onNotification,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (onNotification != null) {
      return onNotification(notifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return onNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnNotification value)? onNotification,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return onNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (onNotification != null) {
      return onNotification(this);
    }
    return orElse();
  }
}

abstract class _OnNotification implements NotificationState {
  const factory _OnNotification(final List<NotificationModel> notifications) =
      _$OnNotificationImpl;

  List<NotificationModel> get notifications;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnNotificationImplCopyWith<_$OnNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'NotificationState.loading()';
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
    required TResult Function(List<NotificationModel> notifications)
        onNotification,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? onNotification,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? onNotification,
    TResult Function()? loading,
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
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnNotification value)? onNotification,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnNotification value)? onNotification,
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

abstract class _Loading implements NotificationState {
  const factory _Loading() = _$LoadingImpl;
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
    extends _$NotificationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
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
    return 'NotificationState.error(message: $message)';
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

  /// Create a copy of NotificationState
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
    required TResult Function(List<NotificationModel> notifications)
        onNotification,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NotificationModel> notifications)? onNotification,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NotificationModel> notifications)? onNotification,
    TResult Function()? loading,
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
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnNotification value)? onNotification,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnNotification value)? onNotification,
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

abstract class _Error implements NotificationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
