import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/data/models/location_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/price_per_day_widget.dart';
import 'package:shimmer/shimmer.dart';

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
    this.onTap,
  });
  final String image;
  final String propertyName;
  final LocationModel location;
  final double rating;
  final List<String> reviews;
  final int rooms;
  final double price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: CustomAppContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRad10),
                  topRight: Radius.circular(borderRad10),
                ),
                child: SizedBox(
                  height: 180,
                  child: Image.memory(
                    base64Decode(image),
                    fit: BoxFit.cover,
                  ),
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
        PricePerDayWidget(
          priceText: 'From ₹$price',
          priceStyle: MyTextStyles.bodySmallMediumBlack
              .copyWith(fontWeight: FontWeight.w700),
          suffixStyle: MyTextStyles.bodySmallMediumBlack,
        ),
      ],
    );
  }

  Row _locationAndReviewRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: MyColors.greyLight,
              ),
              MySpaces.wSpace5,
              Expanded(
                child: Text(
                  location.address,
                  style: MyTextStyles.textFieldMediumGreyLight,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
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
              '$rating (${reviews.length} Reviews)',
              style: MyTextStyles.textFieldMediumGreyLight,
            ),
          ],
        ),
      ],
    );
  }
}


//Simmer

class PropertyWidgetShimmer extends StatelessWidget {
  const PropertyWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: CustomAppContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRad10),
                  topRight: Radius.circular(borderRad10),
                ),
                child: Container(
                  height: 180,
                  color: Colors.grey[300], // Placeholder for image
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
                    // Property Name Placeholder
                    Container(
                      width: double.infinity,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    MySpaces.hSpace5,
                    _locationAndReviewRow(),
                    _totalRoomsAndPriceRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _totalRoomsAndPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100,
          height: 14,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Container(
          width: 80,
          height: 14,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
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
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.grey[300],
              ),
              MySpaces.wSpace5,
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 1,
          child: Divider(
            color: Colors.grey[300],
            thickness: 16,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star_border,
              size: 20,
              color: Colors.grey[300],
            ),
            MySpaces.wSpace5,
            Container(
              width: 80,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
