part of 'payment_history_bloc.dart';

@freezed
class PaymentHistoryState with _$PaymentHistoryState {
  const factory PaymentHistoryState.initial() = _Initial;
  const factory PaymentHistoryState.loading() = _Loading;
  const factory PaymentHistoryState.loaded(
    List<PaymentHistoryModel> transactions,
  ) = _Loaded;
  const factory PaymentHistoryState.error(String error) = _Error;
}
