part of 'property_room_details_bloc.dart';

@freezed
class PropertyRoomDetailsState with _$PropertyRoomDetailsState {
  const factory PropertyRoomDetailsState.initial() = _Initial;
  const factory PropertyRoomDetailsState.loading() = _Loading;
  const factory PropertyRoomDetailsState.loaded(RoomModel roomModel) = _Loaded;
  const factory PropertyRoomDetailsState.error(String message) = _Error;
}
