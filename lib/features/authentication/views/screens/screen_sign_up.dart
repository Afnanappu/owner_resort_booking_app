import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/authentication/view_model/bloc/bloc_auth/auth_bloc.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/register_button_widget.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/register_text_form_fields.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          initial: () {
            showCustomSnackBar(
              context: context,
              message: 'Registration request sended successfully',
              bgColor: MyColors.success,
            );
            context.read<UploadFileCubit>().clear();
            context.go('/${AppRoutes.login}');
          },
          error: (message) {
            showCustomSnackBar(
              context: context,
              message: message,
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
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
                    RegisterTextFormFields(
                      nameController: nameController,
                      emailController: emailController,
                      formKey: _formKey,
                    ),

                    MySpaces.hSpace40,

                    //Register buttons
                    RegisterButtonWidget(
                      emailController: emailController,
                      nameController: nameController,
                      formKey: _formKey,
                    ),
                    MySpaces.flex1,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
