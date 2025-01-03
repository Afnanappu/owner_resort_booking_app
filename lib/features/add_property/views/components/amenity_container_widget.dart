import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/models/amenities_model.dart';

class AmenityContainerWidget extends StatelessWidget {
  const AmenityContainerWidget({
    super.key,
    required this.amenity,
  });
  final AmenitiesModel amenity;
  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(Icons.wifi),
      label: Text(amenity.name),
    );
  }
}