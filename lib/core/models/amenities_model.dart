// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AmenitiesModel {
  String name;
  String icon;
  AmenitiesModel({
    required this.name,
    required this.icon,
  });

  AmenitiesModel copyWith({
    String? name,
    String? icon,
  }) {
    return AmenitiesModel(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
    };
  }

  factory AmenitiesModel.fromMap(Map<String, dynamic> map) {
    return AmenitiesModel(
      name: map['name'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AmenitiesModel.fromJson(String source) => AmenitiesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AmenitiesModel(name: $name, icon: $icon)';

  @override
  bool operator ==(covariant AmenitiesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode;
}
