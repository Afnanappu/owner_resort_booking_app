import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

class CustomAddDetailsForAllWidget extends StatelessWidget {
  const CustomAddDetailsForAllWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.haveTrailing = true,
    this.trailingText,
    this.trailingIcon,
  });
  final String text;
  final String? trailingText;
  final IconData? trailingIcon;

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
              trailingText == null ? 'Add' : trailingText!,
              style: MyTextStyles.titleMediumSemiBoldBlack
                  .copyWith(color: MyColors.orange),
            ),
            icon: Icon(
              trailingIcon == null ? Icons.add : trailingIcon!,
              color: MyColors.orange,
              size: 22,
            ),
          )
      ],
    );
  }
}
