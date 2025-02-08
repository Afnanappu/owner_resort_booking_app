import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/booking_rate_model.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/custom_widget_for_dashboard.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/booking_rate_filter_row.dart';
import 'package:intl/intl.dart';

class BookingRateLineChart extends StatefulWidget {
  final List<BookingRateModel> bookingRateData;

  const BookingRateLineChart({
    super.key,
    required this.bookingRateData,
  });

  @override
  State<BookingRateLineChart> createState() => _BookingRateLineChartState();
}

class _BookingRateLineChartState extends State<BookingRateLineChart> {
  String selectedFilter = 'Month';
  DateTimeRange selectedDateRange = DateTimeRange(
    start: DateTime(DateTime.now().year, DateTime.now().month, 1),
    end: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
  );

  // Helper function to calculate the start of the week (Monday)
  DateTime _getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  // Helper function to calculate the end of the week (Sunday)
  DateTime _getEndOfWeek(DateTime date) {
    return date.add(Duration(days: DateTime.daysPerWeek - date.weekday));
  }

  // Filter data based on selected filter and date range
  List<FlSpot> getFilteredData() {
    DateTime startDate = selectedDateRange.start;
    DateTime endDate = selectedDateRange.end;

    // Adjust start and end dates based on the selected filter
    switch (selectedFilter) {
      case 'Week':
        startDate =
            _getStartOfWeek(DateTime.now()); // Start of the current week
        endDate = _getEndOfWeek(DateTime.now()); // End of the current week
        break;
      case 'Year':
        startDate = DateTime(DateTime.now().year, 1, 1);
        endDate = DateTime(DateTime.now().year, 12, 31);
        break;
      case 'Month':
      default:
        // Use the selected date range for the month filter
        break;
    }

    // Filter the data based on the date range
    return widget.bookingRateData
        .where((e) =>
            e.bookedDate.isAfter(startDate.subtract(const Duration(days: 1))) &&
            e.bookedDate.isBefore(endDate.add(const Duration(days: 1))))
        .map((e) => FlSpot(
              getXAxis(e.bookedDate).toDouble(),
              e.count.toDouble(), // Replace with your actual y-axis value
            ))
        .toList();
  }

  // Calculate X-axis value based on the selected filter
  int getXAxis(DateTime date) {
    switch (selectedFilter) {
      case 'Year':
        return date.month; // Use month for the year filter
      case 'Week':
        return date.weekday; // Use weekday for the week filter
      case 'Month':
      default:
        return date.day; // Use day for the month filter
    }
  }

  // Get the maximum X-axis value based on the selected filter
  double getMaxX() {
    switch (selectedFilter) {
      case 'Week':
        return 7; // 7 days in a week
      case 'Year':
        return 12; // 12 months in a year
      case 'Month':
      default:
        return 31; // Maximum 31 days in a month
    }
  }

  // Get the interval for the X-axis labels
  double getInterval() {
    switch (selectedFilter) {
      case 'Week':
        return 1; // Show every day
      case 'Year':
        return 1; // Show every month
      case 'Month':
      default:
        return 5; // Show every 5 days
    }
  }

  @override
  Widget build(BuildContext context) {
    var maxYValue = widget.bookingRateData.fold(
      0,
      (previousValue, element) => previousValue + element.count,
    );
    if (maxYValue < 10) {
      maxYValue = 20;
    }
    return CustomWidgetForHome(
      paddingHorizontal: 0,
      title: 'Booking Rate',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BookingRateFilterRow(
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
          ),
          MySpaces.hSpace20,
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      left: BorderSide(color: MyColors.grey),
                      bottom: BorderSide(color: MyColors.grey),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 20,
                        interval: getInterval(),
                        getTitlesWidget: (value, meta) {
                          return Text(
                            selectedFilter == 'Year'
                                ? DateFormat.MMM()
                                    .format(DateTime(0, value.toInt()))
                                : value.toInt().toString(),
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(value.toInt().toString(),
                                style: const TextStyle(fontSize: 10)),
                          );
                        },
                      ),
                    ),
                  ),
                  minX: 1,
                  maxX: getMaxX(),
                  minY: 0,
                  maxY: maxYValue.toDouble(),
                  lineBarsData: [
                    LineChartBarData(
                      spots: getFilteredData(),
                      isCurved: true,
                      color: MyColors.orange,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: MyColors.orange.withValues(alpha:0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Total Revenue'),
//                     Text('28'),
//                   ],
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                   child: Divider(
//                     color: MyColors.greyLight,
//                   ),
//                 ),
