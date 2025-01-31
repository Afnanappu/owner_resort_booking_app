import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/data/models/sub_details_model.dart';

class SubDetailsCubit extends Cubit<List<SubDetailsModel>> {
  SubDetailsCubit() : super([]);

  List<SubDetailsModel> _previousSubDetailsState = [];

  set setPreviousSubDetailsState(List<SubDetailsModel> subDetailsState) =>
      _previousSubDetailsState = subDetailsState;

  List<SubDetailsModel> get getPreviousSubDetailsState =>
      _previousSubDetailsState;

  void clearPreviousState() {
    _previousSubDetailsState = [];
  }

  void addSubDetails(SubDetailsModel subDetails) {
    final updatedList = List<SubDetailsModel>.from(state)..add(subDetails);
    emit(updatedList);
  }

  void removeSubDetails(SubDetailsModel subDetails) {
    final updatedList = List<SubDetailsModel>.from(state)..remove(subDetails);
    emit(updatedList);
  }

  void setAllSubDetails(List<SubDetailsModel> subDetails) {
    final updatedList = List<SubDetailsModel>.from(subDetails);
    emit(updatedList);
  }

  void updateSubDetails(index, SubDetailsModel subDetails) {
    state[index] = subDetails;
    emit(state);
  }

  void clear() {
    emit([]);
  }
}
