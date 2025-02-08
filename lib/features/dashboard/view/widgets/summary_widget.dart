// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/booking_rate_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/summary_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/total_booking_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/custom_widget_for_dashboard.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/booking_rate_line_chart.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/total_booking_container_widget.dart';
import 'package:shimmer/shimmer.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({
    super.key,
    required this.totalBookings,
    required this.bookingRateData,
    required this.summary,
  });

  final TotalBookingModel totalBookings;
  final List<BookingRateModel> bookingRateData;
  final SummaryModel? summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //total booking
        CustomWidgetForHome(
          title: 'Total Booking',
          child: TotalBookingContainerWidget(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Upcoming'),
                  Text('${totalBookings.upcomingBookings}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Completed'),
                  Text('${totalBookings.completedBookings}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Cancelled'),
                  Text('${totalBookings.cancelledBookings}'),
                ],
              ),
            ],
          ),
        ),

        BookingRateLineChart(
          bookingRateData: bookingRateData,
        ),

        //summary
        CustomWidgetForHome(
          title: 'Summary',
          child: TotalBookingContainerWidget(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Visitors'),
                  Text('${summary?.totalVisitors}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total rooms'),
                  Text('${summary?.roomCount}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Properties'),
                  Text('${summary?.propertyCount}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SummaryWidgetShimmer extends StatelessWidget {
  const SummaryWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          _buildShimmerContainer(),
          SizedBox(height: 16),
          _buildShimmerChart(),
          SizedBox(height: 16),
          _buildShimmerContainer(),
        ],
      ),
    );
  }

  Widget _buildShimmerContainer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        // child: Column(
        //   children: List.generate(3, (index) => _buildShimmerRow()),
        // ),
      ),
    );
  }

  // Widget _buildShimmerRow() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           width: 100,
  //           height: 16,
  //           color: Colors.white,
  //         ),
  //         Container(
  //           width: 50,
  //           height: 16,
  //           color: Colors.white,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildShimmerChart() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
