part of 'property_room_details_bloc.dart';

@freezed
class PropertyRoomDetailsEvent with _$PropertyRoomDetailsEvent {
  const factory PropertyRoomDetailsEvent.started() = _Started;
}