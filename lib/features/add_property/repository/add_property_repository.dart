import 'package:owner_resort_booking_app/features/add_property/model/add_property_model.dart';
import 'package:owner_resort_booking_app/features/add_property/services/add_property_services.dart';

class AddPropertyRepository {
  final AddPropertyServices _addPropertyServices;

  AddPropertyRepository({required AddPropertyServices addPropertyServices})
      : _addPropertyServices = addPropertyServices;

  Future<void> addProperty({required AddPropertyModel propertyModel}) async {
    try {
      await _addPropertyServices.addProperty(propertyModel: propertyModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> fetchPropertyTypes() async {
    try {
      return await _addPropertyServices.fetchPropertyTypes();
    } catch (e) {
      rethrow;
    }
  }
}
