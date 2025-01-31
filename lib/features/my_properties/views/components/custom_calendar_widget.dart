import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_date_range_model.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendar extends StatelessWidget {
  final List<PickedDateRangeModel> bookedPeriods;

  const BookingCalendar({super.key, required this.bookedPeriods});

  @override
  Widget build(BuildContext context) {
    Set<DateTime> bookedDays = _getBookedDays();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TableCalendar(
        firstDay: DateTime(2023, 1, 1),
        lastDay: DateTime(2030, 12, 31),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
          CalendarFormat.week: 'Week'
        },
        selectedDayPredicate: (day) => bookedDays.contains(
          DateTime(
            day.year,
            day.month,
            day.day,
          ),
        ),
        calendarStyle: CalendarStyle(
          todayTextStyle: TextStyle(color: MyColors.orange),
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: MyColors.orange,
              width: 1,
            ),
          ),
          selectedDecoration: BoxDecoration(
            color: MyColors.orange, // Highlight booked days
            shape: BoxShape.circle,
          ),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          if (bookedDays.contains(selectedDay)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("This date is already booked!")),
            );
          }
        },
      ),
    );
  }

  /// Extract all booked dates from the given list
  Set<DateTime> _getBookedDays() {
    Set<DateTime> bookedDays = {};

    for (var period in bookedPeriods) {
      if (period.startDate != null && period.endDate != null) {
        DateTime start = period.startDate!;
        DateTime end = period.endDate!;

        for (DateTime date = start;
            date.isBefore(end.add(const Duration(days: 1)));
            date = date.add(const Duration(days: 1))) {
          bookedDays.add(DateTime(date.year, date.month, date.day));
        }
      }
    }
    log(bookedDays.toString());
    return bookedDays;
  }
}
