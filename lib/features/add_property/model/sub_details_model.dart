// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SubDetailsModel {
  String title;
  List<String> details;
  SubDetailsModel({
    required this.title,
    required this.details,
  });

  SubDetailsModel copyWith({
    String? title,
    List<String>? details,
  }) {
    return SubDetailsModel(
      title: title ?? this.title,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'details': details,
    };
  }

  factory SubDetailsModel.fromMap(Map<String, dynamic> map) {
    return SubDetailsModel(
        title: map['title'] as String,
        details: List<String>.from(
          (map['details'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory SubDetailsModel.fromJson(String source) =>
      SubDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubDetailsModel(title: $title, details: $details)';

  @override
  bool operator ==(covariant SubDetailsModel other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.details, details);
  }

  @override
  int get hashCode => title.hashCode ^ details.hashCode;
}
