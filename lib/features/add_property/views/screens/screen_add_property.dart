import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_upload_file_widget.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/core/utils/check_text_form_field_are_used_or_not.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_property_floating_action_button.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_property_image_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_room_widget_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/check_time_widget_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/extra_details_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/property_type_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    final isEdit = context.read<AddPropertyBloc>().isEdit;
    if (!isEdit) {
      return;
    }
    context.read<PropertyDetailsBloc>().state.maybeWhen(
          loaded: (property) {
            typeController.text = property.type;
            nameController.text = property.name;
            checkInTimeController.text = property.checkInTime;
            checkOutTimeController.text = property.checkOutTime;
            descriptionController.text = property.description;
            locationController.text = property.location.address;
            context.read<UploadImageForPropertyCubit>().setImages(
                  property.images,
                );
            context
                .read<ExtraDetailsCubit>()
                .setExtraDetails(property.extraDetails);

            context.read<SubDetailsCubit>().setAllSubDetails(
                  property.extraDetails.basicDetailsModel.subDetails,
                );
            context.read<RulesDetailsCubit>().setAllRules(
                  property.extraDetails.rulesDetailsModel.rules,
                );

            context.read<UploadFileCubit>().setFiles(files: property.licenses);

            context
                .read<GoogleMapBloc>()
                .add(GoogleMapEvent.setLocation(property.location));

            // final rooms =
            //     context.read<PropertyRoomListBloc>().state.maybeWhen(
            //           loaded: (roomList) => roomList,
            //           orElse: () {},
            //         );
            // context.read<RoomAddCubit>().setRooms(rooms ?? []);
            context.read<RoomAddCubit>().fetchRooms(property.id!);
          },
          orElse: () {},
        );
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {

    // });
    final isEdit = context.read<AddPropertyBloc>().isEdit;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onScreenCanPopWorked,
      child: Scaffold(
        body: BlocListener<AddPropertyBloc, AddPropertyState>(
          listener: (context, state) {
            state.maybeWhen(
              added: () {
                showCustomSnackBar(
                  context: context,
                  message:
                      'Property ${isEdit ? 'edited' : 'added'} successfully',
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
                  title: '${isEdit ? 'Edit' : 'Add'} Property',
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
                        AddPropertyImageWidget(),

                        PropertyTypeTextFormFieldForAddProperty(
                            typeController: typeController),

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
                        BlocListener<GoogleMapBloc, GoogleMapState>(
                          listener: (context, state) {
                            final locationModel = state.maybeWhen(
                              locationConfirmed: (confirmedLocation) =>
                                  confirmedLocation,
                              orElse: () {},
                            );

                            if (locationModel == null) {
                              log('address is null, so can\'t update the location field');
                              return;
                            }
                            locationController.text = locationModel.address;
                          },
                          child: CustomTextFormFieldForAddProperty(
                            hintText: 'Location',
                            controller: locationController,
                            suffixIcon: IconButton(
                              onPressed: () async {
                                await context.push('/${AppRoutes.googleMap}');
                              },
                              icon: Icon(Icons.my_location_rounded),
                            ),
                            readOnly: true,
                            validator: (value) {
                              if (!MyRegex.emptySpaceValidation(value)) {
                                return 'Don\'t use empty space, user characters';
                              } else {
                                return null;
                              }
                            },
                          ),
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
                          isEdit: isEdit,
                        ),

                        //Extra details
                        ExtraDetailsWidget(),

                        CheckTimeWidgetForAddProperty(
                          checkInTimeController: checkInTimeController,
                          checkOutTimeController: checkOutTimeController,
                        ),

                        //Add room
                        AddRoomWidgetForAddProperty(),

                        MySpaces.hSpace60,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddPropertyFloatingActionButton(
          formKey: _formKey,
          typeController: typeController,
          nameController: nameController,
          descriptionController: descriptionController,
          checkInTimeController: checkInTimeController,
          checkOutTimeController: checkOutTimeController,
        ),
      ),
    );
  }

  void _onScreenCanPopWorked(bool didPop, dynamic result) {
    final hasImage =
        !context.read<UploadImageForPropertyCubit>().state.maybeWhen(
              orElse: () => false,
              picked: (_) => true,
            );

    final isFormFieldsActivated = !checkTextFormFieldAreUsedOrNot([
      typeController,
      nameController,
      locationController,
      descriptionController,
      checkInTimeController,
      checkOutTimeController,
    ]);

    final hasLicense = !context.read<UploadFileCubit>().state.maybeWhen(
          orElse: () => false,
          picked: (pickedFiles) => true,
        );

    final hasSubDetails = context.read<SubDetailsCubit>().state.isEmpty;
    final hasRulesDetails = context.read<RulesDetailsCubit>().state.isEmpty;
    final hasRoomsDetails = context.read<RoomAddCubit>().state.isEmpty;

    if (hasRoomsDetails &&
        hasRulesDetails &&
        hasSubDetails &&
        hasLicense &&
        isFormFieldsActivated &&
        hasImage) {
      context.pop();
      return;
    }
    customAlertDialog(
      context: context,
      title: 'Discard changes',
      content: 'Every changes you make wil be discarded!',
      firstText: 'Yes',
      secondText: 'No',
      firstOnPressed: () {
        // clearing the data

        context.read<UploadImageForPropertyCubit>().clear();
        context.read<UploadFileCubit>().clear();
        context.read<ExtraDetailsCubit>().clear();
        context.read<ExtraDetailsCubit>().clearPreviousState();
        context.read<SubDetailsCubit>().clear();
        context.read<SubDetailsCubit>().clearPreviousState();
        context.read<RulesDetailsCubit>().clear();
        context.read<RulesDetailsCubit>().clearPreviousState();
        context.read<RoomAddCubit>().clear();
        context.pop();
        context.pop();
      },
      secondOnPressed: () {
        context.pop();
      },
    );
  }
}
