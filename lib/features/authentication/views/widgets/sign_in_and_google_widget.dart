import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/elevated_button_auth.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class SignInAndGoogleButtonWidget extends StatelessWidget {
  const SignInAndGoogleButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButtonAuthentication(
          title: 'Sign in',
          haveBg: true,
          onPressed: () async {
           
          },
        ),
        MySpaces.hSpace20,
        Text(
          'Or Sign in with',
          style: MyTextStyles.bodySmallMediumGreyLight,
        ),
        MySpaces.hSpace20,
        Image.asset(
          'assets/google-icon.png',
          width: 35,
          fit: BoxFit.fitWidth,
        ),
        MySpaces.hSpace40,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Don't you have an account? ",
            children: [
              TextSpan(
                text: "Register",
                style: MyTextStyles.bodyLargeNormalWhite.apply(
                  decoration: TextDecoration.underline,
                  color: MyColors.orange,
                  fontWeightDelta: 2,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.go('/${AppRoutes.signUp}');
                  },
              ),
            ],
            style: MyTextStyles.bodySmallMediumGreyLight,
          ),
        ),
      ],
    );
  }
}
