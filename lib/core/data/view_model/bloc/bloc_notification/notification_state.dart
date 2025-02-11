part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.onNotification(
    List<NotificationModel> notifications,
  ) = _OnNotification;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.error(String message) = _Error;
}
