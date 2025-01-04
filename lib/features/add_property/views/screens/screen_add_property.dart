import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_all_widget_with_suggestions.dart';
import 'package:owner_resort_booking_app/core/components/custom_upload_file_widget.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/model/add_property_model.dart';
import 'package:owner_resort_booking_app/features/add_property/model/add_room_model.dart';
import 'package:owner_resort_booking_app/core/models/extra_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_category/category_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/check_time_widget_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/extra_basic_details_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/extra_rules_details_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/room_details_car_for_add_property.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenAddProperty extends StatefulWidget {
  const ScreenAddProperty({super.key});

  @override
  State<ScreenAddProperty> createState() => _ScreenAddPropertyState();
}

class _ScreenAddPropertyState extends State<ScreenAddProperty> {
  final typeController = TextEditingController();

  final nameController = TextEditingController();

  final locationController = TextEditingController();

  final descriptionController = TextEditingController();

  final checkInTimeController = TextEditingController();

  final checkOutTimeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  // ExtraDetailsModel? extraDetails;
  // var propertyTypeList = <String>[];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetPropertyTypeCubit>().fetchPropertyTypes();
    });
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          customAlertDialog(
            context: context,
            title: 'Discard changes',
            content: 'Every changes you make wil be discarded!',
            firstText: 'Yes',
            secondText: 'No',
            firstOnPressed: () {
              //clearing the data
              context.read<UploadImageForPropertyCubit>().clear();
              context.read<UploadFileCubit>().clear();
              context.read<ExtraDetailsCubit>().clear();
              context.read<RoomAddCubit>().clear();
              context.read<ExtraDetailsCubit>().clear();
              context.pop();
              context.pop();
            },
            secondOnPressed: () {
              context.pop();
            }, 
          );
        }
      },
      child: Scaffold(
        body: BlocListener<AddPropertyBloc, AddPropertyState>(
          listener: (context, state) {
            state.maybeWhen(
              added: () {
                showCustomSnackBar(
                  context: context,
                  message: 'Property added successfully',
                  bgColor: MyColors.success,
                );
              },
              error: (error) {
                showCustomSnackBar(context: context, message: error);
              },
              orElse: () {},
            );
          },
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
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
                        //image picker widget and carousel
                        BlocConsumer<UploadImageForPropertyCubit,
                            UploadImageForPropertyState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              error: (error) {
                                showCustomSnackBar(
                                  context: context,
                                  message: error,
                                );
                              },
                              orElse: () {},
                            );
                          },
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
                                    .read<UploadImageForPropertyCubit>()
                                    .updateCurrentIndex = index;
                              },
                              onLongPressImage: () {
                                final index = context
                                    .read<UploadImageForPropertyCubit>()
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
                                        .read<UploadImageForPropertyCubit>()
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
                                    .read<UploadImageForPropertyCubit>()
                                    .pickImage();
                              },
                            );
                          },
                        ),

                        BlocBuilder<GetPropertyTypeCubit, List<String>>(
                          builder: (context, suggestions) {
                            return CustomTextFormFieldForAllWidgetWithSuggestion(
                              width: 180,
                              hintText: 'Property Type',
                              controller: typeController,
                              suggestions: suggestions,
                              validator: (value) {
                                if (!MyRegex.emptySpaceValidation(value)) {
                                  return 'Don\'t use empty space, user characters';
                                } else {
                                  return null;
                                }
                              },
                            );
                          },
                        ),
                        CustomTextFormFieldForAddProperty(
                          hintText: 'Property Name',
                          controller: nameController,
                          validator: (value) {
                            if (!MyRegex.emptySpaceValidation(value)) {
                              return 'Don\'t use empty space, user characters';
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextFormFieldForAddProperty(
                          hintText: 'Location',
                          controller: locationController,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.my_location_rounded),
                          ),
                          validator: (value) {
                            if (!MyRegex.emptySpaceValidation(value)) {
                              return 'Don\'t use empty space, user characters';
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextFormFieldForAddProperty(
                          hintText: 'Description',
                          controller: descriptionController,
                          validator: (value) {
                            if (!MyRegex.emptySpaceValidation(value)) {
                              return 'Don\'t use empty space, user characters';
                            } else {
                              return null;
                            }
                          },
                        ),

                        //upload licenses
                        CustomUploadFileWidget(
                          title: 'Upload Licenses *',
                          style: MyTextStyles.titleMediumSemiBoldBlack,
                        ),

                        //Extra details
                        BlocBuilder<ExtraDetailsCubit, ExtraDetailsModel?>(
                          builder: (context, state) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomAddDetailsForAllWidget(
                                  text: 'Extra Details *',
                                  onPressed: () {
                                    context
                                        .push('/${AppRoutes.addExtraDetails}');
                                  },
                                ),
                                if (state != null)
                                  ExtraBasicDetailsWidget(
                                    basicDetails: state.basicDetailsModel,
                                  ),
                                if (state != null) MySpaces.hSpace20,
                                if (state != null)
                                  ExtraRulesDetailsWidget(
                                    rulesDetails: state.rulesDetailsModel,
                                  )
                              ],
                            );
                          },
                        ),

                        CheckTimeWidgetForAddProperty(
                          checkInTimeController: checkInTimeController,
                          checkOutTimeController: checkOutTimeController,
                        ),

                        //Add room
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomAddDetailsForAllWidget(
                              text: 'Add Rooms *',
                              onPressed: () {
                                context.push('/${AppRoutes.addRoom}');
                              },
                            ),
                            BlocBuilder<RoomAddCubit, List<AddRoomModel>>(
                              builder: (context, rooms) {
                                return rooms.isNotEmpty
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: rooms.reversed.map(
                                            (room) {
                                              return ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  minWidth:
                                                      250, // Minimum width for each card
                                                  maxWidth: MediaQuery.of(
                                                          context)
                                                      .size
                                                      .width, // Allow up to 90% of screen width
                                                ),
                                                child: GestureDetector(
                                                  onLongPress: () async {
                                                    //Long press to remove file from list.
                                                    await customAlertDialog(
                                                      context: context,
                                                      title: 'Remove Room',
                                                      content:
                                                          'Do you want to remove this from the list?',
                                                      firstText: 'Yes',
                                                      secondText: 'No',
                                                      firstOnPressed: () {
                                                        context
                                                            .read<
                                                                RoomAddCubit>()
                                                            .removeRoom(room);
                                                        context.pop();
                                                      },
                                                      secondOnPressed: () {
                                                        context.pop();
                                                      },
                                                    );
                                                  },
                                                  child: RoomDetailsCard(
                                                      room: room),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        ))
                                    : SizedBox();
                              },
                            )
                          ],
                        ),
                        MySpaces.hSpace60,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<AddPropertyBloc, AddPropertyState>(
          builder: (context, state) {
            return CustomElevatedButton(
              text: 'Add Property',
              width: MyScreenSize.width * .75,
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                final propertyImages =
                    context.read<UploadImageForPropertyCubit>().state.maybeWhen(
                          picked: (pickedImages) => pickedImages,
                          orElse: () => null,
                        );
                if (propertyImages == null || propertyImages.isEmpty) {
                  showCustomSnackBar(
                      context: context,
                      message:
                          'Property image is not selected, please select and proceed');
                  return;
                }

                final uploadFileCubit = context.read<UploadFileCubit>();
                final files = uploadFileCubit.state.maybeWhen(
                  picked: (pickedFiles) {
                    return pickedFiles;
                  },
                  initial: (pickedFiles) {
                    return pickedFiles;
                  },
                  orElse: () {
                    return null;
                  },
                );
                if (files == null || files.isEmpty) return;
                final extraDetails = context.read<ExtraDetailsCubit>().state;
                if (extraDetails == null) {
                  showCustomSnackBar(
                      context: context,
                      message: 'Extra details is not added, try to add');
                  return;
                }

                final roomDetails = context.read<RoomAddCubit>().state;

                if (roomDetails.isEmpty) {
                  showCustomSnackBar(
                      context: context,
                      message: 'Room is not added, try to add room');
                  return;
                }

                log('Everything is ok to add resort');
                final userId = FirebaseAuth.instance.currentUser!.uid;
                final propertyModel = AddPropertyModel(
                  ownerId: userId,
                  images: propertyImages,
                  type: typeController.text.trim(),
                  name: nameController.text.trim(),
                  location: locationController.text.trim(),
                  description: descriptionController.text.trim(),
                  licenses: files,
                  extraDetails: extraDetails,
                  checkInTime: checkInTimeController.text.trim(),
                  checkOutTime: checkOutTimeController.text.trim(),
                  rooms: roomDetails,
                );
                // log(propertyModel.toString());
                context.read<AddPropertyBloc>().add(
                      AddPropertyEvent.addProperty(propertyModel),
                    );
              },
              child: state.maybeWhen(
                loading: () => CustomCircularProgressIndicator(),
                orElse: () => null,
              ),
            );
          },
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
