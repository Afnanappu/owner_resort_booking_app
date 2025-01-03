import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';

part 'upload_file_state.dart';
part 'upload_file_cubit.freezed.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit() : super(UploadFileState.initial([]));

  void setFiles({List<PickedFileModel>? files}) {
    if (files != null) {
      if (state is _Picked) {
        final currentState = state as _Picked;
        final existingFiles =
            List<PickedFileModel>.from(currentState.pickedFiles);
        final updatedFiles = existingFiles..addAll(files);
        emit(UploadFileState.picked(updatedFiles));
      } else {
        emit(UploadFileState.picked(
          List<PickedFileModel>.from(files),
        ));
      }
      log('Files updated: ${files.length} new files added');
    }
  }

  void removeOneFromList(int index) {
    // pickedFiles.removeAt(index);
    if (state is _Picked) {
      final currentState = state as _Picked;
      final updateItem = List<PickedFileModel>.from(currentState.pickedFiles);
      updateItem.removeAt(index);
      if (updateItem.isEmpty) {
        emit(UploadFileState.initial([]));
      } else {
        emit(UploadFileState.picked(updateItem));
      }
      log('One file at the index $index is removed form the list');
    }
  }

  void clear() {
    emit(UploadFileState.initial([]));
  }
}
