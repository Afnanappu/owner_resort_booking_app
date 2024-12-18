// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/features/authentication/model/picked_file_model.dart';

class UserModel {
  String? uid;
  String name;
  String email;
  String? ownerId;
  PickedFileModel? personalProof;
  List<PickedFileModel?> license;
  String role;
  String? profilePicture;
  String createdAt = DateTime.timestamp().toString();
  String? lastLoginAt;
  bool isVerified;
  UserModel({
    this.uid,
    required this.name,
    required this.email,
    this.ownerId,
    required this.personalProof,
    required this.license,
    this.role = 'owner',
    this.profilePicture,
    this.lastLoginAt,
    this.isVerified = false,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? ownerId,
    PickedFileModel? personalProof,
    List<PickedFileModel?>? license,
    String? role,
    String? profilePicture,
    String? lastLoginAt,
    bool? isVerified,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      ownerId: ownerId ?? this.ownerId,
      personalProof: personalProof ?? this.personalProof,
      license: license ?? this.license,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'ownerId': ownerId,
      'personalProof': personalProof?.toMap(),
      'license': license.map((x) => x?.toMap()).toList(),
      'role': role,
      'profilePicture': profilePicture,
      'lastLoginAt': lastLoginAt,
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      ownerId: map['ownerId'] != null ? map['ownerId'] as String : null,
      personalProof: map['personalProof'] != null
          ? PickedFileModel.fromMap(
              map['personalProof'] as Map<String, dynamic>)
          : null,
      license: List<PickedFileModel?>.from(
        (map['license'] as List<dynamic>).map<PickedFileModel?>(
          (x) => PickedFileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      role: map['role'] as String,
      profilePicture: map['profilePicture'] != null
          ? map['profilePicture'] as String
          : null,
      lastLoginAt:
          map['lastLoginAt'] != null ? map['lastLoginAt'] as String : null,
      isVerified: map['isVerified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, ownerId: $ownerId, personalProof: $personalProof, license: $license, role: $role, profilePicture: $profilePicture, lastLoginAt: $lastLoginAt, isVerified: $isVerified)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.ownerId == ownerId &&
        other.personalProof == personalProof &&
        listEquals(other.license, license) &&
        other.role == role &&
        other.profilePicture == profilePicture &&
        other.lastLoginAt == lastLoginAt &&
        other.isVerified == isVerified;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        ownerId.hashCode ^
        personalProof.hashCode ^
        license.hashCode ^
        role.hashCode ^
        profilePicture.hashCode ^
        lastLoginAt.hashCode ^
        isVerified.hashCode;
  }
}
