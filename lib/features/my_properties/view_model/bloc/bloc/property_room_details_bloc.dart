
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/my_property_room_details_model.dart';

part 'property_room_details_event.dart';
part 'property_room_details_state.dart';
part 'property_room_details_bloc.freezed.dart';

class PropertyRoomDetailsBloc extends Bloc<PropertyRoomDetailsEvent, PropertyRoomDetailsState> {
  PropertyRoomDetailsBloc() : super(_Initial()) {
    on<PropertyRoomDetailsEvent>((event, emit) {
     
    });
  }
}
