part of 'property_room_list_bloc.dart';

@freezed
class PropertyRoomListState with _$PropertyRoomListState {
  const factory PropertyRoomListState.initial() = _Initial;
  const factory PropertyRoomListState.loading() = _Loading;
  const factory PropertyRoomListState.loaded(List<RoomModel> roomList) =
      _Loaded;
  const factory PropertyRoomListState.error(String message) = _Error;
}
