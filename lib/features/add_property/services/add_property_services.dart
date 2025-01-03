import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/utils/custom_exceptions.dart';
import 'package:owner_resort_booking_app/features/add_property/model/add_property_model.dart';

class AddPropertyServices {
  final _additionalOptionCollection =
      FirebaseFirestore.instance.collection('additional_options');
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');

  Future<void> addProperty({required AddPropertyModel propertyModel}) async {
    try {
      final docRef = _propertiesCollection.doc();
      propertyModel.id = docRef.id;
      final data = propertyModel.toMap();
      log(propertyModel.toString());

      await docRef.set(data);
      log('A new property is added to the firebase');
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<List<String>> fetchPropertyTypes() async {
    try {
      final data = await _additionalOptionCollection
          .doc('Property_Categories')
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
}
