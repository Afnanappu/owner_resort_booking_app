import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_booking_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_rate_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/booking_rate_filter_row.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/revenue_rate_line_chart.dart';
import 'package:owner_resort_booking_app/features/dashboard/view_model/bloc/bloc_revenue_and_report/revenue_and_report_bloc.dart';

// class ScreenRevenueAndReport extends StatelessWidget {import 'package:flutter/material.dart';

class ScreenRevenueAndReport extends StatefulWidget {
  const ScreenRevenueAndReport({super.key});

  @override
  State<ScreenRevenueAndReport> createState() => _ScreenRevenueAndReportState();
}

class _ScreenRevenueAndReportState extends State<ScreenRevenueAndReport> {
  String selectedFilter = 'Month';

  DateTimeRange selectedDateRange = DateTimeRange(
    start: DateTime(DateTime.now().year, DateTime.now().month, 1),
    end: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
  );

  RevenueModel filterData(
      DateTimeRange selectedDateRange,
      List<RevenueRateModel> revenueData,
      List<RevenueBookingModel> resortData) {
    // Filter revenue rate chart data
    List<RevenueRateModel> filteredRevenue = revenueData.where((data) {
      return data.date
              .isAfter(selectedDateRange.start.subtract(Duration(days: 1))) &&
          data.date.isBefore(selectedDateRange.end.add(Duration(days: 1)));
    }).toList();

    // Filter resort booking data
    List<RevenueBookingModel> filteredResorts = resortData.where((resort) {
      return resort.revenue >
          0; // Only include resorts with revenue in the range
    }).toList();

    return RevenueModel(
      revenueRates: filteredRevenue,
      resortBookings: filteredResorts,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Revenue & Report',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<RevenueAndReportBloc, RevenueAndReportState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Center(
                child: Text('Loading...'),
              ),
              loaded: (revenueModel) {
                final filteredData = filterData(
                  selectedDateRange,
                  revenueModel.revenueRates,
                  revenueModel.resortBookings,
                );
                final filteredRevenue = filteredData.revenueRates;
                final filteredBookings = filteredData.resortBookings;
                return ListView(
                  shrinkWrap: true,
                  children: [
                    BookingRateFilterRow(
                      selectedValue: selectedFilter,
                      onFilterChanged: (value) {
                        setState(() {
                          selectedFilter = value;
                        });
                      },
                      onDateRangeChanged: (DateTimeRange value) {
                        setState(() {
                          selectedDateRange = value;
                        });
                      },
                    ),
                    MySpaces.hSpace20,
                    RevenueRateLineChart(
                      revenueRateData: filteredRevenue,
                      selectedFilter: selectedFilter,
                      selectedDateRange: selectedDateRange,
                    ),
                    MySpaces.hSpace40,
                    ListView.builder(
                      itemCount: filteredBookings.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final booking = filteredBookings[index];
                        return CustomAppContainer(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: ListTile(
                              leading: AspectRatio(
                                aspectRatio: 1,
                                child: Image.memory(
                                  base64Decode(booking.image),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              title: Text(booking.resortName),
                              subtitle: Text('bookings: ${booking.bookings}'),
                              trailing: Text(
                                customCurrencyFormat(
                                  booking.revenue,
                                ),
                              ),
                            ));
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
