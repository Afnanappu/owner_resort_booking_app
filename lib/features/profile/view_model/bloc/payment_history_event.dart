part of 'payment_history_bloc.dart';

@freezed
class PaymentHistoryEvent with _$PaymentHistoryEvent {
  const factory PaymentHistoryEvent.fetchPaymentHistory({
    required String ownerId,
  }) = _FetchPaymentHistory;
}
