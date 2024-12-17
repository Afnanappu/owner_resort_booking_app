// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:provider/provider.dart';

import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/app_file_picker.dart';
import 'package:owner_resort_booking_app/features/authentication/view%20model/providers/uploaded_file_provider.dart';
import 'package:owner_resort_booking_app/features/authentication/views/components/custom_text_form_field_auth.dart';
import 'package:owner_resort_booking_app/features/authentication/views/components/elevated_button_for_upload.dart';

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
          Text(
            'Upload a personal proof',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          MySpaces.hSpace5,
          Row(
            spacing: 10,
            children: [
              ElevatedButtonForUpload(
                onPressed: () async {
                  final result = await pickFileFromDevice();
                  if (result != null) {
                    context
                        .read<UploadedFileProvider>()
                        .setFiles(proof: result);
                  }
                },
              ),
              Consumer<UploadedFileProvider>(
                builder: (context, files, _) {
                  return Text(
                    files.personalProof?.fileName ?? "Not selected",
                    style: TextStyle(fontSize: 12),
                  );
                },
              )
            ],
          ),
          MySpaces.hSpace10,
          Text(
            'Upload a license of property',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          MySpaces.hSpace5,
          Row(
            spacing: 10,
            children: [
              ElevatedButtonForUpload(
                onPressed: () async {
                  final result = await pickMultiFileFromDevice();

                  context
                      .read<UploadedFileProvider>()
                      .setFiles(license: result);
                },
              ),
              Consumer<UploadedFileProvider>(
                builder: (context, files, _) {
                  return Text(
                    "${files.license.firstOrNull?.fileName ?? "Not selected"} ${files.license.length > 1 ? "+${files.license.length}" : ''}",
                    style: TextStyle(fontSize: 12),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
