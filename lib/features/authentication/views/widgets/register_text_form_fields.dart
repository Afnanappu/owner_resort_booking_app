// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_upload_file_widget.dart';

import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/features/authentication/views/components/custom_text_form_field_auth.dart';

class RegisterTextFormFields extends StatelessWidget {
  const RegisterTextFormFields({
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          CustomTextFormFieldAuth(
            validator: (value) {
              if (MyRegex.nameValidation(value)) {
                return 'Name only contains letters';
              }
              return null;
            },
            controller: nameController,
            keyboardType: TextInputType.name,
            prefixIcon: Icon(Icons.person_outline),
            hintText: 'name',
          ),
          MySpaces.hSpace10,
          Text(
            'Email',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          CustomTextFormFieldAuth(
            validator: (value) {
              if (MyRegex.emailValidation(value)) {
                return 'Invalid email';
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'name@example.com',
          ),
          MySpaces.hSpace10,
          CustomUploadFileWidget(
            title: 'Upload a personal proof',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
        ],
      ),
    );
  }
}
