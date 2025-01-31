import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';

class BookedPropertyCard extends StatelessWidget {
  final String bookingId;
  final String propertyName;
  final String bookingDates;
  final String price;
  final String imageUrl;
  final String status;
  final VoidCallback? onInfoPressed;
  final VoidCallback? onStatusPressed;

  const BookedPropertyCard({
    super.key,
    required this.bookingId,
    required this.propertyName,
    required this.bookingDates,
    required this.price,
    required this.imageUrl,
    required this.status,
    this.onInfoPressed,
    this.onStatusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      height: 170,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Booking Id: $bookingId',
          style: MyTextStyles.bodyLargeBoldBlack,
        ),
        IconButton(
          onPressed: onInfoPressed,
          icon: Icon(
            Icons.info_outline_rounded,
            color: MyColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return Row(
      children: [
        _buildImage(),
        MySpaces.wSpace10,
        Expanded(
          child: _buildPropertyInfo(),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: 90,
      height: 90,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: MemoryImage(base64Decode(imageUrl)),
          fit: BoxFit.fitHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRad10),
        ),
      ),
    );
  }

  Widget _buildPropertyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          propertyName,
          style: MyTextStyles.bodySmallMediumBlack,
        ),
        MySpaces.hSpace10,
        Text(
          bookingDates,
          style: MyTextStyles.bodySmallNormalBlack,
        ),
        MySpaces.hSpace10,
        _buildPriceAndStatus(),
      ],
    );
  }

  Widget _buildPriceAndStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(customCurrencyFormat(double.parse(price)),
            style: MyTextStyles.bodySmallMediumBlack),
        CustomElevatedButton(
          backgroundColor: switch (status.toLowerCase()) {
            'active' => MyColors.success,
            String() => MyColors.orange,
          },
          onPressed: onStatusPressed,
          text: '',
          outlined: status == 'Cancelled' ? true : false,
          height: 25,
          child: Text(
            status,
            style: MyTextStyles.bodySmallMediumBlack.apply(
              color: switch (status.toLowerCase()) {
                'cancelled' => MyColors.orange,
                String() => MyColors.white,
              },
            ),
          ),
        )
      ],
    );
  }
}
