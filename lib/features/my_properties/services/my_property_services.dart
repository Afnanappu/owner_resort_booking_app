import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/utils/custom_exceptions.dart';

class MyPropertyServices {
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');


  //All this owner property
  Future<List<Map<String, dynamic>>> fetchProperties(
      {required String uid}) async {
    try {
      final data =
          await _propertiesCollection.where('ownerId', isEqualTo: uid).get();
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
