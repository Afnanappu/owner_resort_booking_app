import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owner_resort_booking_app/core/models/user_model.dart';

class AuthServices {
  final ownerCollection = 'owners';

  Future<UserCredential> register(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, stack) {
      if (e.code == 'email-already-in-use') {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'Email is already in use, try login';
      } else if (e.code == 'invalid-email') {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'Invalid email, try again';
      } else if (e.code == 'network-request-failed') {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'Network issue occurred, try again';
      } else if (e.code == 'too-many-requests') {
        log(e.toString(), stackTrace: stack);
        throw 'Too many requests, try again later';
      } else {
        log(e.toString(), stackTrace: stack);
        throw 'An unknown error occurred while registering, try again';
      }
    } catch (e) {
      throw 'An unknown error occurred while registering, try again';
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
      if (e.code == 'user-not-found') {
        log(e.toString(), stackTrace: stack);
        throw 'No user found with this email, try registering';
      } else if (e.code == 'invalid-email') {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'Invalid email, try again';
      } else if (e.code == 'wrong-password') {
        log(e.toString(), stackTrace: stack);
        throw 'Wrong password, try again';
      } else if (e.code == 'too-many-requests') {
        log(e.toString(), stackTrace: stack);
        throw 'Too many requests, try again later';
      } else if (e.code == 'network-request-failed') {
        log(e.toString(), stackTrace: e.stackTrace);
        throw 'Network issue occurred, try again';
      } else {
        log(e.toString(), stackTrace: stack);
        throw 'An unknown error occurred while registering, try again';
      }
    } catch (e) {
      throw 'An unknown error occurred while registering, try again';
    }
  }

  Future<Map<String, dynamic>?> fetchUserData(String uid) async {
    try {
      final userData = await FirebaseFirestore.instance
          .collection(ownerCollection)
          .doc(uid)
          .get();
      return userData.data();
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw 'error occurred while fetching the owner data';
    }
  }
}
