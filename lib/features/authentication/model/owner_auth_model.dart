// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';

class OwnerAuthModel {
  String? uid;
  final String name;
  final String email;
  String? ownerId;
  final List<PickedFileModel> personalProof;
  final String role;
  final String? profilePicture;
  final bool isVerified;
  final String? phone;
  final String? fcmToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isBlocked;

  OwnerAuthModel({
    this.uid,
    required this.name,
    required this.email,
    this.ownerId,
    required this.personalProof,
    this.role = 'owner',
    this.profilePicture,
    this.isVerified = false,
    this.phone,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.isBlocked = false,
  });

  OwnerAuthModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? ownerId,
    List<PickedFileModel>? personalProof,
    String? role,
    String? profilePicture,
    bool? isVerified,
    String? phone,
    String? fcmToken,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isBlocked,
  }) {
    return OwnerAuthModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      ownerId: ownerId ?? this.ownerId,
      personalProof: personalProof ?? this.personalProof,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
      isVerified: isVerified ?? this.isVerified,
      phone: phone ?? this.phone,
      fcmToken: fcmToken ?? this.fcmToken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'ownerId': ownerId,
      'personalProof': personalProof.map((x) => x.toMap()).toList(),
      'role': role,
      'profilePicture': profilePicture,
      'isVerified': isVerified,
      'phone': phone,
      'fcmToken': fcmToken,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'isBlocked': isBlocked
    };
  }

  factory OwnerAuthModel.fromMap(Map<String, dynamic> map) {
    return OwnerAuthModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      ownerId: map['ownerId'] != null ? map['ownerId'] as String : null,
      personalProof: List<PickedFileModel>.from(
        (map['personalProof'] as List<dynamic>).map<PickedFileModel>(
          (x) => PickedFileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      role: map['role'] as String,
      profilePicture: map['profilePicture'] != null
          ? map['profilePicture'] as String
          : null,
      isVerified: map['isVerified'] as bool,
      phone: map['phone'] != null ? map['phone'] as String : null,
      fcmToken: map['fcmToken'] != null ? map['fcmToken'] as String : null,
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate(),
            isBlocked: map['isBlocked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory OwnerAuthModel.fromJson(String source) =>
      OwnerAuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OwnerAuthModel(uid: $uid, name: $name, email: $email, ownerId: $ownerId, personalProof: $personalProof, role: $role, profilePicture: $profilePicture, isVerified: $isVerified, phone: $phone, fcmToken: $fcmToken, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant OwnerAuthModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.ownerId == ownerId &&
        listEquals(other.personalProof, personalProof) &&
        other.role == role &&
        other.profilePicture == profilePicture &&
        other.isVerified == isVerified &&
        other.phone == phone &&
        other.fcmToken == fcmToken &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.isBlocked == isBlocked;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        ownerId.hashCode ^
        personalProof.hashCode ^
        role.hashCode ^
        profilePicture.hashCode ^
        isVerified.hashCode ^
        phone.hashCode ^
        fcmToken.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        isBlocked.hashCode;
  }
}
