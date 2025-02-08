import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class DashboardService {
  final _ownerCollection = FirebaseFirestore.instance.collection('owners');
  final _usersCollection = FirebaseFirestore.instance.collection('users');
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');
  // final _roomCollectionName = 'rooms';
  final _bookingCollectionName = 'bookings';

  Future<Map<String, dynamic>> fetchDashboardData({
    required String ownerId,
  }) async {
    try {
      final map = <String, dynamic>{}; // Map to store data

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

  Future<List<Map<String, dynamic>>> fetchAllCustomers() async {
    final ownerId = FirebaseAuth.instance.currentUser!.uid;

    final bookingsDoc = await _ownerCollection
        .doc(ownerId)
        .collection(_bookingCollectionName)
        .get();

    final userIds = bookingsDoc.docChanges
        .map(
          (e) => e.doc.data()!['userId'] as String,
        )
        .toSet();

    final List<Map<String, dynamic>> usersData = [];

    for (var id in userIds) {
      final data = await _usersCollection.doc(id).get();
      if (data.data() != null) {
        usersData.add(data.data()!);
      }
    }

    return usersData;
  }

  Future<Map<String, dynamic>> fetchRevenueAndReportData() async {
    try {
      final ownerId = FirebaseAuth.instance.currentUser!.uid;

      // Fetching total booking data
      final bookingData = await _ownerCollection
          .doc(ownerId)
          .collection(_bookingCollectionName)
          .get();

      final revenueList = <double>[];
      final dateList = <DateTime>[];
      final propertyIds = <String>[];
      final bookingPropertyMap = <String,
          List<Map<String, dynamic>>>{}; // Mapping of propertyId -> bookings

      bookingData.docs
          .map((e) => e.data())
          .where(
            (e) => e['status'].toLowerCase() != 'cancelled',
          )
          .forEach((e) {
        final propertyId = e['propertyId'] as String;
        final revenue = e['totalPrice'] as double;
        final date = (e['createdAt'] as Timestamp).toDate();

        propertyIds.add(propertyId);
        revenueList.add(revenue);
        dateList.add(date);

        // Group bookings by propertyId
        bookingPropertyMap.putIfAbsent(propertyId, () => []);
        bookingPropertyMap[propertyId]!.add({
          'revenue': revenue,
          'date': date,
        });
      });

      // Fetching all owner properties
      final propertiesModel = <Map<String, dynamic>>[];

      for (var propertyId in propertyIds.toSet()) {
        final data = await _propertiesCollection.doc(propertyId).get();
        final counts = await _ownerCollection
            .doc(ownerId)
            .collection(_bookingCollectionName)
            .count()
            .query
            .where('propertyId', isEqualTo: propertyId)
            .get();

        if (data.exists) {
          propertiesModel.add(
            data.data()!..['bookings'] = counts.size,
          );
        }
      }

      return {
        'revenueList': revenueList,
        'dateList': dateList,
        'propertyIds':
            propertyIds, // Add property IDs to track which revenue belongs to which resort
        'propertiesModel': propertiesModel,
        'bookingPropertyMap': bookingPropertyMap, // Pass grouped revenue data
      };
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
