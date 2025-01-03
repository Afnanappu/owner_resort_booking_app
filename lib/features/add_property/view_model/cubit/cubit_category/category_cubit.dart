import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/repository/add_property_repository.dart';

class GetPropertyTypeCubit extends Cubit<List<String>> {
  GetPropertyTypeCubit(this._addPropertyRepository) : super([]);
  final AddPropertyRepository _addPropertyRepository;
  Future<void> fetchPropertyTypes() async {
    try {
      final data = await _addPropertyRepository.fetchPropertyTypes();
      emit(data);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      emit([]);
    }
  }
}
