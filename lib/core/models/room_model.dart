// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/core/models/amenities_model.dart';
import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';

class RoomModel {
  String? id;
  List<PickedFileModel> images;
  String roomType;
  String roomId;
  String price;
  String roomArea;
  String bedType;
  String maxGustCount;
  String description;
  List<AmenitiesModel> amenities;
  RoomModel({
    this.id,
    required this.images,
    required this.roomType,
    required this.roomId,
    required this.price,
    required this.roomArea,
    required this.bedType,
    required this.maxGustCount,
    required this.description,
    required this.amenities,
  });

  RoomModel copyWith({
    String? id,
    List<PickedFileModel>? images,
    String? roomType,
    String? roomId,
    String? price,
    String? roomArea,
    String? bedType,
    String? maxGustCount,
    String? description,
    List<AmenitiesModel>? amenities,
  }) {
    return RoomModel(
      id: id ?? this.id,
      images: images ?? this.images,
      roomType: roomType ?? this.roomType,
      roomId: roomId ?? this.roomId,
      price: price ?? this.price,
      roomArea: roomArea ?? this.roomArea,
      bedType: bedType ?? this.bedType,
      maxGustCount: maxGustCount ?? this.maxGustCount,
      description: description ?? this.description,
      amenities: amenities ?? this.amenities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images.map((x) => x.toMap()).toList(),
      'roomType': roomType,
      'roomId': roomId,
      'price': price,
      'roomArea': roomArea,
      'bedType': bedType,
      'maxGustCount': maxGustCount,
      'description': description,
      'amenities': amenities.map((x) => x.toMap()).toList(),
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      id: map['id'] != null ? map['id'] as String : null,
      images: List<PickedFileModel>.from(
        (map['images'] as List<dynamic>).map<PickedFileModel>(
          (x) => PickedFileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      roomType: map['roomType'] as String,
      roomId: map['roomId'] as String,
      price: map['price'] as String,
      roomArea: map['roomArea'] as String,
      bedType: map['bedType'] as String,
      maxGustCount: map['maxGustCount'] as String,
      description: map['description'] as String,
      amenities: List<AmenitiesModel>.from(
        (map['amenities'] as List<dynamic>).map<AmenitiesModel>(
          (x) => AmenitiesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoomModel(id: $id, images: $images, roomType: $roomType, roomId: $roomId, price: $price, roomArea: $roomArea, bedType: $bedType, maxGustCount: $maxGustCount, description: $description, amenities: $amenities)';
  }

  @override
  bool operator ==(covariant RoomModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.images, images) &&
        other.roomType == roomType &&
        other.roomId == roomId &&
        other.price == price &&
        other.roomArea == roomArea &&
        other.bedType == bedType &&
        other.maxGustCount == maxGustCount &&
        other.description == description &&
        listEquals(other.amenities, amenities);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        images.hashCode ^
        roomType.hashCode ^
        roomId.hashCode ^
        price.hashCode ^
        roomArea.hashCode ^
        bedType.hashCode ^
        maxGustCount.hashCode ^
        description.hashCode ^
        amenities.hashCode;
  }
}
