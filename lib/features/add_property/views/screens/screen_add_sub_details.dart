import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/model/sub_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_bullet_point/bullet_point_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/show_dialog_for_add_details.dart';

class ScreenAddSubDetails extends StatelessWidget {
  ScreenAddSubDetails({super.key});
  final subTitleController = TextEditingController();
  final subDetailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bulletPointCubit = context.read<BulletPointCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Sub Details',
        needUnderline: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormFieldForAddProperty(
                hintText: 'Sub Title (eg. Allowed or  Not Allowed)',
                controller: subTitleController,
                validator: (value) {
                  if (!MyRegex.emptySpaceValidation(value)) {
                    return 'Don\'t use empty space, user characters';
                  } else {
                    return null;
                  }
                },
              ),
              MySpaces.hSpace20,
              CustomAddDetailsForAllWidget(
                text: 'Add Sub Details',
                onPressed: () {
                  showDialogForAddDetails(
                    context: context,
                    title: subTitleController.text.trim(),
                    onPressed: () {
                      final detail = subDetailsController.text.trim();
                      if (detail.isNotEmpty) {
                        bulletPointCubit.addBulletPoint(detail);
                      }
                      context.pop();
                      subDetailsController.clear();
                    },
                    controller: subDetailsController,
                  );
                },
              ),
              BlocBuilder<BulletPointCubit, List<String>>(
                builder: (context, bulletPoints) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: bulletPoints.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        title: Text(bulletPoints[index]),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: CustomElevatedButton(
        text: 'Add',
        width: MyScreenSize.width * .55,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final subDetails = SubDetailsModel(
              title: subTitleController.text.trim(),
              details: context.read<BulletPointCubit>().state,
            );
            context.read<SubDetailsCubit>().addSubDetails(subDetails);
            context.read<BulletPointCubit>().clear();
            context.pop();
          } else {
            log('Title or Details missing');
          }
        },
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
