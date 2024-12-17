import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owner_resort_booking_app/core/models/user_model.dart';

class AuthServices {
  // final dio = Dio();

  Future<UserCredential> register(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'Email is already in use, try login';
      } else if (e.code == 'invalid-email') {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'Invalid email, try again';
      } else if (e.code == 'network-request-failed') {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'Network issue occurred, try again';
      } else {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'An unknown error occurred while registering, try again';
      }
    }
  }

  Future<void> addOwnerToCollection(UserModel user) async {
    final db = FirebaseFirestore.instance;

    final userData = user.toMap();

    await db.collection('owners').add(userData).then((value) {
      log('New document added in owners collection with ID: ${value.parent.parameters}');
    }).onError(
      (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        throw error ??
            "An unexpected error occurred while registering, try again";
      },
    );
  }
}
