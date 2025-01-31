import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/components/row_data_widget.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';

class PaymentReviewWidget extends StatelessWidget {
  const PaymentReviewWidget({
    super.key,
    required this.roomList,
    required this.nights,
    required this.price,
  });

  final List<RoomModel> roomList;
  final int nights;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Payment',
          style: MyTextStyles.titleMediumSemiBoldBlack,
        ),
        CustomAppContainer(
          margin: const EdgeInsets.all(12),
          padding: EdgeInsets.all(18),
          child: Column(
            spacing: 10,
            children: [
              //base price
              RowDataWidget(
                left: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Base Price',
                      style: MyTextStyles.bodyLargeMediumBlack,
                    ),
                    Text(
                      '${roomList.length > 1 ? 'Rooms' : 'Room'}  x $nights Night',
                    ),
                  ],
                ),
                right: Text(
                  customCurrencyFormat(price * nights),
                  style: MyTextStyles.bodyLargeBoldBlack,
                ),
              ),

              CustomDivider(),

              //booking fee
              RowDataWidget(
                left: Text(
                  'Booking Fee',
                  style: MyTextStyles.bodyLargeMediumBlack,
                ),
                right: Text(
                  customCurrencyFormat(50),
                  style: MyTextStyles.bodyLargeBoldBlack,
                ),
              ),

              CustomDivider(),

              //Total amount
              RowDataWidget(
                left: Text(
                  'Total Amount',
                  style: MyTextStyles.bodyExtraLargeBoldBlack,
                ),
                right: Text(
                  customCurrencyFormat((price * nights) + 50),
                  style: MyTextStyles.bodyExtraLargeBoldBlack,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
