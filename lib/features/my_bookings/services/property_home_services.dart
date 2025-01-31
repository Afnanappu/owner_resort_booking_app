import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class PropertyHomeServices {
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');

  //All this owner property
  Future<List<Map<String, dynamic>>> fetchProperties(
      {required String type}) async {
    try {
      late final QuerySnapshot<Map<String, dynamic>> data;
      if (type == 'top-rated') {
        data = await _propertiesCollection
            .orderBy('rating', descending: true)
            .get();
      } else {
        data = await _propertiesCollection.get();
      }
      log(data.size.toString());
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
}
