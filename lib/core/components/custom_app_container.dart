import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';

class CustomAppContainer extends StatelessWidget {
  const CustomAppContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
  });
  final double? height;
  final double? width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRad10),
          border: Border.all(
            color: MyColors.greyLight,
            width: .5,
          )),
      child: child,
    );
  }
}
