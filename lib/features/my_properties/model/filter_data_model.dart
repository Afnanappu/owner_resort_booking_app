// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:owner_resort_booking_app/features/my_properties/services/my_property_services.dart';

class FilterDataModel {
  String uid;
  FilterOptions? filterOptions;
  String? priceRange;
  List<String> category = const [];
  int? rating;
  FilterDataModel({
    required this.uid,
    this.filterOptions,
    this.priceRange,
    this.category = const [],
    this.rating,
  });
}
