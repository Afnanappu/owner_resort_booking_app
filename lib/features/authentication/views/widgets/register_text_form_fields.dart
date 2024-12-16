import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/app_file_picker.dart';
import 'package:owner_resort_booking_app/features/authentication/view%20model/providers/uploaded_file_provider.dart';
import 'package:owner_resort_booking_app/features/authentication/views/components/custom_text_form_field_auth.dart';
import 'package:owner_resort_booking_app/features/authentication/views/widgets/elevated_button_for_upload.dart';

class RegisterTextFormFields extends StatelessWidget {
  const RegisterTextFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: MyTextStyles.titleLargeSemiBoldBlack,
        ),
        CustomTextFormFieldAuth(
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
                      .setFiles(proof: result.entries.first.key);
                }
              },
            ),
            Consumer<UploadedFileProvider>(
              builder: (context, files, _) {
                return Text(
                  files.personalProof,
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
                final result = await pickFileFromDevice();
                if (result != null) {
                  context
                      .read<UploadedFileProvider>()
                      .setFiles(license: result.entries.first.key);
                }
              },
            ),
            Consumer<UploadedFileProvider>(
              builder: (context, files, _) {
                return Text(
                  files.license,
                  style: TextStyle(fontSize: 12),
                );
              },
            )
          ],
        ),
      ],
    );
  }
}
