import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.width,
    this.onPressed,
    this.backgroundColor,
    this.child,
    this.outlined = false,
    this.height,
    this.style,
  });
  final String text;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget? child;
  final bool outlined;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: child == null
            ? Text(
                text,
                style: style ??
                    (outlined
                        ? MyTextStyles.titleMediumSemiBoldWhite
                            .copyWith(color: MyColors.orange)
                        : MyTextStyles.titleMediumSemiBoldWhite),
              )
            : child!,
        style: ElevatedButton.styleFrom(
          // padding:
          //     EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRad10),
            side: outlined
                ? BorderSide(
                    color: MyColors.orange,
                  )
                : BorderSide.none,
          ),
          backgroundColor:
              outlined ? MyColors.scaffoldDefaultColor : backgroundColor,
        ),
      ),
    );
  }
}
