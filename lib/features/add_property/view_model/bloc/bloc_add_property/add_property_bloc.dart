import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/data/models/property_model.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/features/add_property/repository/add_property_repository.dart';

part 'add_property_event.dart';
part 'add_property_state.dart';
part 'add_property_bloc.freezed.dart';

class AddPropertyBloc extends Bloc<AddPropertyEvent, AddPropertyState> {
  final AddPropertyRepository _addPropertyRepository;
  bool isEdit = false;
  AddPropertyBloc(this._addPropertyRepository) : super(_Initial()) {
    //add property logic
    on<_AddProperty>((event, emit) async {
      emit(AddPropertyState.loading());

      try {
        await _addPropertyRepository.addProperty(
          propertyModel: event.propertyModel,
          roomModelList: event.roomModelList,
        );
        emit(AddPropertyState.added());
      } catch (e) {
        emit(AddPropertyState.error(e.toString()));
      }
    });
    on<_UpdateProperty>((event, emit) async {
      emit(AddPropertyState.loading());

      try {
        await _addPropertyRepository.updateProperty(
          propertyModel: event.propertyModel,
          roomModelList: event.roomModelList,
        );
        emit(AddPropertyState.added());
      } catch (e) {
        emit(AddPropertyState.error(e.toString()));
      }
    });

    
  }
}
