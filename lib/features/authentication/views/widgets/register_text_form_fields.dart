// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/app_file_picker.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/features/authentication/model/picked_file_model.dart';
import 'package:owner_resort_booking_app/features/authentication/view_model/cubit/cubit_upload_file/upload_file_cubit.dart';
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
          Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButtonForUpload(
                    onPressed: () async {
                      final result = await pickMultiFileFromDevice();

                      context.read<UploadFileCubit>().setFiles(proof: result);
                    },
                  ),
                  BlocBuilder<UploadFileCubit, UploadFileState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        picked: (_) {
                          return IconButton(
                            onPressed: () {
                              context.read<UploadFileCubit>().clear();
                            },
                            icon: Icon(Icons.close),
                          );
                        },
                        orElse: () {
                          return SizedBox();
                        },
                      );
                    },
                  )
                ],
              ),
              BlocBuilder<UploadFileCubit, UploadFileState>(
                builder: (context, state) {
                  final files = state.maybeWhen(
                    picked: (proof) => proof,
                    initial: (proof) => proof,
                    orElse: () => <PickedFileModel>[],
                  );
                  return files.isNotEmpty
                      ? SizedBox(
                          height: 200,
                          // width: 200,
                          child: ListView.builder(
                            itemCount: files.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final file = files[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: file.fileExtension != 'pdf'
                                    ? Image.file(
                                        File(file.filePath),
                                        fit: BoxFit.contain,
                                      )
                                    : SizedBox(
                                        width: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          spacing: 10,
                                          children: [
                                            Image.asset(
                                              'assets/PDF_file_icon.png',
                                              height: 50,
                                              width: 50,
                                            ),
                                            Text(file.fileName),
                                          ],
                                        ),
                                      ),
                              );
                            },
                          ),
                        )
                      : SizedBox();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
