import 'dart:developer';

import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_card_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_details_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/services/my_property_services.dart';

class MyPropertyRepository {
  final MyPropertyServices _services;

  MyPropertyRepository({required MyPropertyServices services})
      : _services = services;

  Future<List<PropertyCardModel>> fetchProperties({
    required String uid,
    String? search,
    FilterOptions? filterOptions,
    String? priceRange,
    List<String> category = const [],
    int? rating,
  }) async {
    try {
      final data = await _services.fetchProperties(
        uid: uid,
        search: search,
        filterOptions: filterOptions,
        category: category,
        priceRange: priceRange,
        rating: rating,
      );

      final modelList = data
          .map(
            (e) => PropertyCardModel.fromMap(e),
          )
          .toList();

      if (search != null) {
        return modelList
            .where(
              (element) => element.name.toLowerCase().contains(
                    search.toLowerCase(),
                  ),
            )
            .toList();
      } else {
        return modelList;
      }
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

  Future<void> deleteProperty(String id) async {
    try {
      await _services.deleteProperty(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RoomModel>> fetchPropertyRooms(
      {required String propertyId}) async {
    try {
      final data = await _services.fetchPropertyRooms(propertyId: propertyId);
      return data
          .map(
            (e) => RoomModel.fromMap(e),
          )
          .toList();
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  //fetch room details
  Future<RoomModel> fetchRoomDetails(
      {required String propertyId, required String roomId}) async {
    try {
      final data = await _services.fetchRoomDetails(
        propertyId: propertyId,
        roomId: roomId,
      );
      return RoomModel.fromMap(data);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<List<String>> fetchPropertyCategories() async {
    try {
      return await _services.fetchPropertyCategories();
    } catch (e) {
      rethrow;
    }
  }
}
