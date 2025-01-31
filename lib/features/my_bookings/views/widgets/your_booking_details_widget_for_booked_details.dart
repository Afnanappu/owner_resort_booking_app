import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/components/row_data_widget.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/data/models/user_model.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_icon_widget.dart';

class YourBookingDetailsWidgetForBookedDetails extends StatelessWidget {
  const YourBookingDetailsWidgetForBookedDetails({
    super.key,
    required this.startingDate,
    required this.endDate,
    required this.peoples,
    required this.bookingId,
    required this.userId,
  });

  final String bookingId;
  final String startingDate;
  final String endDate;
  final int peoples;
  final String userId;

  @override
  Widget build(BuildContext context) {
    context.read<UserDataCubit>().fetchUserData(userId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Your Booking Details',
          style: MyTextStyles.titleMediumSemiBoldBlack,
        ),
        CustomAppContainer(
          margin: const EdgeInsets.all(12),
          padding: EdgeInsets.all(18),
          child: Column(
            spacing: 10,
            children: [
              //booked id
              RowDataWidget(
                left: Text(
                  'Booking Id',
                  style: MyTextStyles.titleSmallSemiBoldBlack,
                ),
                right: Text(
                  bookingId,
                  style: MyTextStyles.titleSmallSemiBoldBlack,
                ),
              ),

              CustomDivider(
                horizontal: MyScreenSize.width * .1,
              ),

              //booked Date
              RowDataWidget(
                left: CustomIconTextWidget(
                  icon: Icon(
                    Icons.calendar_today_rounded,
                    color: MyColors.grey,
                  ),
                  content: Text(
                    'Dates',
                    style: MyTextStyles.titleSmallSemiBoldBlack,
                  ),
                ),
                right: Text(
                  '$startingDate - $endDate',
                  style: MyTextStyles.titleSmallSemiBoldBlack,
                ),
              ),

              CustomDivider(
                horizontal: MyScreenSize.width * .1,
              ),

              RowDataWidget(
                left: CustomIconTextWidget(
                  icon: Icon(
                    Icons.people_outline_rounded,
                    color: MyColors.grey,
                  ),
                  content: Text(
                    'Peoples',
                    style: MyTextStyles.titleSmallSemiBoldBlack,
                  ),
                ),
                right: Text(
                  '$peoples peoples',
                  style: MyTextStyles.titleSmallSemiBoldBlack,
                ),
              ),

              CustomDivider(
                horizontal: MyScreenSize.width * .1,
              ),

              //booking customer
              RowDataWidget(
                left: CustomIconTextWidget(
                  icon: Icon(
                    Icons.person_outline_outlined,
                    color: MyColors.grey,
                  ),
                  content: Text(
                    'Customer',
                    style: MyTextStyles.titleSmallSemiBoldBlack,
                  ),
                ),
                right: BlocBuilder<UserDataCubit, UserModel?>(
                  builder: (context, state) {
                    return Text(
                      state?.name ?? 'Gust',
                      style: MyTextStyles.titleSmallSemiBoldBlack,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
