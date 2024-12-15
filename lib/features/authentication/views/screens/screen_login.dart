import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/login_text_form_fields.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/sign_in_and_google_widget.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MySpaces.flex2,
              Text(
                'Sign in',
                style: MyTextStyles.headlineSmallSemiBoldBlack,
              ),
              Text(
                'HI Welcome! Continue to login',
                style: MyTextStyles.bodySmallMediumGreyLight,
              ),
              MySpaces.hSpace60,

              //email and password text form field
              LoginTextFormFields(),

              MySpaces.hSpace60,

              //buttons for sign in and google
              SignInAndGoogleButtonWidget(),
              MySpaces.flex1,
            ],
          ),
        ),
      ),
    ));
  }
}
