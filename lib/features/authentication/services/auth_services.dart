import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owner_resort_booking_app/features/authentication/model/user_model.dart';
import 'package:owner_resort_booking_app/core/utils/custom_exceptions.dart';

class AuthServices {
  final ownerCollection = 'owners';

  Future<UserCredential> register(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirebaseAuthException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<void> addOwnerToCollection(UserModel user) async {
    final db = FirebaseFirestore.instance;

    final userData = user.toMap();

    await db.collection(ownerCollection).doc(user.uid).set(userData).then((_) {
      log('New document added in owners collection with ID');
    }).onError(
      (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        throw error ??
            "An unexpected error occurred while registering, try again";
      },
    );
  }

  Future<UserCredential> login(String email, String ownerId) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: ownerId);
    } on FirebaseAuthException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirebaseAuthException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<Map<String, dynamic>?> fetchUserData(String uid) async {
    try {
      final userData = await FirebaseFirestore.instance
          .collection(ownerCollection)
          .doc(uid)
          .get();
      return userData.data();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
