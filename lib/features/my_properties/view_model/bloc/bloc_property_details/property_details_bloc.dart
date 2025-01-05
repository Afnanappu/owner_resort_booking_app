import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_details_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/repository/my_property_repository.dart';

part 'property_details_event.dart';
part 'property_details_state.dart';
part 'property_details_bloc.freezed.dart';

class PropertyDetailsBloc
    extends Bloc<PropertyDetailsEvent, PropertyDetailsState> {
  final MyPropertyRepository _repository;

  PropertyDetailsBloc(this._repository) : super(_Initial()) {
    on<_FetchPropertyDetails>((event, emit) async {
      emit(PropertyDetailsState.loading());

      try {
        final propertyDetailsModel =
            await _repository.fetchPropertyDetails(id: event.id);
        emit(PropertyDetailsState.loaded(propertyDetailsModel));
        log(propertyDetailsModel.toString());
      } catch (e) {
        emit(PropertyDetailsState.error(e.toString()));
      }
    });
  }

  String? getPropertyId() {
    if (state is _Loaded) {
      return (state as _Loaded).propertyDetails.id;
    }
    return null;
  }
}
