import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

class ElevatedButtonAuthentication extends StatelessWidget {
  const ElevatedButtonAuthentication({
    super.key,
    required this.title,
    this.onPressed,
    this.haveBg = true,
    this.height = 48,
    this.fontSize = 22,
  });
  final String title;
  final void Function()? onPressed;
  final bool haveBg;
  final double height;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 350, maxHeight: 60),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(290, height),
          backgroundColor:
              haveBg ? MyColors.orange : MyColors.scaffoldDefaultColor,
          side: haveBg
              ? null
              : BorderSide(
                  color: MyColors.orange,
                  width: 1.5,
                ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: haveBg ? MyColors.white : MyColors.orange,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
