import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/data/models/basic_details_model.dart';
import 'package:owner_resort_booking_app/core/data/models/extra_details_model.dart';
import 'package:owner_resort_booking_app/core/data/models/rules_details_model.dart';

class ExtraDetailsCubit extends Cubit<ExtraDetailsModel?> {
  ExtraDetailsCubit() : super(null);

  ExtraDetailsModel? _previousExtraDetailsState;

  ExtraDetailsModel? get getPreviousExtraDetailsState =>
      _previousExtraDetailsState;

  set setPreviousExtraDetailsState(ExtraDetailsModel? extraDetailsState) =>
      _previousExtraDetailsState = extraDetailsState;

  void setExtraDetails(ExtraDetailsModel? extraDetails) {
    emit(extraDetails);
  }

  void clear() {
    emit(null);
  }

  void clearPreviousState() {
    _previousExtraDetailsState = null;
  }

  BasicDetailsModel? get getBasicDetails => state?.basicDetailsModel;
  RulesDetailsModel? get getRules => state?.rulesDetailsModel;
}
