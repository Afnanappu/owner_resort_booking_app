import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';

class CustomContainerForPropertyDetails extends StatelessWidget {
  const CustomContainerForPropertyDetails({
    super.key,
    required this.title,
    required this.child,
    this.padding = 15,
  });
  final String title;
  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text(
          title,
          style: MyTextStyles.titleLargeSemiBoldBlack,
        ),
        CustomAppContainer(
          width: MyScreenSize.width,
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ],
    );
  }
}
