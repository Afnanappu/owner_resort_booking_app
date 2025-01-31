// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:owner_resort_booking_app/core/data/models/booking_model.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_details_model.dart';

class BookedPropertyDetailsModel {
  final PropertyDetailsModel property;
  final List<RoomModel> bookedRooms;
  final BookingModel bookingDetails;
  BookedPropertyDetailsModel({
    required this.property,
    required this.bookedRooms,
    required this.bookingDetails,
  });

  BookedPropertyDetailsModel copyWith({
    PropertyDetailsModel? property,
    List<RoomModel>? bookedRooms,
    BookingModel? bookingDetails,
  }) {
    return BookedPropertyDetailsModel(
      property: property ?? this.property,
      bookedRooms: bookedRooms ?? this.bookedRooms,
      bookingDetails: bookingDetails ?? this.bookingDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'property': property.toMap(),
      'bookedRooms': bookedRooms.map((x) => x.toMap()).toList(),
      'bookingDetails': bookingDetails.toMap(),
    };
  }

  factory BookedPropertyDetailsModel.fromMap(Map<String, dynamic> map) {
    return BookedPropertyDetailsModel(
      property:
          PropertyDetailsModel.fromMap(map['property'] as Map<String, dynamic>),
      bookedRooms: List<RoomModel>.from(
        (map['bookedRooms'] as List<dynamic>).map<RoomModel>(
          (x) => RoomModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      bookingDetails:
          BookingModel.fromMap(map['bookingDetails'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookedPropertyDetailsModel.fromJson(String source) =>
      BookedPropertyDetailsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BookedPropertyDetailsModel(property: $property, bookedRooms: $bookedRooms, bookingDetails: $bookingDetails)';

  @override
  bool operator ==(covariant BookedPropertyDetailsModel other) {
    if (identical(this, other)) return true;

    return other.property == property &&
        listEquals(other.bookedRooms, bookedRooms) &&
        other.bookingDetails == bookingDetails;
  }

  @override
  int get hashCode =>
      property.hashCode ^ bookedRooms.hashCode ^ bookingDetails.hashCode;
}
