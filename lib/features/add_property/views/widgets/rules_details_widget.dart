import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/show_dialog_for_add_details.dart';

class RulesDetailsWidget extends StatelessWidget {
  const RulesDetailsWidget({
    super.key,
    required this.rulesController,
    required this.ruleDetailsController,
  });

  final TextEditingController rulesController;
  final TextEditingController ruleDetailsController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                if (!MyRegex.emptySpaceValidation(ruleDetailsController.text)) {
                  return;
                }
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
            return rules.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: MyScreenSize.height * .05),
                      child: Text('No rules added'),
                    ),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rules.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onLongPress: () {
                          customAlertDialog(
                            context: context,
                            title: 'Delete this rule',
                            content: 'do you want to delete this?',
                            firstOnPressed: () {
                              context
                                  .read<RulesDetailsCubit>()
                                  .removeRule(rules[index]);
                              context.pop();
                            },
                          );
                        },
                        leading: Icon(
                          Icons.circle,
                          size: 12,
                        ),
                        title: Text(rules[index]),
                        trailing: IconButton(
                          onPressed: () {
                            ruleDetailsController.text = rules[index];
                            showDialogForAddDetails(
                              context: context,
                              title: ruleDetailsController.text.trim(),
                              onPressed: () {
                                if (!MyRegex.emptySpaceValidation(
                                    ruleDetailsController.text)) {
                                  return;
                                }
                                final detail =
                                    ruleDetailsController.text.trim();
                                if (detail.isNotEmpty) {
                                  context
                                      .read<RulesDetailsCubit>()
                                      .updateRule(index, detail);
                                }
                                context.pop();
                                ruleDetailsController.clear();
                              },
                              controller: ruleDetailsController,
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                          ),
                        ),
                      );
                    },
                  );
          },
        )
      ],
    );
  }
}
