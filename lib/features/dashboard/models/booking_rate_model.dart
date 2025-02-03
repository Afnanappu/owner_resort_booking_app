// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BookingRateModel {
  final DateTime bookedDate;
  final int count;
  BookingRateModel({
    required this.bookedDate,
    required this.count,
  });

  BookingRateModel copyWith({
    DateTime? bookedDate,
    int? count,
  }) {
    return BookingRateModel(
      bookedDate: bookedDate ?? this.bookedDate,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookedDate': Timestamp.fromDate(bookedDate),
      'count': count,
    };
  }

  factory BookingRateModel.fromMap(Map<String, dynamic> map) {
    return BookingRateModel(
      bookedDate: (map['bookedDate'] as Timestamp).toDate(),
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingRateModel.fromJson(String source) =>
      BookingRateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BookingRateModel(bookedDate: $bookedDate, count: $count)';

  @override
  bool operator ==(covariant BookingRateModel other) {
    if (identical(this, other)) return true;

    return other.bookedDate == bookedDate && other.count == count;
  }

  @override
  int get hashCode => bookedDate.hashCode ^ count.hashCode;
}
