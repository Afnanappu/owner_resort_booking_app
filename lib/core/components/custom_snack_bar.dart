import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String message,
  Color bgColor = MyColors.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
      dismissDirection: DismissDirection.down,
      margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
