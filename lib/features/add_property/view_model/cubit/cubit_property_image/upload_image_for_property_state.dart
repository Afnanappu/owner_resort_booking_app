part of 'upload_image_for_property_cubit.dart';

@freezed
class UploadImageForPropertyState with _$UploadImageForPropertyState {
  const factory UploadImageForPropertyState.initial() = _Initial;
  const factory UploadImageForPropertyState.picked(
      List<PickedFileModel> pickedImages) = _Picked;
  const factory UploadImageForPropertyState.error(String error) = _Error;
}
