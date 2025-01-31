import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
class RatingStartIndicatorComponent extends StatelessWidget {
  const RatingStartIndicatorComponent({
    super.key,
    required this.index,
    required this.indicatorValue,
    required this.rating,
  });

  final int index;
  final double indicatorValue;
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        Text(
          '$index',
          style: TextStyle(fontSize: 15),
        ),
        Icon(
          Icons.star,
          size: 17,
        ),
        SizedBox(
          width: 100,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(borderRad10),
            valueColor: AlwaysStoppedAnimation(MyColors.black),
            value: indicatorValue,
          ),
        ),
        Text(
          '$rating',
          style: TextStyle(fontSize: 15, color: MyColors.grey),
        ),
      ],
    );
  }
}
