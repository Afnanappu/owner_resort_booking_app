part of 'revenue_and_report_bloc.dart';

@freezed
class RevenueAndReportEvent with _$RevenueAndReportEvent {
  const factory RevenueAndReportEvent.fetchRevenueData() = _FetchRevenueData;
}
