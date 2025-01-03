import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';

class CustomAppContainer extends StatelessWidget {
  const CustomAppContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.thickness = .5,
    this.boxShadow,
    this.bgColor,
    this.padding,
    this.margin,
  });
  final double? height;
  final double? width;
  final double thickness;
  final Widget child;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRad10),
        border: Border.all(
          color: MyColors.greyLight,
          width: thickness,
        ),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
