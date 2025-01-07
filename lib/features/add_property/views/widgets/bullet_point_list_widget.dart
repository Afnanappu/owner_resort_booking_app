import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_bullet_point/bullet_point_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/show_dialog_for_add_details.dart';

class BulletPointListWidget extends StatelessWidget {
  const BulletPointListWidget({
    super.key,
    required this.subDetailsController,
    required this.subTitleController,
    required this.bulletPointCubit,
  });

  final TextEditingController subDetailsController;
  final TextEditingController subTitleController;
  final BulletPointCubit bulletPointCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BulletPointCubit, List<String>>(
      builder: (context, bulletPoints) {
        return bulletPoints.isEmpty
            ? Center(
                child: Padding(
                  padding: EdgeInsets.only(top: MyScreenSize.height * .05),
                  child: Text('No details is added'),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bulletPoints.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onLongPress: () {
                      customAlertDialog(
                        context: context,
                        title: 'Delete this details',
                        content: 'do you want to delete this?',
                        firstOnPressed: () {
                          context
                              .read<BulletPointCubit>()
                              .removePoint(bulletPoints[index]);
                          context.pop();
                        },
                      );
                    },
                    leading: Icon(
                      Icons.circle,
                      size: 13,
                    ),
                    title: Text(bulletPoints[index]),
                    trailing: IconButton(
                      onPressed: () {
                        subDetailsController.text = bulletPoints[index];
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
                              bulletPointCubit.updatePoint(index, detail);
                            }
                            context.pop();
                            subDetailsController.clear();
                          },
                          controller: subDetailsController,
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
    );
  }
}
