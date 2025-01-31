// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:owner_resort_booking_app/core/data/models/basic_details_model.dart';
import 'package:owner_resort_booking_app/core/data/models/rules_details_model.dart';

class ExtraDetailsModel {
  BasicDetailsModel basicDetailsModel;
  RulesDetailsModel rulesDetailsModel;
  ExtraDetailsModel({
    required this.basicDetailsModel,
    required this.rulesDetailsModel,
  });

  ExtraDetailsModel copyWith({
    BasicDetailsModel? basicDetailsModel,
    RulesDetailsModel? rulesDetailsModel,
  }) {
    return ExtraDetailsModel(
      basicDetailsModel: basicDetailsModel ?? this.basicDetailsModel,
      rulesDetailsModel: rulesDetailsModel ?? this.rulesDetailsModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'basicDetailsModel': basicDetailsModel.toMap(),
      'rulesDetailsModel': rulesDetailsModel.toMap(),
    };
  }

  factory ExtraDetailsModel.fromMap(Map<String, dynamic> map) {
    return ExtraDetailsModel(
      basicDetailsModel: BasicDetailsModel.fromMap(map['basicDetailsModel'] as Map<String,dynamic>),
      rulesDetailsModel: RulesDetailsModel.fromMap(map['rulesDetailsModel'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExtraDetailsModel.fromJson(String source) => ExtraDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ExtraDetailsModel(basicDetailsModel: $basicDetailsModel, rulesDetailsModel: $rulesDetailsModel)';

  @override
  bool operator ==(covariant ExtraDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.basicDetailsModel == basicDetailsModel &&
      other.rulesDetailsModel == rulesDetailsModel;
  }

  @override
  int get hashCode => basicDetailsModel.hashCode ^ rulesDetailsModel.hashCode;
}
