import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';

Future<dynamic> showDialogForAddDetails({
  required BuildContext context,
  required String title,
  required void Function()? onPressed,
  required TextEditingController controller,
  String? hintText,
}) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(title.isNotEmpty ? title : 'Add Details'),
        titleTextStyle: MyTextStyles.bodyLargeMediumBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRad10),
        ),
        content: CustomTextFormFieldForAddProperty(
          hintText: hintText ?? 'Type your point',
          controller: controller,
          validator: (value) {
            if (!MyRegex.emptySpaceValidation(value)) {
              return 'Don\'t use empty space, user characters';
            } else {
              return null;
            }
          },
        ),
        actions: [
          CustomElevatedButton(
            text: 'Add',
            onPressed: onPressed,
          ),
        ],
      );
    },
  );
}
