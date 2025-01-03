import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/models/amenities_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/amenities_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/amenity_container_widget.dart';

class AmenitiesWidgetForAddRoom extends StatelessWidget {
  const AmenitiesWidgetForAddRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AmenitiesAddCubit, List<AmenitiesModel>>(
      builder: (context, amenities) {
        return Wrap(
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: amenities.map(
            (item) {
              return AmenityContainerWidget(
                amenity: item,
              );
            },
          ).toList(),
        );
      },
    );
  }
}