import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/repository/add_property_repository.dart';

enum AdditionalOptionType {
  propertyCategories,
  // amenities,
  room,
  bed,
}

class GetPropertyTypeCubit extends Cubit<List<String>> {
  GetPropertyTypeCubit(this._addPropertyRepository) : super([]);
  final AddPropertyRepository _addPropertyRepository;
  Future<void> fetchAdditionalOptionsType(
      {required AdditionalOptionType type}) async {
    //get correct collection
    final collectionName = switch (type) {
      AdditionalOptionType.propertyCategories => 'Property_Categories',
      // AdditionalOptionType.amenities => 'Amenities',
      AdditionalOptionType.room => 'Room_Type',
      AdditionalOptionType.bed => 'Bed_Type',
    };

    try {
      final data = await _addPropertyRepository.fetchAdditionalOptionsTypes(
          collectionName: collectionName);
      emit(data);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      emit([]);
    }
  }
}
