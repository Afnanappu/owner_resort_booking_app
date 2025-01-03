// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:owner_resort_booking_app/features/add_property/model/sub_details_model.dart';

class BasicDetailsModel {
  String title;
  List<SubDetailsModel> subDetails;
  BasicDetailsModel({
    required this.title,
    required this.subDetails,
  });

  BasicDetailsModel copyWith({
    String? title,
    List<SubDetailsModel>? subDetails,
  }) {
    return BasicDetailsModel(
      title: title ?? this.title,
      subDetails: subDetails ?? this.subDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subDetails': subDetails.map((x) => x.toMap()).toList(),
    };
  }

  factory BasicDetailsModel.fromMap(Map<String, dynamic> map) {
    return BasicDetailsModel(
      title: map['title'] as String,
      subDetails: List<SubDetailsModel>.from(
        (map['subDetails'] as List<dynamic>).map<SubDetailsModel>(
          (x) => SubDetailsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicDetailsModel.fromJson(String source) =>
      BasicDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BasicDetailsModel(title: $title, subDetails: $subDetails)';

  @override
  bool operator ==(covariant BasicDetailsModel other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.subDetails, subDetails);
  }

  @override
  int get hashCode => title.hashCode ^ subDetails.hashCode;
}
