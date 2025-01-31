// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  String? reviewId;
  final String bookingId;
  final String userId;
  final String propertyId;
  final int rating;
  final String feedback;
  final DateTime timestamp;
  final String status;
  ReviewModel({
    this.reviewId,
    required this.bookingId,
    required this.userId,
    required this.propertyId,
    required this.rating,
    required this.feedback,
    required this.timestamp,
    required this.status,
  });

  ReviewModel copyWith({
    String? reviewId,
    String? bookingId,
    String? userId,
    String? propertyId,
    int? rating,
    String? feedback,
    DateTime? timestamp,
    String? status,
  }) {
    return ReviewModel(
      reviewId: reviewId ?? this.reviewId,
      bookingId: bookingId ?? this.bookingId,
      userId: userId ?? this.userId,
      propertyId: propertyId ?? this.propertyId,
      rating: rating ?? this.rating,
      feedback: feedback ?? this.feedback,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reviewId': reviewId,
      'bookingId': bookingId,
      'userId': userId,
      'propertyId': propertyId,
      'rating': rating,
      'feedback': feedback,
      'timestamp': Timestamp.fromDate(timestamp),
      'status': status,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      reviewId: map['reviewId'] != null ? map['reviewId'] as String : null,
      bookingId: map['bookingId'] as String,
      userId: map['userId'] as String,
      propertyId: map['propertyId'] as String,
      rating: map['rating'] as int,
      feedback: map['feedback'] as String,
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReviewModel(reviewId: $reviewId, bookingId: $bookingId, userId: $userId, propertyId: $propertyId, rating: $rating, feedback: $feedback, timestamp: $timestamp, status: $status)';
  }

  @override
  bool operator ==(covariant ReviewModel other) {
    if (identical(this, other)) return true;

    return other.reviewId == reviewId &&
        other.bookingId == bookingId &&
        other.userId == userId &&
        other.propertyId == propertyId &&
        other.rating == rating &&
        other.feedback == feedback &&
        other.timestamp == timestamp &&
        other.status == status;
  }

  @override
  int get hashCode {
    return reviewId.hashCode ^
        bookingId.hashCode ^
        userId.hashCode ^
        propertyId.hashCode ^
        rating.hashCode ^
        feedback.hashCode ^
        timestamp.hashCode ^
        status.hashCode;
  }
}
