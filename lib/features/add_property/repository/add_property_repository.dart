import 'package:owner_resort_booking_app/core/models/amenities_model.dart';
import 'package:owner_resort_booking_app/core/models/property_model.dart';
import 'package:owner_resort_booking_app/core/models/room_model.dart';
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
