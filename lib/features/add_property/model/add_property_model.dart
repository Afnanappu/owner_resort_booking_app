// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/features/add_property/model/add_room_model.dart';
import 'package:owner_resort_booking_app/features/add_property/model/extra_details_model.dart';

class AddPropertyModel {
  String? id;
  List<PickedFileModel> images;
  String type;
  String name;
  String location;
  String description;
  bool isVerified;
  List<PickedFileModel> licenses;
  ExtraDetailsModel extraDetails;
  String checkInTime;
  String checkOutTime;
  List<AddRoomModel> rooms;
  AddPropertyModel({
    this.id,
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
    required this.rooms,
  });

  AddPropertyModel copyWith({
    String? id,
    List<PickedFileModel>? images,
    String? type,
    String? name,
    String? location,
    String? description,
    bool? isVerified,
    List<PickedFileModel>? licenses,
    ExtraDetailsModel? extraDetails,
    String? checkInTime,
    String? checkOutTime,
    List<AddRoomModel>? rooms,
  }) {
    return AddPropertyModel(
      id: id ?? this.id,
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
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images.map((x) => x.toMap()).toList(),
      'type': type,
      'name': name,
      'location': location,
      'description': description,
      'isVerified': isVerified,
      'licenses': licenses.map((x) => x.toMap()).toList(),
      'extraDetails': extraDetails.toMap(),
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'rooms': rooms.map((x) => x.toMap()).toList(),
    };
  }

  factory AddPropertyModel.fromMap(Map<String, dynamic> map) {
    return AddPropertyModel(
      id: map['id'] != null ? map['id'] as String : null,
      images: List<PickedFileModel>.from(
        (map['images'] as List<dynamic>).map<PickedFileModel>(
          (x) => PickedFileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      type: map['type'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
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
      rooms: List<AddRoomModel>.from(
        (map['rooms'] as List<dynamic>).map<AddRoomModel>(
          (x) => AddRoomModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPropertyModel.fromJson(String source) =>
      AddPropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddPropertyModel(id: $id, images: $images, type: $type, name: $name, location: $location, description: $description, isVerified: $isVerified, licenses: $licenses, extraDetails: $extraDetails, checkInTime: $checkInTime, checkOutTime: $checkOutTime, rooms: $rooms)';
  }

  @override
  bool operator ==(covariant AddPropertyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
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
        listEquals(other.rooms, rooms);
  }

  @override
  int get hashCode {
    return id.hashCode ^
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
        rooms.hashCode;
  }
}
