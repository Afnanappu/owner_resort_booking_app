// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

class RevenueRateModel {
  final String resortId;
  final DateTime date;
  final double revenue;

  RevenueRateModel({
    required this.resortId,
    required this.date,
    required this.revenue,
  });

  RevenueRateModel copyWith({
    String? resortId,
    DateTime? date,
    double? revenue,
  }) {
    return RevenueRateModel(
      resortId: resortId ?? this.resortId,
      date: date ?? this.date,
      revenue: revenue ?? this.revenue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resortId': resortId,
      'date': date.millisecondsSinceEpoch,
      'revenue': revenue,
    };
  }

  factory RevenueRateModel.fromMap(Map<String, dynamic> map) {
    return RevenueRateModel(
      resortId: map['resortId'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      revenue: map['revenue'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory RevenueRateModel.fromJson(String source) =>
      RevenueRateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RevenueRateModel(resortId: $resortId, date: $date, revenue: $revenue)';

  @override
  bool operator ==(covariant RevenueRateModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.resortId == resortId &&
      other.date == date &&
      other.revenue == revenue;
  }

  @override
  int get hashCode => resortId.hashCode ^ date.hashCode ^ revenue.hashCode;
}
