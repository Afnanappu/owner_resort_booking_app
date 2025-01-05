import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/utils/custom_exceptions.dart';

class MyPropertyServices {
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');
  final _roomCollectionName = 'rooms';
  //All this owner property
  Future<List<Map<String, dynamic>>> fetchProperties(
      {required String uid}) async {
    try {
      final ownerPropertyQuery =
          _propertiesCollection.where('ownerId', isEqualTo: uid);
      final data = await ownerPropertyQuery.get();

      return data.docs
          .map(
            (e) => e.data(),
          )
          .toList();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  //Property details
  Future<Map<String, dynamic>> fetchPropertyDetails(
      {required String id}) async {
    try {
      final data = await _propertiesCollection.doc(id).get();
      return data.data()!;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<List<Map<String, dynamic>>> fetchPropertyRooms(
      {required String propertyId}) async {
    try {
      final data = await _propertiesCollection
          .doc(propertyId)
          .collection(_roomCollectionName)
          .get();
      return data.docs
          .map(
            (e) => e.data(),
          )
          .toList();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  //Property details
  Future<Map<String, dynamic>> fetchRoomDetails({
    required String propertyId,
    required String roomId,
  }) async {
    try {
      //fetching room details form room collection
      final data = await _propertiesCollection
          .doc(propertyId)
          .collection(_roomCollectionName)
          .doc(roomId)
          .get();
      return data.data()!;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
