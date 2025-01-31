import 'dart:developer';

import 'package:owner_resort_booking_app/core/data/models/owner_model.dart';
import 'package:owner_resort_booking_app/core/data/services/owner_services.dart';

class OwnerRepository {
  final OwnerServices _services;

  OwnerRepository({required OwnerServices services}) : _services = services;

  Future<OwnerModel> fetchOwnerData() async {
    try {
      final data = await _services.fetchOwnerData();
      return OwnerModel.fromMap(data!);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
