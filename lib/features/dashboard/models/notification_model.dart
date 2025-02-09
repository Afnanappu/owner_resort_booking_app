// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' show IconData;

class NotificationModel {
  final String title;
  final String body;
  final DateTime sentAt;
  final IconData? icon;

  NotificationModel({
    required this.title,
    required this.body,
    required this.sentAt,
    this.icon,
  });

  NotificationModel copyWith({
    String? title,
    String? body,
    DateTime? sentAt,
    IconData? icon,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      body: body ?? this.body,
      sentAt: sentAt ?? this.sentAt,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'sentAt': Timestamp.fromDate(sentAt),
      'icon': icon?.codePoint,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      body: map['body'] as String,
      sentAt: (map['sentAt'] as Timestamp).toDate(),
      icon: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(title: $title, body: $body, sentAt: $sentAt, icon: $icon)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.body == body &&
        other.sentAt == sentAt &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return title.hashCode ^ body.hashCode ^ sentAt.hashCode ^ icon.hashCode;
  }
}
