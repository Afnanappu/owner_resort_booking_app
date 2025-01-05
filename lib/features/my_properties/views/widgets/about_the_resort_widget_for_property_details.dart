import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/models/basic_details_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_details_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_container_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/basic_details_widget_for_property_details.dart';

class AboutTheResortWidgetForPropertyDetails extends StatelessWidget {
  const AboutTheResortWidgetForPropertyDetails({
    super.key,
    required this.basicDetails,
    required this.propertyModel,
  });
  final PropertyDetailsModel propertyModel;

  final BasicDetailsModel basicDetails;

  @override
  Widget build(BuildContext context) {
    return CustomContainerForPropertyDetails(
      title: 'About the Resort',
      child: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Description',
                style: MyTextStyles.titleMediumSemiBoldBlack,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  propertyModel.description,
                  style: MyTextStyles.bodySmallNormalBlack,
                ),
              )
            ],
          ),

          // Basic details
          BasicDetailsWidgetForPropertyDetails(
            basicDetails: basicDetails,
          ),
        ],
      ),
    );
  }
}
