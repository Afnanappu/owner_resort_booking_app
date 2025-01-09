import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/models/room_model.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:owner_resort_booking_app/core/models/property_model.dart';

// final _propertyCollectionName =

class AddPropertyServices {
  final _additionalOptionCollection =
      FirebaseFirestore.instance.collection('additional_options');
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');
  final _roomCollectionName = 'rooms';

  Future<String> addProperty({required PropertyModel propertyModel}) async {
    try {
      final docRef = _propertiesCollection.doc();
      propertyModel.id = docRef.id;
      final data = propertyModel.toMap();
      log(propertyModel.toString());
      await docRef.set(data);

      log('A new property is added to the firebase');
      return propertyModel.id!;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<void> addRoom(
      {required String propertyId,
      required List<RoomModel> roomModelList}) async {
    try {
      final docRef = _propertiesCollection.doc(propertyId);
      final roomDocRef = docRef.collection(_roomCollectionName);
      for (var roomModel in roomModelList) {
        final roomDoc = roomDocRef.doc();
        roomModel.id = roomDoc.id;
        final data = roomModel.toMap();
        log(roomDoc.toString());

        await roomDoc.set(data);
      }

      log('A new rooms is added to the property $propertyId');
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<List<String>> fetchAdditionalOptionsTypes({required String collectionName}) async {
    try {
      final data = await _additionalOptionCollection
          .doc(collectionName)
          .collection('data')
          .get();

      return data.docs.map(
        (e) {
          final map = e.data();
          return map['name'] as String;
        },
      ).toList();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<List<Map<String, dynamic>>> fetchAmenities()async{
     try {
      final data = await _additionalOptionCollection
          .doc('Amenities')
          .collection('data')
          .get();

      return data.docs.map(
        (e) => e.data(),
      ).toList();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
