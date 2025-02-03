// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/features/dashboard/models/booking_rate_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/summary_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/total_booking_model.dart';

class DashboardModel {
  final TotalBookingModel totalBookingModel;
  final List<BookingRateModel> bookingRateModel;
  final SummaryModel? summaryModel; //TODO: Make this required

  DashboardModel({
    required this.totalBookingModel,
    required this.bookingRateModel,
     this.summaryModel,
  });

  DashboardModel copyWith({
    TotalBookingModel? totalBookingModel,
    List<BookingRateModel>? bookingRateModel,
    SummaryModel? summaryModel,
  }) {
    return DashboardModel(
      totalBookingModel: totalBookingModel ?? this.totalBookingModel,
      bookingRateModel: bookingRateModel ?? this.bookingRateModel,
      summaryModel: summaryModel ?? this.summaryModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalBookingModel': totalBookingModel.toMap(),
      'bookingRateModel': bookingRateModel.map((x) => x.toMap()).toList(),
      'summaryModel': summaryModel?.toMap(),
    };
  }

  factory DashboardModel.fromMap(Map<String, dynamic> map) {
    return DashboardModel(
      totalBookingModel: TotalBookingModel.fromMap(map['totalBookingModel'] as Map<String,dynamic>),
      bookingRateModel: List<BookingRateModel>.from((map['bookingRateModel'] as List<int>).map<BookingRateModel>((x) => BookingRateModel.fromMap(x as Map<String,dynamic>),),),
      summaryModel: map['summaryModel'] != null ? SummaryModel.fromMap(map['summaryModel'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardModel.fromJson(String source) =>
      DashboardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DashboardModel(totalBookingModel: $totalBookingModel, bookingRateModel: $bookingRateModel, summaryModel: $summaryModel)';

  @override
  bool operator ==(covariant DashboardModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.totalBookingModel == totalBookingModel &&
      listEquals(other.bookingRateModel, bookingRateModel) &&
      other.summaryModel == summaryModel;
  }

  @override
  int get hashCode => totalBookingModel.hashCode ^ bookingRateModel.hashCode ^ summaryModel.hashCode;
}
