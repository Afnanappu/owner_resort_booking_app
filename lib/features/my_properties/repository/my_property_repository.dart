import 'dart:developer';

import 'package:owner_resort_booking_app/features/my_properties/model/property_card_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_details_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/services/my_property_services.dart';

class MyPropertyRepository {
  final MyPropertyServices _services;

  MyPropertyRepository({required MyPropertyServices services})
      : _services = services;

  Future<List<PropertyCardModel>> fetchProperties({required String uid}) async {
    try {
      final data = await _services.fetchProperties(uid: uid);

      return data
          .map(
            (e) => PropertyCardModel.fromMap(e),
          )
          .toList();
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<PropertyDetailsModel> fetchPropertyDetails(
      {required String id}) async {
    try {
      final data = await _services.fetchPropertyDetails(id: id);
      return PropertyDetailsModel.fromMap(data);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
