import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/repository/dashboard_repository.dart';

part 'revenue_and_report_event.dart';
part 'revenue_and_report_state.dart';
part 'revenue_and_report_bloc.freezed.dart';

class RevenueAndReportBloc
    extends Bloc<RevenueAndReportEvent, RevenueAndReportState> {
  final DashboardRepository _dashboardRepository;
  RevenueAndReportBloc(this._dashboardRepository) : super(_Loading()) {
    on<_FetchRevenueData>((event, emit) async {
      //
      emit(RevenueAndReportState.loading());
      try {
        final data = await _dashboardRepository.fetchRevenueAndReportData();
        emit(RevenueAndReportState.loaded(data));
      } catch (e) {
        emit(RevenueAndReportState.error(e.toString()));
      }
    });
  }
}
