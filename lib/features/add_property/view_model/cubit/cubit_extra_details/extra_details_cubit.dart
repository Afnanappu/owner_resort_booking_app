import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/models/extra_details_model.dart';

class ExtraDetailsCubit extends Cubit<ExtraDetailsModel?> {
  ExtraDetailsCubit() : super(null);

  void setExtraDetails(ExtraDetailsModel extraDetails) {
    emit(extraDetails);
  }

  void clear() {
    emit(null);
  }
}
