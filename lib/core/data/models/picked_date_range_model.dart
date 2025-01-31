// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PickedDateRangeModel {
  /// The start date of the range.
  final DateTime? startDate;

  /// The end date of the range.
  final DateTime? endDate;
  PickedDateRangeModel(
    this.startDate,
    this.endDate,
  );

  PickedDateRangeModel copyWith({
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return PickedDateRangeModel(
      startDate ?? this.startDate,
      endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': startDate == null ? null : Timestamp.fromDate(startDate!),
      'end': endDate == null ? null : Timestamp.fromDate(endDate!),
    };
  }

  factory PickedDateRangeModel.fromMap(Map<String, dynamic> map) {
    return PickedDateRangeModel(
      map['start'] != null ? (map['start'] as Timestamp).toDate() : null,
      map['end'] != null ? (map['end'] as Timestamp).toDate() : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PickedDateRangeModel.fromJson(String source) =>
      PickedDateRangeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PickedDateRangeModel(startDate: $startDate, endDate: $endDate)';

  @override
  bool operator ==(covariant PickedDateRangeModel other) {
    if (identical(this, other)) return true;

    return other.startDate == startDate && other.endDate == endDate;
  }

  @override
  int get hashCode => startDate.hashCode ^ endDate.hashCode;
}
