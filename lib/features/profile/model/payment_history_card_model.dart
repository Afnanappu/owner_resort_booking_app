// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:owner_resort_booking_app/core/data/models/transaction_model.dart';

class PaymentHistoryModel {
  final String payerName;
  final String? profile;
  final TransactionModel transactionModel;
  PaymentHistoryModel({
    required this.payerName,
    required this.profile,
    required this.transactionModel,
  });

  PaymentHistoryModel copyWith({
    String? payerName,
    String? profile,
    TransactionModel? transactionModel,
  }) {
    return PaymentHistoryModel(
      payerName: payerName ?? this.payerName,
      profile: profile ?? this.profile,
      transactionModel: transactionModel ?? this.transactionModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'payerName': payerName,
      'profile': profile,
      'transactionModel': transactionModel.toMap(),
    };
  }

  factory PaymentHistoryModel.fromMap(Map<String, dynamic> map) {
    return PaymentHistoryModel(
      payerName: map['payerName'] as String,
      profile: map['profile'] != null ? map['profile'] as String : null,
      transactionModel: TransactionModel.fromMap(
          map['transactionModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentHistoryModel.fromJson(String source) =>
      PaymentHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PaymentHistoryModel(payerName: $payerName, profile: $profile, transactionModel: $transactionModel)';

  @override
  bool operator ==(covariant PaymentHistoryModel other) {
    if (identical(this, other)) return true;

    return other.payerName == payerName &&
        other.profile == profile &&
        other.transactionModel == transactionModel;
  }

  @override
  int get hashCode =>
      payerName.hashCode ^ profile.hashCode ^ transactionModel.hashCode;
}
