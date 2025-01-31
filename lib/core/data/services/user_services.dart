import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class UserServices {
  Future<Map<String, dynamic>?> fetchUserData(String userId) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return data.data();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
