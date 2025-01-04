import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/models/sub_details_model.dart';

class SubDetailsCubit extends Cubit<List<SubDetailsModel>> {
  SubDetailsCubit() : super([]);

  void addSubDetails(SubDetailsModel subDetails) {
    final updatedList = List<SubDetailsModel>.from(state)..add(subDetails);
    emit(updatedList);
  }

  void clear() {
    emit([]);
  }
}
