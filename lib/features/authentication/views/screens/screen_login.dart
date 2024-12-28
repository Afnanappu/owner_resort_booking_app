import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/authentication/view_model/bloc/bloc_auth/auth_bloc.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/login_text_form_fields.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/login_and_google_widget.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final emailController = TextEditingController();
  final ownerIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MyScreenSize.height,
        width: MyScreenSize.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) {
                  showCustomSnackBar(
                    context: context,
                    message: 'Owner login completed successfully',
                    bgColor: MyColors.success,
                  );
                  context.go("/${AppRoutes.dashboard}");
                },
                emailLoginFailed: (message) {
                  showCustomSnackBar(
                    context: context,
                    message: message,
                  );
                },
                orElse: () {},
              );
            },
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
                LoginTextFormFields(
                  emailController: emailController,
                  ownerIdController: ownerIdController,
                  formKey: _formKey,
                ),

                MySpaces.hSpace60,

                //buttons for sign in and google
                SignInAndGoogleButtonWidget(
                  emailController: emailController,
                  ownerIdController: ownerIdController,
                  formKey: _formKey,
                ),
                MySpaces.flex1,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
