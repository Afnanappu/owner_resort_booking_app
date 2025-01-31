import 'dart:developer';

import 'package:owner_resort_booking_app/core/data/models/user_model.dart';
import 'package:owner_resort_booking_app/core/data/services/user_services.dart';

class UserRepository {
  final UserServices _services;

  UserRepository({required UserServices services}) : _services = services;

  Future<UserModel> fetchUserData(String userId) async {
    try {
      final data = await _services.fetchUserData(userId);
      return UserModel.fromMap(data!);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
