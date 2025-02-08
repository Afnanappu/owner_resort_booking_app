import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/dashboard_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/repository/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _dashboardRepository;
  DashboardBloc(this._dashboardRepository) : super(_Loading()) {
    on<_FetchDashboardDetails>((event, emit) async {
      emit(_Loading());
      try {
        final data = await _dashboardRepository.getDashboardData(
          ownerId: event.ownerId,
        );
        emit(_Loaded(data));
      } catch (e, stack) {
        log(e.toString(), stackTrace: stack);
        emit(_Error(e.toString()));
      }
    });
  }
}
