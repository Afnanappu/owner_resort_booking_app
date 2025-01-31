import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/data/models/transaction_model.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class TransactionServices {
  final _userCollection = FirebaseFirestore.instance.collection('users');
  final _ownerCollection = FirebaseFirestore.instance.collection('owners');
  final _transactionCollectionName = 'transactions';

  Future<void> makeTransaction({
    required TransactionModel transactionModel,
    WriteBatch? batch,
    bool user = true,
    bool owner = true,
  }) async {
    try {
      final ownerId = transactionModel.ownerId;
      final userId = transactionModel.userId;
      final isBatchNull = batch == null;
      batch ??= FirebaseFirestore.instance.batch();

      if (user) {
        final userRef = _userCollection
            .doc(userId)
            .collection(_transactionCollectionName)
            .doc(transactionModel.transactionId);

        batch.set(userRef, transactionModel.toMap());
      }

      if (owner) {
        final ownerTransactionModel = transactionModel.copyWith(
          type: transactionModel.type == 'credited' ? 'debited' : 'credited',
        );
        final ownerRef = _ownerCollection
            .doc(ownerId)
            .collection(_transactionCollectionName)
            .doc(transactionModel.transactionId);

        batch.set(
          ownerRef,
          ownerTransactionModel.toMap(),
        );
      }

      //make the payment type opposite in the owner side
      if (isBatchNull) {
        await batch.commit();
      }
      log('Transaction ${transactionModel.transactionId} completed successfully');
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<List<Map<String, dynamic>?>> fetchMyPaymentTransactions({
    required String ownerId,
  }) async {
    //
    try {
      final data = await _ownerCollection
          .doc(ownerId)
          .collection(_transactionCollectionName)
          .get();

      //TODO: maybe wanted to change 'data.docChanges' to  'data.docs'
      return data.docChanges
          .map(
            (e) => e.doc.data(),
          )
          .toList();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<Map<String, dynamic>?> userData(String userId) async {
    try {
      final data = await _userCollection.doc(userId).get();

      return data.data();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
