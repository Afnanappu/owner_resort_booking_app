import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/data/models/amenities_model.dart';

class AmenityContainerWidget extends StatelessWidget {
  const AmenityContainerWidget({
    super.key,
    required this.amenity,
  });
  final AmenitiesModel amenity;
  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: amenity.image == null
          ? null
          : Image.memory(
              base64Decode(amenity.image!),
            ),
      label: Text(amenity.name),
    );
  }
}
