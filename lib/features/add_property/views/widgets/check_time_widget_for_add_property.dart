import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/custom_time_picker.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';

class CheckTimeWidgetForAddProperty extends StatelessWidget {
  const CheckTimeWidgetForAddProperty({
    super.key,
    required this.checkInTimeController,
    required this.checkOutTimeController,
  });

  final TextEditingController checkInTimeController;
  final TextEditingController checkOutTimeController;
  // final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Check-In Time:',
              style: MyTextStyles.bodySmallMediumBlack,
            ),
            CustomTextFormFieldForAddProperty(
              readOnly: true,
              width: MyScreenSize.width * .5,
              hintText: 'Pick Time',
              controller: checkInTimeController,
              suffixIcon: IconButton(
                onPressed: () async {
                  final pickedTime = await customTimePicker(
                      context: context, hour: 7, minute: 0);
                  if (pickedTime != null) {
                    checkInTimeController.text = pickedTime.format(context);
                  }
                },
                icon: Icon(Icons.access_time_outlined),
              ),
              validator: (value) {
                if (!MyRegex.emptySpaceValidation(value)) {
                  return 'Don\'t use empty space, user characters';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Check-Out Time:',
              style: MyTextStyles.bodySmallMediumBlack,
            ),
            CustomTextFormFieldForAddProperty(
              width: MyScreenSize.width * .5,
              hintText: 'Pick Time',
              readOnly: true,
              controller: checkOutTimeController,
              suffixIcon: IconButton(
                onPressed: () async {
                  final pickedTime = await customTimePicker(
                      context: context, hour: 22, minute: 0);
                  if (pickedTime != null) {
                    checkOutTimeController.text = pickedTime.format(context);
                  }
                },
                icon: Icon(Icons.access_time_outlined),
              ),
              validator: (value) {
                if (!MyRegex.emptySpaceValidation(value)) {
                  return 'Don\'t use empty space, user characters';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
