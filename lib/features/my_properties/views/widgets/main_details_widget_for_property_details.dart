import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/math_functions.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_details_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_icon_widget.dart';

class MainDetailsWidgetForPropertyDetails extends StatelessWidget {
  const MainDetailsWidgetForPropertyDetails({
    super.key,
    required this.propertyModel,
  });

  final PropertyDetailsModel propertyModel;

  @override
  Widget build(BuildContext context) {
    final ratingAvg = getAverage(
      propertyModel.reviews
          .map(
            (e) => e.rating,
          )
          .toList(),
    );
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                propertyModel.name,
                style: MyTextStyles.nameStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            CustomIconTextWidget(
              icon: Icon(
                Icons.star_rate_rounded,
                color: MyColors.orange,
                size: 22,
              ),
              content: Text(
                '$ratingAvg/5',
                style: MyTextStyles.ratingStyle,
              ),
            ),
          ],
        ),
        CustomIconTextWidget(
          icon: Icon(
            Icons.location_on_outlined,
            color: MyColors.grey,
            size: 22,
          ),
          content: Expanded(
            child: Text(
              propertyModel.location.address,
              style: MyTextStyles.locationStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
        Text(
          'Type: ${propertyModel.type}',
          style: MyTextStyles.typeStyle,
        )
      ],
    );
  }
}
