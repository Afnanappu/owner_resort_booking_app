import 'package:firebase_auth/firebase_auth.dart';
import 'package:owner_resort_booking_app/core/models/user_model.dart';
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

  Future<void> addOwnerToCollection(UserModel user)async{
    try {
      await _authServices.addOwnerToCollection(user);
    } catch (e) {
      rethrow;
    }
  }
}
