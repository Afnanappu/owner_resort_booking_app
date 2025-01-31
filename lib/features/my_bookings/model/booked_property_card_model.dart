// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookedPropertyCardModel {
  final String bookingId;
  final String userId;
  final String propertyName;
  final DateTime startDate;
  final DateTime endDate;
  final String price;
  final String imageUrl;
  final String status;

  BookedPropertyCardModel({
    required this.bookingId,
    required this.userId,
    required this.propertyName,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.imageUrl,
    required this.status,
  });

  BookedPropertyCardModel copyWith({
    String? bookingId,
    String? userId,
    String? propertyName,
    DateTime? startDate,
    DateTime? endDate,
    String? price,
    String? imageUrl,
    String? status,
  }) {
    return BookedPropertyCardModel(
      bookingId: bookingId ?? this.bookingId,
      userId: userId ?? this.userId,
      propertyName: propertyName ?? this.propertyName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingId': bookingId,
      'userId': userId,
      'propertyName': propertyName,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'price': price,
      'imageUrl': imageUrl,
      'status': status,
    };
  }

  factory BookedPropertyCardModel.fromMap(Map<String, dynamic> map) {
    return BookedPropertyCardModel(
      bookingId: map['bookingId'] as String,
      userId: map['userId'] as String,
      propertyName: map['propertyName'] as String,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      price: map['price'] as String,
      imageUrl: map['imageUrl'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookedPropertyCardModel.fromJson(String source) =>
      BookedPropertyCardModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookedPropertyCardModel(bookingId: $bookingId, userId: $userId, propertyName: $propertyName, startDate: $startDate, endDate: $endDate, price: $price, imageUrl: $imageUrl, status: $status)';
  }

  @override
  bool operator ==(covariant BookedPropertyCardModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.bookingId == bookingId &&
      other.userId == userId &&
      other.propertyName == propertyName &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.price == price &&
      other.imageUrl == imageUrl &&
      other.status == status;
  }

  @override
  int get hashCode {
    return bookingId.hashCode ^
      userId.hashCode ^
      propertyName.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      status.hashCode;
  }
}
