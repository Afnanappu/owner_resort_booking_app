import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/repository/my_property_repository.dart';

class PropertyTypeCubit extends Cubit<List<String>> {
  final MyPropertyRepository _repository;
  PropertyTypeCubit(this._repository) : super([]);

  void fetchRoomCategories() async {
    try {
      final data = await _repository.fetchPropertyCategories();
      emit(data);
    } catch (e) {
      emit(state);
    }
  }
}
