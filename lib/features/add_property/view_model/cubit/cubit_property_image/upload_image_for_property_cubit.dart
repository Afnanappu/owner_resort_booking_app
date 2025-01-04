import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/core/utils/app_file_picker.dart';

part 'upload_image_for_property_state.dart';
part 'upload_image_for_property_cubit.freezed.dart';

class UploadImageForPropertyCubit extends Cubit<UploadImageForPropertyState> {
  UploadImageForPropertyCubit() : super(UploadImageForPropertyState.initial());

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set updateCurrentIndex(int index) {
    _currentIndex = index;
  }

  Future<void> pickImage() async {
    try {
      final pickedImages = await pickMultiFileFromDevice(allowPdf: false);

      // If no images are picked, maintain the current state
      if (pickedImages.isEmpty) {
        // Simply return without emitting a new state
        return;
      }

      emit(UploadImageForPropertyState.picked(pickedImages));
    } catch (e) {
      final currentState = state;

      if (currentState is _Picked) {
        emit(UploadImageForPropertyState.picked(currentState.pickedImages));
      } else {
        emit(UploadImageForPropertyState.error(e.toString()));
      }
    }
  }

  void removeImage(PickedFileModel image) {
    if (state is _Picked) {
      final currentState = state as _Picked;
      final updatedList = List<PickedFileModel>.from(currentState.pickedImages);
      updatedList.remove(image);
      emit(UploadImageForPropertyState.picked(updatedList));
    }
  }

  void clear() {
    emit(UploadImageForPropertyState.initial());
  }
}
