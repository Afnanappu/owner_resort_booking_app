import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/elevated_button_auth.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/models/user_model.dart';
import 'package:owner_resort_booking_app/features/authentication/view%20model/bloc/bloc_auth/auth_bloc.dart';
import 'package:owner_resort_booking_app/features/authentication/view%20model/providers/uploaded_file_provider.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButtonAuthentication(
          title: 'Register',
          haveBg: true,
          onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            final proof = context.read<UploadedFileProvider>();
            final user = UserModel(
              name: nameController.text,
              email: emailController.text,
              personalProof: proof.personalProof,
              license: proof.license,
            );
            context.read<AuthBloc>().add(AuthEvent.register(user));
          },
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
                    context.go('/${AppRoutes.login}');
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
