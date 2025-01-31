import 'dart:developer';

import 'package:owner_resort_booking_app/features/authentication/model/owner_auth_model.dart';
import 'package:owner_resort_booking_app/features/authentication/services/auth_services.dart';

class AuthRepository {
  final AuthServices _authServices;
  AuthRepository(this._authServices);

  Future<void> register({
    required String email,
    required String password,
    required OwnerAuthModel user,
  }) async {
    try {
      await _authServices.register(
          email: email, password: password, user: user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addOwnerToCollection(OwnerAuthModel user) async {
    try {
      await _authServices.addOwnerToCollection(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<OwnerAuthModel> login(String email, String ownerId) async {
    try {
      final userCredential = await _authServices.login(email, ownerId);
      final user = await _authServices.fetchUserData(userCredential.user!.uid);
      return OwnerAuthModel.fromMap(user!);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
