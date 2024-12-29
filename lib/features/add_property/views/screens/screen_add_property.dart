import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_container.dart';
import 'package:owner_resort_booking_app/core/components/custom_upload_file_widget.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

import 'package:owner_resort_booking_app/core/utils/custom_time_picker.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/custom_text_form_field_for_add_property.dart';

class ScreenAddProperty extends StatelessWidget {
  ScreenAddProperty({super.key});
  final typeController = TextEditingController();
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final checkInTimeController = TextEditingController();
  final checkOutTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //App bar
          CustomAppBar(
            title: 'Add Property',
          ),

          MySpaces.hSpace20,
          //body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FocusScope(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  CustomAppContainer(
                    height: 200,
                    thickness: 1,
                    child: Center(
                      child: Image.asset(
                        'assets/images_background.png',
                        scale: 2,
                      ),
                    ),
                  ),
                  CustomTextFormFieldForAddProperty(
                    width: 160,
                    hintText: 'Property Type',
                    controller: typeController,
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                  CustomTextFormFieldForAddProperty(
                    hintText: 'Property Name',
                    controller: nameController,
                  ),
                  CustomTextFormFieldForAddProperty(
                    hintText: 'Location',
                    controller: locationController,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.my_location_rounded),
                    ),
                  ),
                  CustomTextFormFieldForAddProperty(
                    hintText: 'Description',
                    controller: descriptionController,
                  ),

                  //upload licenses
                  CustomUploadFileWidget(
                    title: 'Upload Licenses *',
                    style: MyTextStyles.titleMediumSemiBoldBlack,
                  ),
                  //Extra details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Extra Details *',
                        style: MyTextStyles.titleMediumSemiBoldBlack,
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          'Add',
                          style: MyTextStyles.titleMediumSemiBoldBlack
                              .copyWith(color: MyColors.orange),
                        ),
                        icon: Icon(
                          Icons.add,
                          color: MyColors.orange,
                          size: 22,
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Check-In Time:',
                        style: MyTextStyles.bodySmallMediumBlack,
                      ),
                      CustomTextFormFieldForAddProperty(
                        readOnly: true,
                        width: MyScreenSize.width * .5,
                        hintText: 'Pick Time',
                        controller: checkInTimeController,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            final pickedTime = await customTimePicker(
                                context: context, hour: 7, minute: 0);
                            if (pickedTime != null) {
                              checkInTimeController.text =
                                  pickedTime.format(context);
                            }
                          },
                          icon: Icon(Icons.access_time_outlined),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Check-Out Time:',
                        style: MyTextStyles.bodySmallMediumBlack,
                      ),
                      CustomTextFormFieldForAddProperty(
                        width: MyScreenSize.width * .5,
                        hintText: 'Pick Time',
                        readOnly: true,
                        controller: checkOutTimeController,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            final pickedTime = await customTimePicker(
                                context: context, hour: 22, minute: 0);
                            if (pickedTime != null) {
                              checkOutTimeController.text =
                                  pickedTime.format(context);
                            }
                          },
                          icon: Icon(Icons.access_time_outlined),
                        ),
                      ),
                    ],
                  ),

                  //Add room
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Rooms (Optional)',
                        style: MyTextStyles.titleMediumSemiBoldBlack,
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          'Add',
                          style: MyTextStyles.titleMediumSemiBoldBlack
                              .copyWith(color: MyColors.orange),
                        ),
                        icon: Icon(
                          Icons.add,
                          color: MyColors.orange,
                          size: 22,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MyScreenSize.width * .75,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text(
                            'Add Property',
                            style: MyTextStyles.titleMediumSemiBoldWhite,
                          ),
                          style: ElevatedButton.styleFrom(
                            // padding:
                            //     EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRad10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MySpaces.hSpace0
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
