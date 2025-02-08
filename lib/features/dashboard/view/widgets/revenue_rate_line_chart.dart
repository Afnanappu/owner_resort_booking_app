import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:owner_resort_booking_app/features/dashboard/models/revenue_rate_model.dart';

class RevenueRateLineChart extends StatelessWidget {
  final List<RevenueRateModel> revenueRateData;

  const RevenueRateLineChart({
    super.key,
    required this.revenueRateData,
    required this.selectedFilter,
    required this.selectedDateRange,
  });
  final String selectedFilter;
  final DateTimeRange selectedDateRange;

  List<FlSpot> getFilteredData() {
    DateTime startDate = selectedDateRange.start;
    DateTime endDate = selectedDateRange.end;

    return revenueRateData
        .where(
          (e) =>
              e.date.isAfter(
                startDate.subtract(
                  const Duration(days: 1),
                ),
              ) &&
              e.date.isBefore(
                endDate.add(
                  const Duration(days: 1),
                ),
              ),
        )
        .map((e) => FlSpot(
              getXAxis(e.date).toDouble(),
              e.revenue.toDouble(),
            ))
        .toList();
  }

  int getXAxis(DateTime date) {
    switch (selectedFilter) {
      case 'Year':
        return date.month;
      case 'Week':
        return date.weekday;
      case 'Month':
      default:
        return date.day;
    }
  }

  double getMaxX() {
    switch (selectedFilter) {
      case 'Week':
        return 7;
      case 'Year':
        return 12;
      case 'Month':
      default:
        return 31;
    }
  }

  double getInterval() {
    switch (selectedFilter) {
      case 'Week':
        return 1;
      case 'Year':
        return 1;
      case 'Month':
      default:
        return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    var maxYValue = revenueRateData.fold(
      0.0,
      (previousValue, element) => previousValue + element.revenue,
    );
    if (maxYValue < 10) {
      maxYValue = 20;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AspectRatio(
            aspectRatio: 1.70,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true, drawVerticalLine: false),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      interval: getInterval(),
                      getTitlesWidget: (value, meta) {
                        return Text(
                          selectedFilter == 'Year'
                              ? DateTime(0, value.toInt()).month.toString()
                              : value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(customCurrencyFormat(value.round(), 0),
                            style: const TextStyle(fontSize: 10));
                      },
                    ),
                  ),

                  //Removing the top and right numbers
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
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
                      color: MyColors.orange.withValues(alpha: 0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
