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
import 'package:owner_resort_booking_app/core/data/models/sub_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_bullet_point/bullet_point_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/show_dialog_for_add_details.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/unconstrained_bottom_floating_action.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/bullet_point_list_widget.dart';

class ScreenAddSubDetails extends StatelessWidget {
  ScreenAddSubDetails({super.key});
  final subTitleController = TextEditingController();
  final subDetailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final index = context.read<BulletPointCubit>().getIndex;
        if (index != null) {
          subTitleController.text =
              context.read<SubDetailsCubit>().state[index].title;
        }
      },
    );
    final bulletPointCubit = context.read<BulletPointCubit>();
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<BulletPointCubit>().clear();
        context.read<BulletPointCubit>().setIndex = null;
      },
      child: Scaffold(
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
                        if (!MyRegex.emptySpaceValidation(
                            subDetailsController.text)) {
                          return;
                        }
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
                BulletPointListWidget(
                  subDetailsController: subDetailsController,
                  subTitleController: subTitleController,
                  bulletPointCubit: bulletPointCubit,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: UnconstrainedBottomFloatingAction(
          child: CustomElevatedButton(
            text: 'Add',
            width: MyScreenSize.width * .55,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final subDetails = SubDetailsModel(
                  title: subTitleController.text.trim(),
                  details: context.read<BulletPointCubit>().state,
                );
                final bulletCubit = context.read<BulletPointCubit>();
                if (bulletCubit.getIndex != null) {
                  context
                      .read<SubDetailsCubit>()
                      .updateSubDetails(bulletCubit.getIndex, subDetails);
                } else {
                  context.read<SubDetailsCubit>().addSubDetails(subDetails);
                }
                context.read<BulletPointCubit>().clear();
                bulletCubit.setIndex = null;
                context.pop();
              } else {
                log('Title or Details missing');
              }
            },
          ),
        ),
      ),
    );
  }
}
