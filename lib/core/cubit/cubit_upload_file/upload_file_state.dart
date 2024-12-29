part of 'upload_file_cubit.dart';

@freezed
class UploadFileState with _$UploadFileState {
  const factory UploadFileState.initial(List<PickedFileModel> proof) = _Initial;
  const factory UploadFileState.picked(List<PickedFileModel> proof) = _Picked;
  const factory UploadFileState.error(String error) = _Error;
}
