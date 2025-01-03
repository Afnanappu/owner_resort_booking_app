import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

class CustomAddDetailsForAllWidget extends StatelessWidget {
  const CustomAddDetailsForAllWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.haveTrailing = true,
  });
  final String text;
  final void Function()? onPressed;
  final bool haveTrailing;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MyTextStyles.titleMediumSemiBoldBlack,
        ),
        if (haveTrailing)
          TextButton.icon(
            onPressed: onPressed,
            label: Text(
              'Add',
              style: MyTextStyles.titleMediumSemiBoldBlack
                  .copyWith(color: MyColors.orange),
            ),
            icon: Icon(
              Icons.add,
              color: MyColors.orange,
              size: 22,
            ),
          )
      ],
    );
  }
}
