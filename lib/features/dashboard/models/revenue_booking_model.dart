// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RevenueBookingModel {
  final String resortId;
  final String resortName;
  final int bookings;
  final double revenue;
  final String image;
  RevenueBookingModel({
    required this.resortId,
    required this.resortName,
    required this.bookings,
    required this.revenue,
    required this.image,
  });

  RevenueBookingModel copyWith({
    String? resortId,
    String? resortName,
    int? bookings,
    double? revenue,
    String? image,
  }) {
    return RevenueBookingModel(
      resortId: resortId ?? this.resortId,
      resortName: resortName ?? this.resortName,
      bookings: bookings ?? this.bookings,
      revenue: revenue ?? this.revenue,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resortId': resortId,
      'resortName': resortName,
      'bookings': bookings,
      'revenue': revenue,
      'image': image,
    };
  }

  factory RevenueBookingModel.fromMap(Map<String, dynamic> map) {
    return RevenueBookingModel(
      resortId: map['resortId'] as String,
      resortName: map['resortName'] as String,
      bookings: map['bookings'] as int,
      revenue: map['revenue'] as double,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RevenueBookingModel.fromJson(String source) => RevenueBookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RevenueBookingModel(resortId: $resortId, resortName: $resortName, bookings: $bookings, revenue: $revenue, image: $image)';
  }

  @override
  bool operator ==(covariant RevenueBookingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.resortId == resortId &&
      other.resortName == resortName &&
      other.bookings == bookings &&
      other.revenue == revenue &&
      other.image == image;
  }

  @override
  int get hashCode {
    return resortId.hashCode ^
      resortName.hashCode ^
      bookings.hashCode ^
      revenue.hashCode ^
      image.hashCode;
  }
}
