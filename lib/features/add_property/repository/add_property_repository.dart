import 'dart:developer';

import 'package:owner_resort_booking_app/core/data/models/amenities_model.dart';
import 'package:owner_resort_booking_app/core/data/models/property_model.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/features/add_property/services/add_property_services.dart';

class AddPropertyRepository {
  final AddPropertyServices _addPropertyServices;

  AddPropertyRepository({required AddPropertyServices addPropertyServices})
      : _addPropertyServices = addPropertyServices;

  Future<void> addProperty({
    required PropertyModel propertyModel,
    required List<RoomModel> roomModelList,
  }) async {
    try {
      //First adding the resort
      final propertyId =
          await _addPropertyServices.addProperty(propertyModel: propertyModel);

      //Then adding room to the same property
      await _addPropertyServices.addRoom(
          propertyId: propertyId, roomModelList: roomModelList);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProperty({
    required PropertyModel propertyModel,
    required List<RoomModel> roomModelList,
  }) async {
    try {
      await _addPropertyServices.updateProperty(
          id: propertyModel.id!, propertyModel: propertyModel);

      //Then adding room to the same property
      await _addPropertyServices.updateRooms(
          propertyId: propertyModel.id!, roomModelList: roomModelList);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<List<RoomModel>> fetchRooms(String propertyId) async {
    final data = await _addPropertyServices.fetchRooms(propertyId);

    return data
        .map(
          (e) => RoomModel.fromMap(e),
        )
        .toList();
  }

  Future<List<String>> fetchAdditionalOptionsTypes(
      {required String collectionName}) async {
    try {
      return await _addPropertyServices.fetchAdditionalOptionsTypes(
          collectionName: collectionName);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AmenitiesModel>> fetchAmenities() async {
    try {
      final data = await _addPropertyServices.fetchAmenities();
      return data
          .map(
            (e) => AmenitiesModel.fromMap(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
