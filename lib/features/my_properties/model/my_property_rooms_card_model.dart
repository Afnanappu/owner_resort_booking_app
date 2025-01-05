// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// class MyPropertyRoomsCardModel {
//   final String id;
//   final String roomId; 
//   final String
//       description;
//   final String imageUrl; 
//   final String roomArea; 
//   final String roomType; 
//   final String bedType; 
//   final String maxGustCount; 
//   final List<AmenitiesModel> amenities; 
//   final double price; 
//   final bool isAvailable; 
//   MyPropertyRoomsCardModel({
//     required this.id,
//     required this.roomId,
//     required this.imageUrl,
//     required this.roomArea,
//     required this.roomType,
//     required this.bedType,
//     required this.maxGustCount,
//     required this.amenities,
//     required this.price,
//     required this.isAvailable,
//   });


//   MyPropertyRoomsCardModel copyWith({
//     String? id,
//     String? roomId,
//     String? imageUrl,
//     String? roomArea,
//     String? roomType,
//     String? bedType,
//     String? maxGustCount,
//     List<AmenitiesModel>? amenities,
//     double? price,
//     bool? isAvailable,
//   }) {
//     return MyPropertyRoomsCardModel(
//       id: id ?? this.id,
//       roomId: roomId ?? this.roomId,
//       imageUrl: imageUrl ?? this.imageUrl,
//       roomArea: roomArea ?? this.roomArea,
//       roomType: roomType ?? this.roomType,
//       bedType: bedType ?? this.bedType,
//       maxGustCount: maxGustCount ?? this.maxGustCount,
//       amenities: amenities ?? this.amenities,
//       price: price ?? this.price,
//       isAvailable: isAvailable ?? this.isAvailable,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'roomId': roomId,
//       'imageUrl': imageUrl,
//       'roomArea': roomArea,
//       'roomType': roomType,
//       'bedType': bedType,
//       'maxGustCount': maxGustCount,
//       'amenities': amenities.map((x) => x.toMap()).toList(),
//       'price': price,
//       'isAvailable': isAvailable,
//     };
//   }

//   factory MyPropertyRoomsCardModel.fromMap(Map<String, dynamic> map) {
//     return MyPropertyRoomsCardModel(
//       id: map['id'] as String,
//       roomId: map['roomId'] as String,
//       imageUrl: map['imageUrl'] as String,
//       roomArea: map['roomArea'] as String,
//       roomType: map['roomType'] as String,
//       bedType: map['bedType'] as String,
//       maxGustCount: map['maxGustCount'] as String,
//       amenities: List<AmenitiesModel>.from((map['amenities'] as List<int>).map<AmenitiesModel>((x) => AmenitiesModel.fromMap(x as Map<String,dynamic>),),),
//       price: map['price'] as double,
//       isAvailable: map['isAvailable'] as bool,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory MyPropertyRoomsCardModel.fromJson(String source) => MyPropertyRoomsCardModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'MyPropertyRoomsCardModel(id: $id, roomId: $roomId, imageUrl: $imageUrl, roomArea: $roomArea, roomType: $roomType, bedType: $bedType, maxGustCount: $maxGustCount, amenities: $amenities, price: $price, isAvailable: $isAvailable)';
//   }

//   @override
//   bool operator ==(covariant MyPropertyRoomsCardModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.id == id &&
//       other.roomId == roomId &&
//       other.imageUrl == imageUrl &&
//       other.roomArea == roomArea &&
//       other.roomType == roomType &&
//       other.bedType == bedType &&
//       other.maxGustCount == maxGustCount &&
//       listEquals(other.amenities, amenities) &&
//       other.price == price &&
//       other.isAvailable == isAvailable;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//       roomId.hashCode ^
//       imageUrl.hashCode ^
//       roomArea.hashCode ^
//       roomType.hashCode ^
//       bedType.hashCode ^
//       maxGustCount.hashCode ^
//       amenities.hashCode ^
//       price.hashCode ^
//       isAvailable.hashCode;
//   }
// }
