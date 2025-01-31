// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  String? transactionId; // Unique transaction ID
  final String userId; // User who made the transaction
  final String ownerId; // owner
  final double amount; // Transaction amount
  final String status; // Status (e.g., Success, Failed)
  final String paymentMethod; // Payment method (e.g., Credit Card)
  final String type; //payment type (e.g., credit, debit)
  final DateTime transactionDate; // Date of the transaction
  String? bookingId; // Associated booking ID (optional)
  final DateTime createdAt; // Creation timestamp
  final DateTime updatedAt; // Update timestamp
  TransactionModel({
    this.transactionId,
    required this.userId,
    required this.ownerId,
    required this.amount,
    required this.status,
    required this.paymentMethod,
    required this.type,
    required this.transactionDate,
    this.bookingId,
    required this.createdAt,
    required this.updatedAt,
  });

  TransactionModel copyWith({
    String? transactionId,
    String? userId,
    String? ownerId,
    double? amount,
    String? status,
    String? paymentMethod,
    String? type,
    DateTime? transactionDate,
    String? bookingId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionModel(
      transactionId: transactionId ?? this.transactionId,
      userId: userId ?? this.userId,
      ownerId: ownerId ?? this.ownerId,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      type: type ?? this.type,
      transactionDate: transactionDate ?? this.transactionDate,
      bookingId: bookingId ?? this.bookingId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionId': transactionId,
      'userId': userId,
      'ownerId': ownerId,
      'amount': amount,
      'status': status,
      'paymentMethod': paymentMethod,
      'type': type,
      'bookingId': bookingId,
      'transactionDate': Timestamp.fromDate(transactionDate),
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      transactionId:
          map['transactionId'] != null ? map['transactionId'] as String : null,
      userId: map['userId'] as String,
      ownerId: map['ownerId'] as String,
      amount: map['amount'] as double,
      status: map['status'] as String,
      paymentMethod: map['paymentMethod'] as String,
      type: map['type'] as String,
      bookingId: map['bookingId'] != null ? map['bookingId'] as String : null,
      transactionDate: (map['transactionDate']! as Timestamp).toDate(),
      createdAt: (map['createdAt']! as Timestamp).toDate(),
      updatedAt: (map['updatedAt']! as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(transactionId: $transactionId, userId: $userId, ownerId: $ownerId, amount: $amount, status: $status, paymentMethod: $paymentMethod, type: $type, transactionDate: $transactionDate, bookingId: $bookingId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.transactionId == transactionId &&
        other.userId == userId &&
        other.ownerId == ownerId &&
        other.amount == amount &&
        other.status == status &&
        other.paymentMethod == paymentMethod &&
        other.type == type &&
        other.transactionDate == transactionDate &&
        other.bookingId == bookingId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return transactionId.hashCode ^
        userId.hashCode ^
        ownerId.hashCode ^
        amount.hashCode ^
        status.hashCode ^
        paymentMethod.hashCode ^
        type.hashCode ^
        transactionDate.hashCode ^
        bookingId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
