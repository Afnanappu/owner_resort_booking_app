import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:owner_resort_booking_app/features/profile/view_model/bloc/payment_history_bloc.dart';
import 'package:owner_resort_booking_app/features/profile/views/components/payment_history_card.dart';

class ScreenPaymentHistory extends StatelessWidget {
  const ScreenPaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ownerId = context.read<OwnerDataCubit>().state!.uid!;
      context.read<PaymentHistoryBloc>().add(
            PaymentHistoryEvent.fetchPaymentHistory(ownerId: ownerId),
          );
    });
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment History',
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          final ownerId = context.read<OwnerDataCubit>().state!.uid!;
          context.read<PaymentHistoryBloc>().add(
                PaymentHistoryEvent.fetchPaymentHistory(ownerId: ownerId),
              );
        },
        child: BlocBuilder<PaymentHistoryBloc, PaymentHistoryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Center(
                child: CustomCircularProgressIndicator(),
              ),
              initial: () => Center(
                child: CustomCircularProgressIndicator(),
              ),
              error: (error) => Center(
                child: Text(error),
              ),
              orElse: () => Center(
                child: Text('An unexpected error occurred'),
              ),
              loaded: (transactions) {
                return transactions.isEmpty
                    ? Center(
                        child: Text('No transaction found'),
                      )
                    : ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final payment = transactions[index];

                          return PaymentHistoryCard(
                            userName: payment.payerName,
                            profile: payment.profile,
                            amount: payment.transactionModel.amount,
                            transactionDate: customDateFormat3(
                              payment.transactionModel.transactionDate,
                            ),
                            status: payment.transactionModel.status == 'failed'
                                ? 'failed'
                                : payment.transactionModel.type,
                          );
                        },
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
