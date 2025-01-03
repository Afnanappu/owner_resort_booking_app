
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/models/amenities_model.dart';
import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/model/add_room_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/amenities_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_room_image/upload_image_for_room_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/show_dialog_amenities.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/amenities_widget_for_add_room.dart';

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
                    BlocBuilder<UploadImageForRoomCubit,
                        UploadImageForRoomState>(
                      builder: (context, state) {
                        final List<PickedFileModel> pickedImages =
                            state.maybeWhen(
                          initial: () => [],
                          picked: (images) => images,
                          orElse: () => [],
                        );

                        final isError = state.maybeWhen(
                          error: (_) => true,
                          orElse: () => false,
                        );

                        return CarouselImagePickedShowWidget(
                          isError: isError,
                          pickedImages: pickedImages,
                          onPageChanged: (index, _) {
                            context
                                .read<UploadImageForRoomCubit>()
                                .updateCurrentIndex = index;
                          },
                          onLongPressImage: () {
                            final index = context
                                .read<UploadImageForRoomCubit>()
                                .currentIndex;
                            customAlertDialog(
                              context: context,
                              title: 'Remove image',
                              content:
                                  'Do you want to remove this from the list?',
                              firstText: 'Yes',
                              secondText: 'No',
                              firstOnPressed: () {
                                context
                                    .read<UploadImageForRoomCubit>()
                                    .removeImage(pickedImages[index]);
                                context.pop();
                              },
                              secondOnPressed: () {
                                context.pop();
                              },
                            );
                          },
                          onTap: () async {
                            await context
                                .read<UploadImageForRoomCubit>()
                                .pickImage();
                          },
                        );
                      },
                    ),

                    //Fields
                    CustomTextFormFieldForAddProperty(
                      width: 160,
                      hintText: 'Room Type',
                      controller: roomTypeController,
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      validator: (value) {
                        if (!MyRegex.emptySpaceValidation(value)) {
                          return 'Empty space is not allowed';
                        }
                        return null;
                      },
                    ),

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
                        CustomTextFormFieldForAddProperty(
                          width: MyScreenSize.width * .4,
                          hintText: 'Bed Type',
                          controller: bedTypeController,
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          validator: (value) {
                            if (!MyRegex.emptySpaceValidation(value)) {
                              return 'Empty space is not allowed';
                            }
                            return null;
                          },
                        ),
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
      floatingActionButton: CustomElevatedButton(
        text: 'Add',
        width: MyScreenSize.width * .70,
        onPressed: () {
          final roomImageState = context.read<UploadImageForRoomCubit>().state;
          final List<PickedFileModel> roomImages = roomImageState.maybeWhen(
            picked: (pickedImage) => pickedImage,
            orElse: () => [],
          );
          if (roomImages.isEmpty) {
            showCustomSnackBar(
                context: context, message: 'Room image is not added');
            return;
          }
          if (!formKey.currentState!.validate()) {
            return;
          }
          final amenities = List<AmenitiesModel>.from(
              context.read<AmenitiesAddCubit>().state);
          if (amenities.isEmpty) {
            showCustomSnackBar(
                context: context,
                message: 'Amenities is not added, try to add!');
            return;
          }

          //Adding room to cubit
          final roomModel = AddRoomModel(
            images: roomImages,
            roomType: roomTypeController.text.trim(),
            roomId: roomIdController.text.trim(),
            price: priceController.text.trim(),
            roomArea: areaController.text.trim(),
            bedType: bedTypeController.text.trim(),
            maxGustCount: gustNumberController.text.trim(),
            description: descriptionController.text.trim(),
            amenities: amenities,
          );

          context.read<RoomAddCubit>().addRoom(roomModel);

          //clearing the cubit data
          context.read<AmenitiesAddCubit>().clearAmenities();
          context.read<UploadImageForRoomCubit>().clear();
          context.pop();
        },
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


void _showAmenitiesDialog(BuildContext context) async {
  final List<String> am = [
    "WiFi",
    "Parking",
    "Swimming Pool",
    "Gym",
    "Spa",
    "Restaurant",
    "Bar",
    "Pet Friendly"
  ];

  final amenities = List.generate(
    am.length,
    (index) => AmenitiesModel(
      name: am[index],
      icon:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaad8Tkz8i0CBvnweQWMqrhwbbTAwni6CN0Q&s",
    ),
  );

  await showDialog<List<String>>(
    context: context,
    builder: (context) {
      return ShowDialogAmenities(amenities: amenities);
    },
  );
}
