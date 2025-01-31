import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/elevated_button_auth.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/features/authentication/view_model/bloc/bloc_auth/auth_bloc.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class SignInAndGoogleButtonWidget extends StatelessWidget {
  const SignInAndGoogleButtonWidget({
    super.key,
    required this.emailController,
    required this.ownerIdController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final TextEditingController emailController;
  final TextEditingController ownerIdController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButtonAuthentication(
          title: 'Sign in',
          haveBg: true,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              context.read<AuthBloc>().add(
                    AuthEvent.loginWithEmailAndId(
                      emailController.text.trim(),
                      ownerIdController.text.trim(),
                    ),
                  );

              context.read<OwnerDataCubit>().fetchOwnerData();
            }
          },
        ),
        MySpaces.hSpace20,
        // Text(
        //   'Or Sign in with',
        //   style: MyTextStyles.bodySmallMediumGreyLight,
        // ),
        // MySpaces.hSpace20,
        // InkWell(
        //   onTap: () {
        //     context.read<AuthBloc>().add(AuthEvent.loginWithGoogle());
        //   },
        //   child: Image.asset(
        //     'assets/google-icon.png',
        //     width: 35,
        //     fit: BoxFit.fitWidth,
        //   ),
        // ),
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
