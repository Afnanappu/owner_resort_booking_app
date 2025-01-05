import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/models/room_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/repository/my_property_repository.dart';

part 'property_room_list_event.dart';
part 'property_room_list_state.dart';
part 'property_room_list_bloc.freezed.dart';

class PropertyRoomListBloc
    extends Bloc<PropertyRoomListEvent, PropertyRoomListState> {
  final MyPropertyRepository _repository;

  PropertyRoomListBloc(this._repository) : super(_Initial()) {
    on<_FetchRooms>((event, emit) async {
      emit(PropertyRoomListState.loading());

      try {
        final roomList =
            await _repository.fetchPropertyRooms(propertyId: event.propertyId);
        emit(PropertyRoomListState.loaded(roomList));
        log(roomList.toString());
      } catch (e) {
        emit(PropertyRoomListState.error(e.toString()));
      }
    });
  }
}
