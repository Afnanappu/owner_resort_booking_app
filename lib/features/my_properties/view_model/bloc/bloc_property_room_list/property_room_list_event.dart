part of 'property_room_list_bloc.dart';

@freezed
class PropertyRoomListEvent with _$PropertyRoomListEvent {
  const factory PropertyRoomListEvent.fetchRooms({required String propertyId}) =
      _FetchRooms;
}
