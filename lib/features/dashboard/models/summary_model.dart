// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SummaryModel {
  final int propertyCount;
  final int roomCount;
  final int totalVisitors;
  SummaryModel({
    required this.propertyCount,
    required this.roomCount,
    required this.totalVisitors,
  });

  SummaryModel copyWith({
    int? propertyCount,
    int? roomCount,
    int? totalVisitors,
  }) {
    return SummaryModel(
      propertyCount: propertyCount ?? this.propertyCount,
      roomCount: roomCount ?? this.roomCount,
      totalVisitors: totalVisitors ?? this.totalVisitors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'propertyCount': propertyCount,
      'roomCount': roomCount,
      'totalVisitors': totalVisitors,
    };
  }

  factory SummaryModel.fromMap(Map<String, dynamic> map) {
    return SummaryModel(
      propertyCount: map['propertyCount'] as int,
      roomCount: map['roomCount'] as int,
      totalVisitors: map['totalVisitors'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryModel.fromJson(String source) => SummaryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SummaryModel(propertyCount: $propertyCount, roomCount: $roomCount, totalVisitors: $totalVisitors)';

  @override
  bool operator ==(covariant SummaryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.propertyCount == propertyCount &&
      other.roomCount == roomCount &&
      other.totalVisitors == totalVisitors;
  }

  @override
  int get hashCode => propertyCount.hashCode ^ roomCount.hashCode ^ totalVisitors.hashCode;
}
