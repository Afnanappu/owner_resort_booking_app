import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/data/models/user_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/repository/dashboard_repository.dart';

part 'customers_state.dart';
part 'customers_cubit.freezed.dart';

class CustomersCubit extends Cubit<CustomersState> {
  final DashboardRepository _dashboardRepository;
  CustomersCubit(this._dashboardRepository) : super(CustomersState.loading());

  Future<void> fetchAllCustomers() async {
    emit(CustomersState.loading());
    try {
      final customers = await _dashboardRepository.fetchAllCustomers();
      emit(CustomersState.loaded(customers));
    } on Exception catch (e) {
      emit(CustomersState.error(e.toString()));
    }
  }
}
