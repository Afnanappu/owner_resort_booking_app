import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/custom_container.dart';

class CustomWidgetForHome extends StatelessWidget {
  const CustomWidgetForHome({
    super.key,
    required this.title,
    required this.child,
    this.paddingVertical = 20,
    this.paddingHorizontal = 20,
  });

  final String title;
  final Widget child;
  final double paddingVertical;
  final double paddingHorizontal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyles.titleMediumSemiBoldBlack,
          ),
          MySpaces.hSpace20,
          CustomContainer(
            paddingHorizontal: paddingHorizontal,
            paddingVertical: paddingVertical,
            child: child,
          ),
        ],
      ),
    );
  }
}
