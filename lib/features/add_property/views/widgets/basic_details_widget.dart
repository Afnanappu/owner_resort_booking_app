import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/models/sub_details_model.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_bullet_point/bullet_point_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class BasicDetailsWidget extends StatelessWidget {
  const BasicDetailsWidget({
    super.key,
    required this.basicDetailsController,
  });

  final TextEditingController basicDetailsController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            return detailList.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: MyScreenSize.height * .05),
                      child: Text('No sub details is added'),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: detailList.length,
                    itemBuilder: (context, index) {
                      final model = detailList[index];
                      return GestureDetector(
                        onLongPress: () {
                          customAlertDialog(
                            context: context,
                            title: 'Delete this details',
                            content: 'do you want to delete this?',
                            firstOnPressed: () {
                              context
                                  .read<SubDetailsCubit>()
                                  .removeSubDetails(model);
                              context.pop();
                            },
                          );
                        },
                        child: Card(
                          elevation: .5,
                          child: ExpansionTile(
                            trailing: IconButton(
                              onPressed: () {
                                final bulletPoints = context
                                    .read<SubDetailsCubit>()
                                    .state[index]
                                    .details;
                                context.read<BulletPointCubit>().setIndex =
                                    index;
                                context
                                    .read<BulletPointCubit>()
                                    .setAllBulletPoints(bulletPoints);
                                context
                                    .push('/${AppRoutes.addExtraSubDetails}');
                              },
                              icon: Icon(Icons.edit),
                            ),
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
                                      size: 12,
                                    ),
                                    title: Text(detail),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ],
    );
  }
}
