import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class OwnerModel {
  String? uid;
  String name;
  String email;
  String? profilePicture;
  String? phone;

  OwnerModel({
    this.uid,
    required this.name,
    required this.email,
    this.profilePicture,
    this.phone,
  });

  OwnerModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? profilePicture,
    String? phone,
  }) {
    return OwnerModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'phone': phone,
    };
  }

  factory OwnerModel.fromMap(Map<String, dynamic> map) {
    return OwnerModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      profilePicture: map['profilePicture'] != null
          ? map['profilePicture'] as String
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OwnerModel.fromJson(String source) =>
      OwnerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OwnerModel(uid: $uid, name: $name, email: $email, profilePicture: $profilePicture, phone: $phone)';
  }

  @override
  bool operator ==(covariant OwnerModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.profilePicture == profilePicture &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        profilePicture.hashCode ^
        phone.hashCode;
  }
}
