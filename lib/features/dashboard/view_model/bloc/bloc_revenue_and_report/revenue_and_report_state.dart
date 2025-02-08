part of 'revenue_and_report_bloc.dart';

@freezed
class RevenueAndReportState with _$RevenueAndReportState {
  const factory RevenueAndReportState.loading() = _Loading;
  const factory RevenueAndReportState.loaded(RevenueModel revenueModel) =
      _Loaded;
  const factory RevenueAndReportState.error(String error) = _Error;
}
