import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owner_resort_booking_app/core/data/models/owner_model.dart';
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

  
  Future<void> updateOwnerData(OwnerModel ownerModel) async {
    try {
      final newUserModel = Map.fromEntries(
        ownerModel.toMap().entries.where(
              (entry) => entry.value != null,
            ),
      );
      await FirebaseFirestore.instance
          .collection('owners')
          .doc(ownerModel.uid)
          .update(newUserModel);
      log('Owner data is updated');
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }


  
  Stream<bool> isOwnerBlocked() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      return FirebaseFirestore.instance
          .collection('owners')
          .doc(uid)
          .snapshots()
          .map(
        (event) {
          if (event.exists) {
            return event.data()?['isBlocked'] ?? false;
          }
          return false;
        },
      );
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
