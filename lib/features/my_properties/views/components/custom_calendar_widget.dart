import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomCalendarWidget extends StatelessWidget {
  const CustomCalendarWidget({
    super.key,
    this.disabled = true,
    required this.selectedDates,
  });
  final bool disabled;
  final List<DateTime> selectedDates;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.greyLight, width: .25),
        borderRadius: BorderRadius.circular(borderRad10),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: AbsorbPointer(
        absorbing: disabled,
        child: SfDateRangePicker(
          enableMultiView: false,
          allowViewNavigation: true,
          view: DateRangePickerView.month,
          backgroundColor: MyColors.scaffoldDefaultColor,
          selectionMode: DateRangePickerSelectionMode.single,
          enablePastDates: false,
          selectionColor: MyColors.orange,
          initialSelectedDates: selectedDates,
          monthCellStyle: DateRangePickerMonthCellStyle(
            specialDatesTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            specialDatesDecoration: BoxDecoration(
              color: MyColors.orange,
              shape: BoxShape.circle,
            ),
          ),
          toggleDaySelection: false,
          todayHighlightColor: MyColors.orangeBackground,
          monthViewSettings: DateRangePickerMonthViewSettings(
            specialDates: selectedDates,
          ),
          // onSelectionChanged: (args) {
          //   // Prevent any user selection
          //   if (args.value is DateTime || args.value is List<DateTime>) {
          //     return; // Do nothing
          //   }
          // },
          // onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
          //   if (args.value is List<DateTime>) {
          //     final List<DateTime> newlySelectedDates = args.value;
          //     // Handle the newly selected dates here
          //     print('Selected dates: $newlySelectedDates');
          //   }
          // },
        ),
      ),
    );
  }
}
