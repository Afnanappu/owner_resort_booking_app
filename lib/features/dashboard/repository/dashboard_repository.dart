import 'dart:developer';

import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/core/data/models/user_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/booking_rate_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/dashboard_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_booking_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_rate_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/summary_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/total_booking_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/services/dashboard_service.dart';

class DashboardRepository {
  final DashboardService _dashboardService;

  DashboardRepository(this._dashboardService);

  Future<DashboardModel> getDashboardData({
    required String ownerId,
  }) async {
    try {
      final data = await _dashboardService.fetchDashboardData(
        ownerId: ownerId,
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
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw Exception('Failed to load bookings: $e');
    }
  }

  Future<List<UserModel>> fetchAllCustomers() async {
    try {
      final users = await _dashboardService.fetchAllCustomers();
      return users
          .map(
            (e) => UserModel.fromMap(e),
          )
          .toList();
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<RevenueModel> fetchRevenueAndReportData() async {
    try {
      final data = await _dashboardService.fetchRevenueAndReportData();

      final revenueList = data['revenueList'] as List<double>;
      final propertiesModel =
          data['propertiesModel'] as List<Map<String, dynamic>>;
      final dateList = (data['dateList'] as List<DateTime>)
          .map((e) => DateTime(e.year, e.month, e.day))
          .toList();

      // Map to store revenue for each (resortId, date) combination
      Map<String, Map<DateTime, double>> revenueMap = {};

      for (int i = 0; i < dateList.length; i++) {
        final propertyId =
            data['propertyIds'][i] as String; // Add property ID tracking

        if (!revenueMap.containsKey(propertyId)) {
          revenueMap[propertyId] = {};
        }
        revenueMap[propertyId]![dateList[i]] =
            (revenueMap[propertyId]![dateList[i]] ?? 0) + revenueList[i];
      }

      // Create ResortBookingModel list with revenue
      final updatedResorts = propertiesModel.map((resort) {
        final resortId = resort['id'] as String;
        double resortRevenue =
            revenueMap[resortId]?.values.fold(0, (a, b) => a! + b) ?? 0;

        return RevenueBookingModel(
          resortId: resortId,
          resortName: resort['name'],
          bookings: resort['bookings'], // Simulated bookings
          revenue: resortRevenue,
          image: PickedFileModel.fromMap((resort['images'] as List).first)
              .base64file,
        );
      }).toList();

      // Create RevenueRateModel list
      final revenueModelList = <RevenueRateModel>[];
      for (var resortId in revenueMap.keys) {
        for (var date in revenueMap[resortId]!.keys) {
          revenueModelList.add(
            RevenueRateModel(
              date: date,
              revenue: revenueMap[resortId]![date] ?? 0,
              resortId: resortId,
            ),
          );
        }
      }

      return RevenueModel(
        revenueRates: revenueModelList,
        resortBookings: updatedResorts,
      );
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
