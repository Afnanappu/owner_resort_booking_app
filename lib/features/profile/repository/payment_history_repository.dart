// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:owner_resort_booking_app/core/data/models/transaction_model.dart';
import 'package:owner_resort_booking_app/core/data/services/transaction_services.dart';
import 'package:owner_resort_booking_app/features/profile/model/payment_history_card_model.dart';
import 'package:owner_resort_booking_app/features/profile/services/payment_history_services.dart';

class PaymentHistoryRepository {
  
  final TransactionServices _transactionServices;
  PaymentHistoryRepository({
    required PaymentHistoryServices paymentHistoryServices,
    required TransactionServices transactionServices,
  })  : 
        _transactionServices = transactionServices;

  Future<List<PaymentHistoryModel>> fetchMyPaymentTransactions({
    required String ownerId,
  }) async {
    try {
      final transactionData = await _transactionServices
          .fetchMyPaymentTransactions(ownerId: ownerId);

      final transactionModels = transactionData
          .map(
            (e) => TransactionModel.fromMap(e!),
          )
          .toList();
      final paymentHistoryList = <PaymentHistoryModel>[];
      for (var element in transactionModels) {
        final ownerData = await _transactionServices.userData(element.userId);
        final name = ownerData!['name'] as String;
        final profile = ownerData['profilePicture'] != null
            ? ownerData['profilePicture'] as String
            : null;
        paymentHistoryList.add(
          PaymentHistoryModel(
            payerName: name,
            profile: profile,
            transactionModel: element,
          ),
        );
      }

      //sort it based on time.
      paymentHistoryList.sort(
        (a, b) => b.transactionModel.transactionDate
            .compareTo(a.transactionModel.transactionDate),
      );
      return paymentHistoryList;
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
