// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/core/data/models/location_model.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';

class PropertyCardModel {
  String? id;
  PickedFileModel image;
  String name;
  LocationModel location;
  double price;
  double? rating;
  List<String> reviews;
  int rooms;
  PropertyCardModel({
    this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.rooms,
  });

  PropertyCardModel copyWith({
    String? id,
    PickedFileModel? image,
    String? name,
    LocationModel? location,
    double? price,
    double? rating,
    List<String>? reviews,
    int? rooms,
  }) {
    return PropertyCardModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      location: location ?? this.location,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image.toMap(),
      'name': name,
      'location': location.toMap(),
      'price': price,
      'rating': rating,
      'reviews': reviews,
      'rooms': rooms,
    };
  }

  factory PropertyCardModel.fromMap(Map<String, dynamic> map) {
    return PropertyCardModel(
      id: map['id'] != null ? map['id'] as String : null,
      image: PickedFileModel.fromMap(
          (map['images'] as List<dynamic>).first as Map<String, dynamic>),
      name: map['name'] as String,
      location: LocationModel.fromMap(map['location'] as Map<String, dynamic>),
      price: (map['roomPrice'] as num).toDouble(),
      rating: map['rating'] != null ? (map['rating'] as num).toDouble() : null,
      reviews: List<String>.from((map['reviews'] as List<dynamic>)),
      rooms: map['roomCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyCardModel.fromJson(String source) =>
      PropertyCardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PropertyCardModel(id: $id, image: $image, name: $name, location: $location, price: $price, rating: $rating, reviews: $reviews, rooms: $rooms)';
  }

  @override
  bool operator ==(covariant PropertyCardModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.name == name &&
        other.location == location &&
        other.price == price &&
        other.rating == rating &&
        listEquals(other.reviews, reviews) &&
        other.rooms == rooms;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        name.hashCode ^
        location.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        reviews.hashCode ^
        rooms.hashCode;
  }
}

// //? NOTE: added step to get only the first image from the list of images.
//       final rooms = (map['rooms'] as List<dynamic>);
// final price = rooms.fold(
//   double.parse(rooms[0]['price']),
//   (previousValue, element) => double.parse(element['price']) < previousValue
//       ? double.parse(element['price'])
//       : previousValue,
// );
