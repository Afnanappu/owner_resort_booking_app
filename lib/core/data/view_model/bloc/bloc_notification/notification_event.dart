part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.initNotification() = _InitNotification;
  const factory NotificationEvent.showNotification(RemoteMessage notification) =
      _ShowNotification;
  const factory NotificationEvent.updateNotification() = _UpdateNotification;

  ///Sent notification to the owner
  const factory NotificationEvent.sendNotification({
    required String uid,
    required String title,
    required String content,
  }) = _SendNotification;
}
