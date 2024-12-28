// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PropertyCardModel {
  String image;
  String propertyName;
  String location;
  double price;
  double rating;
  int reviews;
  int rooms;
  PropertyCardModel({
    required this.image,
    required this.propertyName,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.rooms,
  });

  PropertyCardModel copyWith({
    String? image,
    String? propertyName,
    String? location,
    double? price,
    double? rating,
    int? reviews,
    int? rooms,
  }) {
    return PropertyCardModel(
      image: image ?? this.image,
      propertyName: propertyName ?? this.propertyName,
      location: location ?? this.location,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'propertyName': propertyName,
      'location': location,
      'price': price,
      'rating': rating,
      'reviews': reviews,
      'rooms': rooms,
    };
  }

  factory PropertyCardModel.fromMap(Map<String, dynamic> map) {
    return PropertyCardModel(
      image: map['image'] as String,
      propertyName: map['propertyName'] as String,
      location: map['location'] as String,
      price: map['price'] as double,
      rating: map['rating'] as double,
      reviews: map['reviews'] as int,
      rooms: map['rooms'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyCardModel.fromJson(String source) =>
      PropertyCardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PropertyCardModel(image: $image, propertyName: $propertyName, location: $location, price: $price, rating: $rating, reviews: $reviews, rooms: $rooms)';
  }

  @override
  bool operator ==(covariant PropertyCardModel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.propertyName == propertyName &&
        other.location == location &&
        other.price == price &&
        other.rating == rating &&
        other.reviews == reviews &&
        other.rooms == rooms;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        propertyName.hashCode ^
        location.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        reviews.hashCode ^
        rooms.hashCode;
  }
}
