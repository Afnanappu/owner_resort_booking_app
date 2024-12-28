import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:owner_resort_booking_app/features/authentication/model/user_model.dart';
import 'package:owner_resort_booking_app/features/authentication/services/auth_services.dart';

class AuthRepository {
  final AuthServices _authServices;
  AuthRepository(this._authServices);

  Future<UserCredential> register(String email, String password) async {
    try {
      return await _authServices.register(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addOwnerToCollection(UserModel user) async {
    try {
      await _authServices.addOwnerToCollection(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(String email, String ownerId) async {
    try {
      final userCredential = await _authServices.login(email, ownerId);
      final user = await _authServices.fetchUserData(userCredential.user!.uid);
      return UserModel.fromMap(user!);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
