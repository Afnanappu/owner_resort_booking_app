// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/elevated_button_for_upload.dart';
import 'package:owner_resort_booking_app/core/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/core/utils/app_file_picker.dart';

class CustomUploadFileWidget extends StatelessWidget {
  const CustomUploadFileWidget({
    super.key,
    required this.title,
    required this.style,
  });
  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: style,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButtonForUpload(
              onPressed: () async {
                final result = await pickMultiFileFromDevice();

                context.read<UploadFileCubit>().setFiles(files: result);
              },
            ),
            BlocBuilder<UploadFileCubit, UploadFileState>(
              builder: (context, state) {
                final files = state.maybeWhen(
                  picked: (pickedFiles) => pickedFiles,
                  initial: (pickedFiles) => pickedFiles,
                  orElse: () => <PickedFileModel>[],
                );

                return files.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          context.read<UploadFileCubit>().clear();
                        },
                        icon: Icon(Icons.close),
                      )
                    : const SizedBox();
              },
            )
          ],
        ),
        BlocBuilder<UploadFileCubit, UploadFileState>(
          builder: (context, state) {
            final files = state.maybeWhen(
              picked: (pickedFiles) => pickedFiles,
              initial: (pickedFiles) => pickedFiles,
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
                        return GestureDetector(
                          onLongPress: () async {
                            //Long press to remove file from list.
                            await customAlertDialog(
                              context: context,
                              title: 'Remove file',
                              content:
                                  'Do you want to remove this from the list?',
                              firstText: 'Yes',
                              secondText: 'No',
                              firstOnPressed: () {
                                context
                                    .read<UploadFileCubit>()
                                    .removeOneFromList(index);
                                context.pop();
                              },
                              secondOnPressed: () {
                                context.pop();
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                        Text(
                                          file.fileName,
                                          textAlign: TextAlign.center,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
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
    );
  }
}
