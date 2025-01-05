import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/models/amenities_model.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit/amenities_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/show_dialog_amenities.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_room_floating_action_button.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_room_image_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/amenities_widget_for_add_room.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/bed_type_text_form_field_for_add_room.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/room_type_text_form_field_for_add_room.dart';

class ScreenAddRoom extends StatelessWidget {
  ScreenAddRoom({super.key});

  final roomTypeController = TextEditingController();

  final roomIdController = TextEditingController();

  final priceController = TextEditingController();

  final areaController = TextEditingController();

  final bedTypeController = TextEditingController();

  final gustNumberController = TextEditingController();

  final descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            title: 'Add Room',
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FocusScope(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 25,
                  children: [
                    //image picker widget and carousel
                    AddRoomImageWidget(),

                    //Fields
                    RoomTypeTextFormFieldForAddRoom(
                        roomTypeController: roomTypeController),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextFormFieldForAddProperty(
                          width: MyScreenSize.width * .35,
                          hintText: 'Room Id',
                          controller: roomIdController,
                          validator: (value) {
                            if (!MyRegex.emptySpaceValidation(value)) {
                              return 'Empty space is not allowed';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormFieldForAddProperty(
                          width: MyScreenSize.width * .4,
                          hintText: 'Price Per Day',
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (!MyRegex.emptySpaceValidation(value)) {
                              return 'Empty space is not allowed';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextFormFieldForAddProperty(
                          width: MyScreenSize.width * .2,
                          hintText: 'Room Area',
                          controller: areaController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (!MyRegex.emptySpaceValidation(value)) {
                              return 'Empty space is not allowed';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormFieldForAddProperty(
                          width: MyScreenSize.width * .2,
                          hintText: 'Max Gust',
                          controller: gustNumberController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (!MyRegex.emptySpaceValidation(value)) {
                              return 'Empty space is not allowed';
                            }
                            return null;
                          },
                        ),
                        BedTypeTextFormFieldForAddRoom(
                            bedTypeController: bedTypeController),
                      ],
                    ),

                    CustomTextFormFieldForAddProperty(
                      hintText: 'Description',
                      controller: descriptionController,
                      maxLines: 10,
                      validator: (value) {
                        if (!MyRegex.emptySpaceValidation(value)) {
                          return 'Empty space is not allowed';
                        }
                        return null;
                      },
                    ),

                    //Add Amenities
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAddDetailsForAllWidget(
                          text: 'Amenities *',
                          onPressed: () {
                            _showAmenitiesDialog(context);
                          },
                        ),

                        //amenities
                        AmenitiesWidgetForAddRoom()
                      ],
                    ),
                    MySpaces.hSpace60
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AddRoomFloatingActionButton(
        formKey: formKey,
        roomTypeController: roomTypeController,
        roomIdController: roomIdController,
        priceController: priceController,
        areaController: areaController,
        bedTypeController: bedTypeController,
        gustNumberController: gustNumberController,
        descriptionController: descriptionController,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void _showAmenitiesDialog(BuildContext context) async {
  var pickedAmenities = List<AmenitiesModel>.from(
      context.read<AmenitiesAddCubit>().getPickedAmenities());

  await showDialog(
    context: context,
    builder: (context) {
      return ShowDialogAmenities(
        selectedAmenities: pickedAmenities,
      );
    },
  );
}
