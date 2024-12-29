import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';

part 'upload_file_state.dart';
part 'upload_file_cubit.freezed.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit() : super(UploadFileState.initial([]));

  List<PickedFileModel> pickedFiles = [];

  void setFiles({List<PickedFileModel>? files}) {
    if (files != null) {
      final newList = [...pickedFiles, ...files];
      emit(UploadFileState.picked(newList));
      pickedFiles = newList;
      log('selected multiple');
    }
  }

  void clear() {
    emit(UploadFileState.initial([]));
    pickedFiles.clear();
  }
}
