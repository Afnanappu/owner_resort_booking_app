// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class RulesDetailsModel {
  String title;
  List<String> rules;
  RulesDetailsModel({
    required this.title,
    required this.rules,
  });

  RulesDetailsModel copyWith({
    String? title,
    List<String>? rules,
  }) {
    return RulesDetailsModel(
      title: title ?? this.title,
      rules: rules ?? this.rules,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'rules': rules,
    };
  }

  factory RulesDetailsModel.fromMap(Map<String, dynamic> map) {
    return RulesDetailsModel(
      title: map['title'] as String,
      rules: List<String>.from(
        (map['rules'] as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RulesDetailsModel.fromJson(String source) =>
      RulesDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RulesDetailsModel(title: $title, rules: $rules)';

  @override
  bool operator ==(covariant RulesDetailsModel other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.rules, rules);
  }

  @override
  int get hashCode => title.hashCode ^ rules.hashCode;
}
