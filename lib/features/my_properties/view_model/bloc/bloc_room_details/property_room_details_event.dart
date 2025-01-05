part of 'property_room_details_bloc.dart';

@freezed
class PropertyRoomDetailsEvent with _$PropertyRoomDetailsEvent {
  const factory PropertyRoomDetailsEvent.fetchRoomDetails(
      {required String propertyId, required String roomId}) = _FetchRoomDetails;
}
