// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

// class BookingModel {
//   String? bookingId;
//   final String userId;
//   final String userName;
//   final String propertyId;
//   final DateTime startDate;
//   final DateTime endDate;
//   final String status;
//   String? paymentMethod;
//   final double totalPrice;
//   final List<String> bookedRoomsId;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   BookingModel({
//     this.bookingId,
//     required this.userId,
//     required this.userName,
//     required this.propertyId,
//     required this.startDate,
//     required this.endDate,
//     this.status = 'pending',
//     this.paymentMethod,
//     required this.totalPrice,
//     required this.bookedRoomsId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   BookingModel copyWith({
//     String? bookingId,
//     String? userId,
//     String? userName,
//     String? propertyId,
//     DateTime? startDate,
//     DateTime? endDate,
//     String? status,
//     String? paymentMethod,
//     double? totalPrice,
//     List<String>? bookedRoomsId,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) {
//     return BookingModel(
//       bookingId: bookingId ?? this.bookingId,
//       userId: userId ?? this.userId,
//       userName: userName ?? this.userName,
//       propertyId: propertyId ?? this.propertyId,
//       startDate: startDate ?? this.startDate,
//       endDate: endDate ?? this.endDate,
//       status: status ?? this.status,
//       paymentMethod: paymentMethod ?? this.paymentMethod,
//       totalPrice: totalPrice ?? this.totalPrice,
//       bookedRoomsId: bookedRoomsId ?? this.bookedRoomsId,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'bookingId': bookingId,
//       'userId': userId,
//       'userName': userName,
//       'propertyId': propertyId,
//       'startDate': Timestamp.fromDate(startDate),
//       'endDate': Timestamp.fromDate(endDate),
//       'status': status,
//       'paymentMethod': paymentMethod,
//       'totalPrice': totalPrice,
//       'bookedRoomsId': bookedRoomsId,
//       'createdAt': Timestamp.fromDate(createdAt),
//       'updatedAt': Timestamp.fromDate(updatedAt),
//     };
//   }

//   factory BookingModel.fromMap(Map<String, dynamic> map) {
//     return BookingModel(
//       bookingId: map['bookingId'] != null ? map['bookingId'] as String : null,
//       userId: map['userId'] as String,
//       userName: map['userName'] as String,
//       propertyId: map['propertyId'] as String,
//       startDate: (map['startDate'] as Timestamp).toDate(),
//       endDate: (map['endDate'] as Timestamp).toDate(),
//       status: map['status'] as String,
//       paymentMethod:
//           map['paymentMethod'] != null ? map['paymentMethod'] as String : null,
//       totalPrice: map['totalPrice'] as double,
//       bookedRoomsId: List<String>.from((map['bookedRoomsId'] as List<dynamic>)),
//       createdAt: (map['createdAt'] as Timestamp).toDate(),
//       updatedAt: (map['updatedAt'] as Timestamp).toDate(),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory BookingModel.fromJson(String source) =>
//       BookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'BookingModel(bookingId: $bookingId, userId: $userId, userName: $userName, propertyId: $propertyId, startDate: $startDate, endDate: $endDate, status: $status, paymentMethod: $paymentMethod, totalPrice: $totalPrice, bookedRoomsId: $bookedRoomsId, createdAt: $createdAt, updatedAt: $updatedAt)';
//   }

//   @override
//   bool operator ==(covariant BookingModel other) {
//     if (identical(this, other)) return true;

//     return other.bookingId == bookingId &&
//         other.userId == userId &&
//         other.userName == userName &&
//         other.propertyId == propertyId &&
//         other.startDate == startDate &&
//         other.endDate == endDate &&
//         other.status == status &&
//         other.paymentMethod == paymentMethod &&
//         other.totalPrice == totalPrice &&
//         listEquals(other.bookedRoomsId, bookedRoomsId) &&
//         other.createdAt == createdAt &&
//         other.updatedAt == updatedAt;
//   }

//   @override
//   int get hashCode {
//     return bookingId.hashCode ^
//         userId.hashCode ^
//         userName.hashCode ^
//         propertyId.hashCode ^
//         startDate.hashCode ^
//         endDate.hashCode ^
//         status.hashCode ^
//         paymentMethod.hashCode ^
//         totalPrice.hashCode ^
//         bookedRoomsId.hashCode ^
//         createdAt.hashCode ^
//         updatedAt.hashCode;
//   }
// }

class BookingModel {
  String? bookingId; // Unique identifier for the booking
  final String userId; // User who made the booking
  final String propertyId; // Property being booked
  final DateTime startDate; // Booking start date
  final DateTime endDate; // Booking end date
  final String status; // Booking status (e.g., Confirmed, Cancelled)
  final List<String> bookedRoomsId; // List of room IDs booked
  final double totalPrice; // Total price for the booking
  final int gustCount;
  final DateTime createdAt; // Creation timestamp
  final DateTime updatedAt; // Update timestamp
  final String transactionId; // Reference to the transaction document
  BookingModel({
    this.bookingId,
    required this.userId,
    required this.propertyId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.bookedRoomsId,
    required this.totalPrice,
    required this.gustCount,
    required this.createdAt,
    required this.updatedAt,
    required this.transactionId,
  });

  BookingModel copyWith({
    String? bookingId,
    String? userId,
    String? propertyId,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    List<String>? bookedRoomsId,
    double? totalPrice,
    int? gustCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? transactionId,
  }) {
    return BookingModel(
      bookingId: bookingId ?? this.bookingId,
      userId: userId ?? this.userId,
      propertyId: propertyId ?? this.propertyId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      bookedRoomsId: bookedRoomsId ?? this.bookedRoomsId,
      totalPrice: totalPrice ?? this.totalPrice,
      gustCount: gustCount ?? this.gustCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingId': bookingId,
      'userId': userId,
      'propertyId': propertyId,
      'startDate':
          Timestamp.fromDate(startDate), // Convert DateTime to Timestamp
      'endDate': Timestamp.fromDate(endDate), // Convert DateTime to Timestamp
      'status': status,
      'bookedRoomsId': bookedRoomsId,
      'totalPrice': totalPrice,
      'gustCount': gustCount,
      'createdAt':
          Timestamp.fromDate(createdAt), // Convert DateTime to Timestamp
      'updatedAt':
          Timestamp.fromDate(updatedAt), // Convert DateTime to Timestamp
      'transactionId': transactionId,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      bookingId: map['bookingId'] != null ? map['bookingId'] as String : null,
      userId: map['userId'] as String,
      propertyId: map['propertyId'] as String,
      startDate: (map['startDate'] as Timestamp)
          .toDate(), // Convert Timestamp to DateTime
      endDate: (map['endDate'] as Timestamp)
          .toDate(), // Convert Timestamp to DateTime
      status: map['status'] as String,
      bookedRoomsId: List<String>.from((map['bookedRoomsId'] as List<dynamic>)),
      totalPrice: map['totalPrice'] as double,
      gustCount: map['gustCount'] as int,
      createdAt: (map['createdAt'] as Timestamp)
          .toDate(), // Convert Timestamp to DateTime
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
      transactionId: map['transactionId'] as String,
    );
  }
  String toJson() => json.encode(toMap());

  factory BookingModel.fromJson(String source) =>
      BookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingModel(bookingId: $bookingId, userId: $userId, propertyId: $propertyId, startDate: $startDate, endDate: $endDate, status: $status, bookedRoomsId: $bookedRoomsId, totalPrice: $totalPrice, gustCount: $gustCount, createdAt: $createdAt, updatedAt: $updatedAt, transactionId: $transactionId)';
  }

  @override
  bool operator ==(covariant BookingModel other) {
    if (identical(this, other)) return true;

    return other.bookingId == bookingId &&
        other.userId == userId &&
        other.propertyId == propertyId &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.status == status &&
        listEquals(other.bookedRoomsId, bookedRoomsId) &&
        other.totalPrice == totalPrice &&
        other.gustCount == gustCount &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.transactionId == transactionId;
  }

  @override
  int get hashCode {
    return bookingId.hashCode ^
        userId.hashCode ^
        propertyId.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        status.hashCode ^
        bookedRoomsId.hashCode ^
        totalPrice.hashCode ^
        gustCount.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        transactionId.hashCode;
  }
}

  // Map<String, dynamic> toMap() {
  //   return {
  //     'bookingId': bookingId,
  //     'userId': userId,
  //     'propertyId': propertyId,
  //     'startDate':
  //         Timestamp.fromDate(startDate), // Convert DateTime to Timestamp
  //     'endDate': Timestamp.fromDate(endDate), // Convert DateTime to Timestamp
  //     'status': status,
  //     'bookedRoomsId': bookedRoomsId,
  //     'totalPrice': totalPrice,
  //     'createdAt':
  //         Timestamp.fromDate(createdAt), // Convert DateTime to Timestamp
  //     'updatedAt':
  //         Timestamp.fromDate(updatedAt), // Convert DateTime to Timestamp
  //     'transactionId': transactionId,
  //   };
  // }

  // factory BookingModel.fromMap(Map<String, dynamic> map) {
  //   return BookingModel(
  //     bookingId: map['bookingId'],
  //     userId: map['userId'],
  //     propertyId: map['propertyId'],
  //     startDate: (map['startDate'] as Timestamp)
  //         .toDate(), // Convert Timestamp to DateTime
  //     endDate: (map['endDate'] as Timestamp)
  //         .toDate(), // Convert Timestamp to DateTime
  //     status: map['status'],
  //     bookedRoomsId: List<String>.from(map['bookedRoomsId']),
  //     totalPrice: map['totalPrice'],
  //     createdAt: (map['createdAt'] as Timestamp)
  //         .toDate(), // Convert Timestamp to DateTime
  //     updatedAt: (map['updatedAt'] as Timestamp)
  //         .toDate(), // Convert Timestamp to DateTime
  //     transactionId: map['transactionId'],
  //   );
  // }