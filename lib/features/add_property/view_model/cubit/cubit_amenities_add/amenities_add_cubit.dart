import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/data/models/amenities_model.dart';
import 'package:owner_resort_booking_app/features/add_property/repository/add_property_repository.dart';

part 'amenities_add_state.dart';
part 'amenities_add_cubit.freezed.dart';

class AmenitiesAddCubit extends Cubit<AmenitiesAddState> {
  AmenitiesAddCubit(this._repository) : super(AmenitiesAddState.initial());

  final AddPropertyRepository _repository;
  // Update the list of selected amenities
  void updateAmenities(List<AmenitiesModel> selectedAmenities) {
    emit(AmenitiesAddState.picked([...selectedAmenities]));
    // log(state.toString());
  }

  List<AmenitiesModel> getPickedAmenities() {
    if (state is _Picked) {
      return (state as _Picked).amenitiesList;
    }
    return [];
  }

  Future<void> fetchAmenities() async {
    emit(AmenitiesAddState.loading());
    try {
      var amenitiesList = await _repository.fetchAmenities();
      emit(AmenitiesAddState.loaded(amenitiesList));
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      emit(AmenitiesAddState.error(e.toString()));
    }
  }

  // Clear all selected amenities
  void clearAmenities() {
    emit(AmenitiesAddState.initial());
  }
}
