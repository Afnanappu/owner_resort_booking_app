part of 'upload_image_for_room_cubit.dart';

@freezed
class UploadImageForRoomState with _$UploadImageForRoomState {
  const factory UploadImageForRoomState.initial() = _Initial;
  const factory UploadImageForRoomState.picked(
      List<PickedFileModel> pickedImages) = _Picked;
  const factory UploadImageForRoomState.error(String error) = _Error;
}
