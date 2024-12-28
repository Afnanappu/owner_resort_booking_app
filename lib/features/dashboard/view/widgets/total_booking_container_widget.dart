import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

class TotalBookingContainerWidget extends StatelessWidget {
  const TotalBookingContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Upcoming'),
            Text('10'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Divider(
            color: MyColors.greyLight,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Completed'),
            Text('8'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Divider(
            color: MyColors.greyLight,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cancelled'),
            Text('1'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Divider(
            color: MyColors.greyLight,
          ),
        ),
      ],
    );
  }
}