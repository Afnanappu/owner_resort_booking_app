import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/models/amenities_model.dart';

class AmenitiesAddCubit extends Cubit<List<AmenitiesModel>> {
  AmenitiesAddCubit() : super([]);

  // Update the list of selected amenities
  void updateAmenities(List<AmenitiesModel> selectedAmenities) {
    emit([...selectedAmenities]);
    log(state.toString());
  }

  // Add a single amenity to the list
  // void addAmenity(AmenitiesModel amenity) {
  //   final updatedList = List<String>.from(state);
  //   if (!updatedList.contains(amenity)) {
  //     updatedList.add(amenity);
  //     emit(updatedList);
  //   }
  // }

  // Remove a single amenity from the list
  // void removeAmenity(String amenity) {
  //   final updatedList = List<String>.from(state);
  //   if (updatedList.contains(amenity)) {
  //     updatedList.remove(amenity);
  //     emit(updatedList);
  //   }
  // }

  // Clear all selected amenities
  void clearAmenities() {
    emit([]);
  }
}
