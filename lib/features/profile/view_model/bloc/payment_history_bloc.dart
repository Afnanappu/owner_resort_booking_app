import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/profile/model/payment_history_card_model.dart';
import 'package:owner_resort_booking_app/features/profile/repository/payment_history_repository.dart';

part 'payment_history_event.dart';
part 'payment_history_state.dart';
part 'payment_history_bloc.freezed.dart';

class PaymentHistoryBloc
    extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {
  final PaymentHistoryRepository _repository;
  PaymentHistoryBloc(this._repository) : super(_Loading()) {
    on<_FetchPaymentHistory>((event, emit) async {
      emit(PaymentHistoryState.loading());

      try {
        final transactions =
            await _repository.fetchMyPaymentTransactions(
            ownerId: event.ownerId);
        emit(PaymentHistoryState.loaded(transactions));
      } catch (e) {
        emit(PaymentHistoryState.error(e.toString()));
      }
    });
  }
}
