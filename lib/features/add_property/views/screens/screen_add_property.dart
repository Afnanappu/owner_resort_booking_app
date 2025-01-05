
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
import 'package:owner_resort_booking_app/core/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/core/components/custom_add_details_for_all_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_text_form_field_for_add_property.dart';
import 'package:owner_resort_booking_app/core/models/extra_details_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_property_floating_action_button.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_property_image_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/add_room_widget_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/check_time_widget_for_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/extra_basic_details_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/extra_rules_details_widget.dart';
import 'package:owner_resort_booking_app/features/add_property/views/widgets/property_type_text_form_field_for_add_property.dart';
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
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   context.read<GetPropertyTypeCubit>().fetchAdditionalOptionsType(
    //       type: AdditionalOptionType.propertyCategories);
    // });
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
        floatingActionButton: AddPropertyFloatingActionButton(
          formKey: _formKey,
          typeController: typeController,
          nameController: nameController,
          locationController: locationController,
          descriptionController: descriptionController,
          checkInTimeController: checkInTimeController,
          checkOutTimeController: checkOutTimeController,
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _onScreenCanPopWorked(bool didPop, dynamic result) {
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
  }
}
