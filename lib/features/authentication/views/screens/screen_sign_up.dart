import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/register_button_widget.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/register_text_form_fields.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MyScreenSize.height,
          width: MyScreenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MySpaces.flex1,
                Text(
                  'Register',
                  style: MyTextStyles.headlineSmallSemiBoldBlack,
                ),
                Text(
                  'Create an account and add your services',
                  style: MyTextStyles.bodySmallMediumGreyLight,
                ),
                MySpaces.hSpace40,

                //Registration text form field:  name, email, password and confirm password
                RegisterTextFormFields(),

                MySpaces.hSpace40,

                //Register buttons
                RegisterButtonWidget(),
                MySpaces.flex1,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
