import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/data/models/basic_details_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_list_points_widget_for_property_details.dart';

class BasicDetailsWidgetForPropertyDetails extends StatelessWidget {
  const BasicDetailsWidgetForPropertyDetails({
    super.key,
    required this.basicDetails,
  });

  final BasicDetailsModel basicDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          basicDetails.title,
          style: MyTextStyles.titleMediumSemiBoldBlack,
        ),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final subDetails = basicDetails.subDetails[index];
            return CustomListPointsWidgetForPropertyDetails(
              title: subDetails.title,
              details: subDetails.details,
            );
          },
          separatorBuilder: (context, index) {
            return CustomDivider(
              vertical: 5,
              horizontal: 34,
            );
          },
          itemCount: basicDetails.subDetails.length,
        )
      ],
    );
  }
}
