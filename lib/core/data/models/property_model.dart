// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/core/data/models/extra_details_model.dart';
import 'package:owner_resort_booking_app/core/data/models/location_model.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';

class PropertyModel {
  String? id;
  String ownerId;
  List<PickedFileModel> images;
  String type;
  String name;
  LocationModel location;
  String description;
  bool isVerified;
  List<PickedFileModel> licenses;
  ExtraDetailsModel extraDetails;
  String checkInTime;
  String checkOutTime;
  int roomCount;
  double roomPrice;
  double rating;
  List<String> reviews;
  PropertyModel({
    this.id,
    required this.ownerId,
    required this.images,
    required this.type,
    required this.name,
    required this.location,
    required this.description,
    this.isVerified = false,
    required this.licenses,
    required this.extraDetails,
    required this.checkInTime,
    required this.checkOutTime,
    required this.roomCount,
    required this.roomPrice,
    required this.rating,
    required this.reviews, 
  });

  PropertyModel copyWith({
    String? id,
    String? ownerId,
    List<PickedFileModel>? images,
    String? type,
    String? name,
    LocationModel? location,
    String? description,
    bool? isVerified,
    List<PickedFileModel>? licenses,
    ExtraDetailsModel? extraDetails,
    String? checkInTime,
    String? checkOutTime,
    int? roomCount,
    double? roomPrice,
    double? rating,
    List<String>? reviews,
  }) {
    return PropertyModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      images: images ?? this.images,
      type: type ?? this.type,
      name: name ?? this.name,
      location: location ?? this.location,
      description: description ?? this.description,
      isVerified: isVerified ?? this.isVerified,
      licenses: licenses ?? this.licenses,
      extraDetails: extraDetails ?? this.extraDetails,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      roomCount: roomCount ?? this.roomCount,
      roomPrice: roomPrice ?? this.roomPrice,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ownerId': ownerId,
      'images': images.map((x) => x.toMap()).toList(),
      'type': type,
      'name': name,
      'location': location.toMap(),
      'description': description,
      'isVerified': isVerified,
      'licenses': licenses.map((x) => x.toMap()).toList(),
      'extraDetails': extraDetails.toMap(),
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'roomCount': roomCount,
      'roomPrice': roomPrice,
      'rating': rating,
      'reviews': reviews,
    };
  }

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      id: map['id'] != null ? map['id'] as String : null,
      ownerId: map['ownerId'] as String,
      images: List<PickedFileModel>.from(
        (map['images'] as List<dynamic>).map<PickedFileModel>(
          (x) => PickedFileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      type: map['type'] as String,
      name: map['name'] as String,
      location: LocationModel.fromMap(map['location'] as Map<String, dynamic>),
      description: map['description'] as String,
      isVerified: map['isVerified'] as bool,
      licenses: List<PickedFileModel>.from(
        (map['licenses'] as List<dynamic>).map<PickedFileModel>(
          (x) => PickedFileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      extraDetails: ExtraDetailsModel.fromMap(
          map['extraDetails'] as Map<String, dynamic>),
      checkInTime: map['checkInTime'] as String,
      checkOutTime: map['checkOutTime'] as String,
      roomCount: map['roomCount'] as int,
      roomPrice: map['roomPrice'] as double,
      rating: map['rating'] as double,
      reviews: List<String>.from(
        (map['reviews'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyModel.fromJson(String source) =>
      PropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PropertyModel(id: $id, ownerId: $ownerId, images: $images, type: $type, name: $name, location: $location, description: $description, isVerified: $isVerified, licenses: $licenses, extraDetails: $extraDetails, checkInTime: $checkInTime, checkOutTime: $checkOutTime, roomCount: $roomCount, roomPrice: $roomPrice, rating: $rating, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant PropertyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.ownerId == ownerId &&
        listEquals(other.images, images) &&
        other.type == type &&
        other.name == name &&
        other.location == location &&
        other.description == description &&
        other.isVerified == isVerified &&
        listEquals(other.licenses, licenses) &&
        other.extraDetails == extraDetails &&
        other.checkInTime == checkInTime &&
        other.checkOutTime == checkOutTime &&
        other.roomCount == roomCount &&
        other.roomPrice == roomPrice &&
        other.rating == rating &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        ownerId.hashCode ^
        images.hashCode ^
        type.hashCode ^
        name.hashCode ^
        location.hashCode ^
        description.hashCode ^
        isVerified.hashCode ^
        licenses.hashCode ^
        extraDetails.hashCode ^
        checkInTime.hashCode ^
        checkOutTime.hashCode ^
        roomCount.hashCode ^
        roomPrice.hashCode ^
        rating.hashCode ^
        reviews.hashCode;
  }
}
