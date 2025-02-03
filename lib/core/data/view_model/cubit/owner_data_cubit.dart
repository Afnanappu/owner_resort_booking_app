import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/data/models/owner_model.dart';
import 'package:owner_resort_booking_app/core/data/repository/owner_repository.dart';

class OwnerDataCubit extends Cubit<OwnerModel?> {
  final OwnerRepository _repository;
  OwnerDataCubit(this._repository) : super(null);

  Future<void> fetchOwnerData() async {
    final user = await _repository.fetchOwnerData();
    emit(user);
  }

  void setUser(OwnerModel ownerModel) {
    emit(ownerModel);
  }
}
