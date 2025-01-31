import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/data/models/sub_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_extra_details_floating_action_button.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/basic_details_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/rules_details_widget.dart';

class ScreenAddExtraDetails extends StatefulWidget {
  const ScreenAddExtraDetails({super.key});

  @override
  State<ScreenAddExtraDetails> createState() => _ScreenAddExtraDetailsState();
}

class _ScreenAddExtraDetailsState extends State<ScreenAddExtraDetails> {
  final basicDetailsController = TextEditingController();

  final rulesController = TextEditingController();

  final ruleDetailsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (context.read<ExtraDetailsCubit>().state == null) return;
    final basicDetails = context.read<ExtraDetailsCubit>().getBasicDetails!;
    final rulesDetails = context.read<ExtraDetailsCubit>().getRules!;
    basicDetailsController.text = basicDetails.title;
    rulesController.text = rulesDetails.title;
  }

  @override
  Widget build(BuildContext context) {
    List<SubDetailsModel> previousSubDetailsState =
        context.read<SubDetailsCubit>().getPreviousSubDetailsState;

    List<String> previousRulesDetailsState =
        context.read<RulesDetailsCubit>().getPreviousRulesDetailsState;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        _onPopInvokedWithResult(
          didPop,
          result,
          previousSubDetailsState,
          previousRulesDetailsState,
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Add Extra Details',
          needUnderline: false,
          needSystemOverlayStyle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  BasicDetailsWidget(
                    basicDetailsController: basicDetailsController,
                  ),
                  CustomDivider(
                    horizontal: MyScreenSize.width * .15,
                    vertical: 40,
                  ),
                  RulesDetailsWidget(
                    rulesController: rulesController,
                    ruleDetailsController: ruleDetailsController,
                  ),
                  MySpaces.hSpace60
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AddExtraDetailsFloatingActionButton(
          formKey: _formKey,
          basicDetailsController: basicDetailsController,
          rulesController: rulesController,
        ),
      ),
    );
  }

  // On pop invoke function
  void _onPopInvokedWithResult(
    bool didPop,
    Object? result,
    List<SubDetailsModel> previousSubDetailsState,
    List<String> previousRulesDetailsState,
  ) {
    final currentSubDetailState = context.read<SubDetailsCubit>().state;
    final currentRulesDetails = context.read<RulesDetailsCubit>().state;

    final subList = listEquals(previousSubDetailsState, currentSubDetailState);
    final rulesList =
        listEquals(previousRulesDetailsState, currentRulesDetails);
    log('$previousSubDetailsState == $currentSubDetailState : list equals = $subList');
    log('$previousRulesDetailsState == $currentRulesDetails : list equals = $rulesList');

    // final subTitle = context.read<ExtraDetailsCubit>().getBasicDetails!.title;
    // final ruleTitle = context.read<ExtraDetailsCubit>().getRules!.title;

    //check if any change made after last time
// (subTitle == basicDetailsController.text.trim()) &&
//         (ruleTitle == rulesController.text.trim())
    if (rulesList && subList) {
      log('Extra details screen have no changes');
      context.pop();
    }
    log('Extra details screen have changes');

    customAlertDialog(
      context: context,
      title: 'Discard changes',
      content: 'Every changes you make wil be discarded!',
      firstText: 'Yes',
      secondText: 'No',
      firstOnPressed: () {
        if (context.read<ExtraDetailsCubit>().state == null) {
          context.read<SubDetailsCubit>().clear();
          context.read<RulesDetailsCubit>().clear();
        } else {
          context
              .read<RulesDetailsCubit>()
              .setAllRules(previousRulesDetailsState);
          context
              .read<SubDetailsCubit>()
              .setAllSubDetails(previousSubDetailsState);
        }
        context.pop();
        context.pop();
      },
      secondOnPressed: () {
        context.pop();
      },
    );
  }
}
