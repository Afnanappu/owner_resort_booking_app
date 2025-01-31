import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class OwnerServices {
  Future<Map<String, dynamic>?> fetchOwnerData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      final data =
          await FirebaseFirestore.instance.collection('owners').doc(uid).get();
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
