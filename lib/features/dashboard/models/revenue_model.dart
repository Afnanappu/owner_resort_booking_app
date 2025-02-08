// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/features/dashboard/models/revenue_booking_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_rate_model.dart';

class RevenueModel {
  final List<RevenueRateModel> revenueRates; // Data for the chart
  final List<RevenueBookingModel> resortBookings; // Data for the list view
  RevenueModel({
    required this.revenueRates,
    required this.resortBookings,
  });

  RevenueModel copyWith({
    List<RevenueRateModel>? revenueRates,
    List<RevenueBookingModel>? resortBookings,
  }) {
    return RevenueModel(
      revenueRates: revenueRates ?? this.revenueRates,
      resortBookings: resortBookings ?? this.resortBookings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'revenueRates': revenueRates.map((x) => x.toMap()).toList(),
      'resortBookings': resortBookings.map((x) => x.toMap()).toList(),
    };
  }

  factory RevenueModel.fromMap(Map<String, dynamic> map) {
    return RevenueModel(
      revenueRates: List<RevenueRateModel>.from(
        (map['revenueRates'] as List<dynamic>).map<RevenueRateModel>(
          (x) => RevenueRateModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      resortBookings: List<RevenueBookingModel>.from(
        (map['resortBookings'] as List<dynamic>).map<RevenueBookingModel>(
          (x) => RevenueBookingModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RevenueModel.fromJson(String source) =>
      RevenueModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RevenueModel(revenueRates: $revenueRates, resortBookings: $resortBookings)';

  @override
  bool operator ==(covariant RevenueModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.revenueRates, revenueRates) &&
        listEquals(other.resortBookings, resortBookings);
  }

  @override
  int get hashCode => revenueRates.hashCode ^ resortBookings.hashCode;
}
