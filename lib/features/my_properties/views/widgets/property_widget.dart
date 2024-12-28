import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    super.key,
    required this.image,
    required this.propertyName,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.rooms,
    required this.price,
  });
  final String image;
  final String propertyName;
  final String location;
  final double rating;
  final int reviews;
  final int rooms;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomAppContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRad10),
                topRight: Radius.circular(borderRad10),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
            MySpaces.hSpace10,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    propertyName,
                    style: MyTextStyles.titleMediumSemiBoldBlack,
                  ),
                  _locationAndReviewRow(),
                  _totalRoomsAndPriceRow()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _totalRoomsAndPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Rooms: $rooms',
          style: MyTextStyles.bodySmallMediumBlack,
        ),
        Text.rich(
          style: MyTextStyles.bodySmallMediumBlack
              .copyWith(fontWeight: FontWeight.w700),
          TextSpan(
            text: 'From ₹$price',
            children: [
              TextSpan(
                text: '/day',
                style: MyTextStyles.bodySmallMediumBlack,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _locationAndReviewRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20,
              color: MyColors.greyLight,
            ),
            MySpaces.wSpace5,
            Text(
              location,
              style: MyTextStyles.textFieldMediumGreyLight,
            ),
          ],
        ),
        SizedBox(
          width: 1,
          child: Divider(
            color: MyColors.greyLight,
            thickness: 16,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star_border,
              size: 20,
              color: MyColors.greyLight,
            ),
            MySpaces.wSpace5,
            Text(
              // '3.3 (251 Reviews)',
              '$rating ($reviews Reviews)',
              style: MyTextStyles.textFieldMediumGreyLight,
            ),
          ],
        ),
      ],
    );
  }
}
