import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/utils/custom_date_formats.dart';

class BookingRateFilterRow extends StatefulWidget {
  final List<String> dropdownList;
  final String selectedValue;
  final ValueChanged<String> onFilterChanged;
  final ValueChanged<DateTimeRange> onDateRangeChanged;

  const BookingRateFilterRow({
    super.key,
    this.dropdownList = const ['Month', 'Week', 'Year'],
    required this.selectedValue,
    required this.onFilterChanged,
    required this.onDateRangeChanged,
  });

  @override
  State<BookingRateFilterRow> createState() => _BookingRateFilterRowState();
}

class _BookingRateFilterRowState extends State<BookingRateFilterRow> {
  late DateTimeRange selectedDateRange;

  @override
  void initState() {
    super.initState();
    // Default to this month's range
    DateTime now = DateTime.now();
    selectedDateRange = DateTimeRange(
      start: DateTime(now.year, now.month, 1),
      end: DateTime(now.year, now.month + 1, 0),
    );
  }

  Future<void> _selectDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: selectedDateRange,
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
      widget.onDateRangeChanged(picked);
    }
  }

  String getFormattedDateRange() {
    return '${customDateFormat4(selectedDateRange.start)} - ${customDateFormat4(selectedDateRange.end)}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: _selectDateRange,
          child: Text(
            getFormattedDateRange(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        DropdownButton<String>(
          value: widget.selectedValue,
          onChanged: (newValue) {
            if (newValue != null) {
              widget.onFilterChanged(newValue);
            }
          },
          items: widget.dropdownList.map((String e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            );
          }).toList(),
        ),
      ],
    );
  }
}
