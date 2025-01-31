import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:owner_resort_booking_app/core/data/models/booking_model.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:owner_resort_booking_app/features/my_bookings/model/booked_property_card_model.dart';
import 'package:owner_resort_booking_app/features/my_bookings/model/booked_property_details_model.dart';
import 'package:owner_resort_booking_app/features/my_bookings/services/my_booking_services.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_details_model.dart';

class MyBookingRepository {
  final MyBookingServices _services;

  MyBookingRepository({required MyBookingServices services})
      : _services = services;

  Future<List<BookedPropertyCardModel>> fetchMyBookings({
    required String ownerId,
    String? type,
  }) async {
    try {
      final bookingData = await _services.fetchMyBookings(ownerId: ownerId);
      List<BookedPropertyCardModel> bookedModelList = [];
      for (var booking in bookingData) {
        final propertyId = booking!['propertyId'] as String;
        final propertyData =
            await _services.fetchPropertyDetails(id: propertyId);

        final todayDate = DateTime.now();
        final todayTime = TimeOfDay.now();
        final startingDate = (booking['startDate'] as Timestamp).toDate();
        final checkInTime =
            convertStringToTimeOfDay(propertyData['checkInTime']);
        final bookedStatus = booking['status'] as String;
        final bookingId = booking['bookingId'] as String;

        if ((todayDate.isBefore(startingDate) &&
                todayTime.isBefore(checkInTime)) &&
            (bookedStatus.toLowerCase() != 'active' &&
                bookedStatus.toLowerCase() != 'cancelled')) {
          //
          await _services.changeBookedStatus(
            status: 'Active',
            ownerId: ownerId,
            bookingId: bookingId,
          );
        }

        bookedModelList.add(BookedPropertyCardModel(
          bookingId: bookingId,
          propertyName: propertyData['name'],
          startDate: startingDate,
          endDate: (booking['endDate'] as Timestamp).toDate(),
          price: booking['totalPrice'].toString(),
          imageUrl: PickedFileModel.fromMap(
                  (propertyData['images'] as List<dynamic>).first)
              .base64file,
          status: bookedStatus,
          userId: booking['userId'] as String,
        ));
      }
      if (type == null || type == 'all') {
        return bookedModelList;
      } else {
        log('filtering bookings by $type');
        return bookedModelList
            .where(
              (element) => element.status.toLowerCase() == type,
            )
            .toList();
      }
    } on FormatException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFormatException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<BookedPropertyDetailsModel> fetchBookingDetails(
      {required String ownerId, required String bookingId}) async {
    try {
      //fetching bookingDetails
      final bookingData = await _services.fetchBookingDetails(
        ownerId: ownerId,
        bookingId: bookingId,
      );
      if (bookingData == null) {
        throw FormatException('Booking details data is null');
      }
      final bookingModel = BookingModel.fromMap(bookingData);

      final propertyData =
          await _services.fetchPropertyDetails(id: bookingModel.propertyId);

      final propertyDetailsModel = PropertyDetailsModel.fromMap(propertyData);

      final List<Map<String, dynamic>> roomDataList = [];

      for (var roomId in bookingModel.bookedRoomsId) {
        final roomData = await _services.fetchRoomDetails(
            propertyId: propertyDetailsModel.id!, roomId: roomId);
        roomDataList.add(roomData);
      }

      final List<RoomModel> roomModelList = roomDataList
          .map(
            (e) => RoomModel.fromMap(e),
          )
          .toList();

      final bookedPropertyDetailsModel = BookedPropertyDetailsModel(
        property: propertyDetailsModel,
        bookedRooms: roomModelList,
        bookingDetails: bookingModel,
      );

      return bookedPropertyDetailsModel;
    } on FormatException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFormatException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  // Future<void> cancelBooking({
  //   required BookedPropertyDetailsModel bookedPropertyDetailsModel,
  // }) async {
  //   try {
  //     await _services.cancelBooking(
  //         bookedPropertyDetailsModel: bookedPropertyDetailsModel);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}

TimeOfDay convertStringToTimeOfDay(String timeString) {
  final DateTime parsedTime = DateFormat.jm().tryParseLoose(timeString)!;
  return TimeOfDay(hour: parsedTime.hour, minute: parsedTime.minute);
}
