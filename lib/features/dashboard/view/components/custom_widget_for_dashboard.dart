import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/custom_container.dart';

class CustomWidgetForHome extends StatelessWidget {
  const CustomWidgetForHome({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            child: child,
          ),
        ],
      ),
    );
  }
}
