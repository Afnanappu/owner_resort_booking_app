import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_date_range_model.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class DashboardService {
  final _ownerCollection = FirebaseFirestore.instance.collection('owners');
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');
  final _roomCollectionName = 'rooms';
  final _bookingCollectionName = 'bookings';

  Future<Map<String, dynamic>> fetchDashboardData({
    required String ownerId,
    required PickedDateRangeModel filterDate,
  }) async {
    try {
      final map = <String, dynamic>{}; // Map to store data

      // ignore: unused_local_variable
      const demoModel = <String, dynamic>{
        'upcomingBookings': 10, //
        'completedBookings': 20, //
        'cancelledBookings': 5, //
        'totalRevenue': 10000.0,
        'resortCount': 5,
        'roomCount': 20,
        'totalVisitors': 100,
      }; // Demo data

      // Fetching total booking data

      final bookingData = await _ownerCollection
          .doc(ownerId)
          .collection(_bookingCollectionName)
          .get();

      final bookingDataModel = bookingData.docs.map((e) {
        final data = e.data();
        return data;
      }).toList();

      map['bookingData'] = bookingDataModel;

      // Fetching summary

      final summaryData = await _propertiesCollection
          .where('ownerId', isEqualTo: ownerId)
          .get();

      final visitorsCount = bookingDataModel.fold(
        0,
        (previousValue, element) {
          return previousValue += element['gustCount'] as int;
        },
      );

      map['visitorsCount'] = visitorsCount;

      final summaryDataModel = summaryData.docs.map((e) {
        final data = e.data()['roomCount'] as int;
        return data;
      }).toList();

      map['summaryData'] = summaryDataModel;

      // Fetching booking rate

      final bookingRateData = bookingDataModel.where(
        (e) {
          if (e['status'].toLowerCase() != 'cancelled') {
            return true;
          } else {
            return false;
          }
        },
      ).map((e) {
        return (e['createdAt'] as Timestamp).toDate();
      }).toList();

      map['bookingRateData'] = bookingRateData;

      return map;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
