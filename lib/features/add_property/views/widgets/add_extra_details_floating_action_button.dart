import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/models/basic_details_model.dart';
import 'package:owner_resort_booking_app/core/models/extra_details_model.dart';
import 'package:owner_resort_booking_app/core/models/rules_details_model.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/unconstrained_bottom_floating_action.dart';

class AddExtraDetailsFloatingActionButton extends StatelessWidget {
  const AddExtraDetailsFloatingActionButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.basicDetailsController,
    required this.rulesController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController basicDetailsController;
  final TextEditingController rulesController;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBottomFloatingAction(
      child: CustomElevatedButton(
        text: 'Add',
        width: MyScreenSize.width * .55,
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            return;
          }
          final basicDetails = context.read<SubDetailsCubit>().state;
          if (basicDetails.isEmpty) {
            showCustomSnackBar(
                context: context, message: 'Add basic details to continue');
            return;
          }
          final rules = context.read<RulesDetailsCubit>().state;
          if (rules.isEmpty) {
            showCustomSnackBar(
                context: context, message: 'Add rules to continue');
            return;
          }
          final basicDetailsModel = BasicDetailsModel(
            title: basicDetailsController.text.trim(),
            subDetails: basicDetails,
          );
          final rulesModel = RulesDetailsModel(
            title: rulesController.text.trim(),
            rules: rules,
          );

          //Return data from this screen to add property screen( previous screen )
          context.read<ExtraDetailsCubit>().setExtraDetails(
                ExtraDetailsModel(
                  basicDetailsModel: basicDetailsModel,
                  rulesDetailsModel: rulesModel,
                ),
              );
          // context.read<SubDetailsCubit>().clear();
          // context.read<RulesDetailsCubit>().clear();

          context.pop();
        },
      ),
    );
  }
}
