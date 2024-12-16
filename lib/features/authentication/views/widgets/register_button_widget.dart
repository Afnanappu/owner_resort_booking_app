import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/elevated_button_auth.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButtonAuthentication(
          title: 'Register',
          haveBg: true,
          onPressed: () {},
        ),
        MySpaces.hSpace20,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Already have an account? ",
            children: [
              TextSpan(
                text: "Login",
                style: MyTextStyles.bodyLargeNormalWhite.apply(
                  decoration: TextDecoration.underline,
                  color: MyColors.orange,
                  fontWeightDelta: 2,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.go('/');
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
