// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TotalBookingModel {
  final int upcomingBookings;
  final int completedBookings;
  final int cancelledBookings;
  TotalBookingModel({
    required this.upcomingBookings,
    required this.completedBookings,
    required this.cancelledBookings,
  });

  TotalBookingModel copyWith({
    int? upcomingBookings,
    int? completedBookings,
    int? cancelledBookings,
  }) {
    return TotalBookingModel(
      upcomingBookings: upcomingBookings ?? this.upcomingBookings,
      completedBookings: completedBookings ?? this.completedBookings,
      cancelledBookings: cancelledBookings ?? this.cancelledBookings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'upcomingBookings': upcomingBookings,
      'completedBookings': completedBookings,
      'cancelledBookings': cancelledBookings,
    };
  }

  factory TotalBookingModel.fromMap(Map<String, dynamic> map) {
    return TotalBookingModel(
      upcomingBookings: map['upcomingBookings'] as int,
      completedBookings: map['completedBookings'] as int,
      cancelledBookings: map['cancelledBookings'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalBookingModel.fromJson(String source) => TotalBookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TotalBookingModel(upcomingBookings: $upcomingBookings, completedBookings: $completedBookings, cancelledBookings: $cancelledBookings)';

  @override
  bool operator ==(covariant TotalBookingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.upcomingBookings == upcomingBookings &&
      other.completedBookings == completedBookings &&
      other.cancelledBookings == cancelledBookings;
  }

  @override
  int get hashCode => upcomingBookings.hashCode ^ completedBookings.hashCode ^ cancelledBookings.hashCode;
}
