import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/model/basic_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/model/extra_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/model/rules_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/model/sub_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/show_dialog_for_add_details.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Extra Details',
        needUnderline: false,
        needSystemOverlayStyle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  CustomAddDetailsForAllWidget(
                    text: 'Basic Details',
                    haveTrailing: false,
                  ),
                  CustomTextFormFieldForAddProperty(
                    hintText: 'Title (eg. Food & Dining)',
                    controller: basicDetailsController,
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
                    text: 'Add Basic Sub Details',
                    onPressed: () {
                      context.push('/${AppRoutes.addExtraSubDetails}');
                    },
                  ),
                  BlocBuilder<SubDetailsCubit, List<SubDetailsModel>>(
                    builder: (context, detailList) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: detailList.length,
                        itemBuilder: (context, index) {
                          final model = detailList[index];
                          return Card(
                            elevation: .5,
                            child: ExpansionTile(
                              iconColor: MyColors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              tilePadding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              childrenPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              title: Text(model.title),
                              children: model.details
                                  .map(
                                    (detail) => ListTile(
                                      leading: Icon(
                                        Icons.circle,
                                        size: 15,
                                      ),
                                      title: Text(detail),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              CustomDivider(
                horizontal: MyScreenSize.width * .15,
                vertical: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  CustomAddDetailsForAllWidget(
                    text: 'Rules',
                    haveTrailing: false,
                  ),
                  CustomTextFormFieldForAddProperty(
                    hintText: 'Title (eg. Must Read Rules)',
                    controller: rulesController,
                    validator: (value) {
                      if (!MyRegex.emptySpaceValidation(value)) {
                        return 'Don\'t use empty space, user characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomAddDetailsForAllWidget(
                    text: 'Add Rules',
                    onPressed: () {
                      showDialogForAddDetails(
                        context: context,
                        title: rulesController.text.trim(),
                        onPressed: () {
                          final rule = ruleDetailsController.text.trim();
                          if (rule.isNotEmpty) {
                            context.read<RulesDetailsCubit>().addRules(rule);
                          }
                          context.pop();
                          ruleDetailsController.clear();
                        },
                        controller: ruleDetailsController,
                      );
                    },
                  ),
                  BlocBuilder<RulesDetailsCubit, List<String>>(
                    builder: (context, rules) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: rules.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.circle,
                              size: 15,
                            ),
                            title: Text(rules[index]),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
              MySpaces.hSpace60
            ],
          ),
        ),
      ),
      floatingActionButton: CustomElevatedButton(
        text: 'Add',
        width: MyScreenSize.width * .55,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final basicDetailsModel = BasicDetailsModel(
              title: basicDetailsController.text.trim(),
              subDetails: context.read<SubDetailsCubit>().state,
            );
            final rulesModel = RulesDetailsModel(
              title: rulesController.text.trim(),
              rules: context.read<RulesDetailsCubit>().state,
            );

            //Return data from this screen to add property screen( previous screen )
            context.read<ExtraDetailsCubit>().setExtraDetails(
                  ExtraDetailsModel(
                    basicDetailsModel: basicDetailsModel,
                    rulesDetailsModel: rulesModel,
                  ),
                );
            context.read<SubDetailsCubit>().clear();
            context.read<RulesDetailsCubit>().clear();

            context.pop();
          }
        },
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
