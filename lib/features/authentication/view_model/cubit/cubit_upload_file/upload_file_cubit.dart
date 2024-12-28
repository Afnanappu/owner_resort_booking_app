import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/authentication/model/picked_file_model.dart';

part 'upload_file_state.dart';
part 'upload_file_cubit.freezed.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit() : super(UploadFileState.initial([]));

  List<PickedFileModel> personalProof = [];

  void setFiles({List<PickedFileModel>? proof}) {
    if (proof != null) {
      log("personal: ${personalProof.length} + proof: ${proof.length}");
      final newList = [...personalProof, ...proof];
      emit(UploadFileState.picked(newList));
      personalProof = newList;
      log('selected multiple');
    }
  }

  void clear() {
    emit(UploadFileState.initial([]));
    personalProof.clear();
  }
}
