import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/data/services/notification_services.dart';
import 'package:owner_resort_booking_app/features/profile/views/screens/screen_profile.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

final globalNavKey = GlobalKey<NavigatorState>();

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationServices _notificationServices;
  NotificationBloc(this._notificationServices) : super(_Initial()) {
    on<_InitNotification>(
      (event, emit) async {
        await _notificationServices.initNotification(
          initPushNotificationCb: () async {
            _notificationServices.onMessageOpenedApp.listen(_onMessageOpened);

            _notificationServices.onMessage.listen(_showLocalNotification);

            await _notificationServices
                .getInitialMessages()
                .then(_onInitialMessage);
          },
          initLocalNotificationCb: (response) {
            if (response.payload == null) {
              log('payload is null', stackTrace: StackTrace.current);
              return;
            }
            final message =
                RemoteMessage.fromMap(jsonDecode(response.payload!));

            final notification = _notificationServices.handleMessage(message);
            if (notification == null) {
              return;
            }

            // globalNavKey.currentContext!.go('/${AppRoutes.notification}');
            if (globalNavKey.currentContext != null) {
              globalNavKey.currentState?.push(
                MaterialPageRoute(
                  builder: (context) => ScreenProfile(),
                ),
              );
            }
            add(NotificationEvent.showNotification(notification));
          },
        );
      },
    );

    on<_ShowNotification>((event, emit) {
      emit(NotificationState.onNotification(event.notification));
    });

    on<_UpdateNotification>((event, emit) async {
      try {
        final fcmToken = await _notificationServices.getFcmToken();
        final ownerId = FirebaseAuth.instance.currentUser?.uid;
        if (ownerId != null) {
          await _notificationServices.updateToken(
            newFcmToken: fcmToken,
            ownerId: ownerId,
          );
        }
      } catch (e, stack) {
        log(e.toString(), stackTrace: stack);
      }
      // emit(NotificationState.onNotification(event.notification));
    });

    on<_SendNotification>(
      (event, emit) async {
        try {
          await _notificationServices.sendNotification(
            uid: event.uid,
            title: event.title,
            content: event.content,
            collection: 'users',
          );
        } catch (e, stack) {
          log(e.toString(), stackTrace: stack);
        }
      },
    );
  }

  FutureOr<Null> _onInitialMessage(message) {
    final notification = _notificationServices.handleMessage(message);
    if (notification == null) {
      return null;
    }

    add(NotificationEvent.showNotification(notification));
  }

  void _showLocalNotification(message) {
    final notification = message.notification;

    if (notification == null) {
      log('onMessage Notification is null');
      return;
    }

    _notificationServices.showLocalNotification(
        notification, jsonEncode(message.toMap()));
  }

  void _onMessageOpened(message) {
    final notification = _notificationServices.handleMessage(message);
    if (notification == null) {
      return;
    }
    // globalNavKey.currentContext!.go('/${AppRoutes.notification}');
    if (globalNavKey.currentContext != null) {
      globalNavKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => ScreenProfile(),
        ),
      );
    }
    add(NotificationEvent.showNotification(notification));
  }
}
