import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.horizontal = 0,
    this.vertical = 0,
    this.thickness = 0,
  });
  final double horizontal;
  final double vertical;
  final double thickness;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Divider(
        color: MyColors.greyLight,
        thickness: thickness,
      ),
    );
  }
}
