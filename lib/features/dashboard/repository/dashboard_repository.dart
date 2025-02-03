import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_date_range_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/booking_rate_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/dashboard_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/summary_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/total_booking_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/services/dashboard_service.dart';

class DashboardRepository {
  final DashboardService _dashboardService;

  DashboardRepository(this._dashboardService);

  Future<DashboardModel> getDashboardData({
    required String ownerId,
    required PickedDateRangeModel filterDate,
  }) async {
    try {
      final data = await _dashboardService.fetchDashboardData(
        ownerId: ownerId,
        filterDate: filterDate,
      );

      // Processing booking data

      final bookingData = data['bookingData'] as List<Map<String, dynamic>>;
      int upcomingBookings = 0;
      int completedBookings = 0;
      int cancelledBookings = 0;
      for (var booking in bookingData) {
        switch ((booking['status'] as String).toLowerCase()) {
          case 'booked':
            upcomingBookings++;
          case 'completed':
            completedBookings++;
          case 'cancelled':
            cancelledBookings++;
          default:
            break;
        }
      }

      final totalBookingModel = TotalBookingModel(
        upcomingBookings: upcomingBookings,
        completedBookings: completedBookings,
        cancelledBookings: cancelledBookings,
      );

      // Processing summary data

      final summaryData = data['summaryData'] as List<int>;

      final visitorsCount = data['visitorsCount'] as int;

      // Processing booking rate data

      final bookingRateData = data['bookingRateData'] as List<DateTime>;

      final frequency = <DateTime, int>{}; // Map to store frequency of bookings

      for (var date in bookingRateData) {
        final pureDate = DateTime(date.year, date.month, date.day);
        frequency[pureDate] = (frequency[pureDate] ?? 0) + 1;
      }

      final bookingRateModel = frequency.entries
          .map((e) => BookingRateModel(
                bookedDate: e.key,
                count: e.value,
              ))
          .toList();

      // Returning the processed data

      return DashboardModel(
          totalBookingModel: totalBookingModel,
          bookingRateModel: bookingRateModel,
          summaryModel: SummaryModel(
            propertyCount: summaryData.length,
            roomCount: summaryData.fold(
              0,
              (previousValue, element) => previousValue + element,
            ),
            totalVisitors: visitorsCount,
          ));
    } catch (e) {
      throw Exception('Failed to load bookings: $e');
    }
  }
}
