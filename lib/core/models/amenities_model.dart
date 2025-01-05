// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AmenitiesModel {
  
  String name;
  String? image;
  AmenitiesModel({
    required this.name,
    required this.image,
  });

  AmenitiesModel copyWith({
    String? name,
    String? image,
  }) {
    return AmenitiesModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory AmenitiesModel.fromMap(Map<String, dynamic> map) {
    return AmenitiesModel(
      name: map['name'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AmenitiesModel.fromJson(String source) => AmenitiesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AmenitiesModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant AmenitiesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
