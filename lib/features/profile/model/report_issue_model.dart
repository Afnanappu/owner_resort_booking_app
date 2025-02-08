// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReportIssueModel {
  String? id;
  final String title;
  final String description;
  final String status;
  final DateTime timestamp;
  ReportIssueModel({
    this.id,
    required this.title,
    required this.description,
    this.status = 'Pending',
    required this.timestamp,
  });

  ReportIssueModel copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
    DateTime? timestamp,
  }) {
    return ReportIssueModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }

  factory ReportIssueModel.fromMap(Map<String, dynamic> map) {
    return ReportIssueModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      timestamp: Timestamp.fromDate(map['timestamp']).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportIssueModel.fromJson(String source) =>
      ReportIssueModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReportIssueModel(id: $id, title: $title, description: $description, status: $status, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant ReportIssueModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.status == status &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        status.hashCode ^
        timestamp.hashCode;
  }
}
