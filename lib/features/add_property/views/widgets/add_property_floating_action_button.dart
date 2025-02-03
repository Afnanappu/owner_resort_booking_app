import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/core/data/models/property_model.dart';
import 'package:owner_resort_booking_app/core/utils/math_functions.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/unconstrained_bottom_floating_action.dart';
import 'package:owner_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_details_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class AddPropertyFloatingActionButton extends StatelessWidget {
  const AddPropertyFloatingActionButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.typeController,
    required this.nameController,
    required this.descriptionController,
    required this.checkInTimeController,
    required this.checkOutTimeController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController typeController;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController checkInTimeController;
  final TextEditingController checkOutTimeController;

  @override
  Widget build(BuildContext context) {
    final isEdit = context.read<AddPropertyBloc>().isEdit;
    return UnconstrainedBottomFloatingAction(
      child: BlocBuilder<AddPropertyBloc, AddPropertyState>(
        builder: (context, state) {
          return CustomElevatedButton(
            text: '${isEdit ? 'Edit' : 'Add'} Property',
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

              final locationModel = context
                  .read<GoogleMapBloc>()
                  .state
                  .maybeWhen(
                    locationConfirmed: (confirmedLocation) => confirmedLocation,
                    orElse: () {},
                  );
              if (locationModel == null) {
                showCustomSnackBar(
                  context: context,
                  message:
                      'Location is not selected, please select and proceed',
                );
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
              if (files == null || files.isEmpty) {
                showCustomSnackBar(
                    context: context,
                    message: 'Licenses is not added, try to add');
                return;
              }
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
                  message: 'Room is not added, try to add room',
                );
                return;
              }
              final roomPrice = roomDetails.fold(
                double.parse(roomDetails[0].price),
                (previousValue, element) =>
                    previousValue > double.parse(element.price)
                        ? double.parse(element.price)
                        : previousValue,
              );
              log('room price = $roomPrice');
              // }

              PropertyDetailsModel? property;
              if (isEdit) {
                property = context.read<PropertyDetailsBloc>().state.maybeWhen(
                      loaded: (propertyDetails) => propertyDetails,
                      orElse: () => null,
                    );
              }

              log('Everything is ok to add resort');
              final userId = FirebaseAuth.instance.currentUser!.uid;
              final propertyModel = PropertyModel(
                id: property?.id,
                ownerId: userId,
                images: propertyImages,
                type: typeController.text.trim(),
                name: nameController.text.trim(),
                location: locationModel,
                description: descriptionController.text.trim(),
                licenses: files,
                extraDetails: extraDetails,
                checkInTime: checkInTimeController.text.trim(),
                checkOutTime: checkOutTimeController.text.trim(),
                roomCount: roomDetails.length,
                roomPrice: roomPrice,
                rating: getAverage(
                  property?.reviews
                          .map(
                            (e) => e.rating,
                          )
                          .toList() ??
                      [],
                ),
                reviews: property?.reviews
                        .map(
                          (e) => e.feedback,
                        )
                        .toList() ??
                    [],
              );
              // log(propertyModel.toString());

              if (isEdit) {
                context.read<AddPropertyBloc>().add(
                      AddPropertyEvent.updateProperty(
                        propertyModel: propertyModel,
                        roomModelList: roomDetails,
                      ),
                    );

                showCustomSnackBar(
                  context: context,
                  message: 'Property details edited successfully',
                  bgColor: MyColors.success,
                );
                context.go('/${AppRoutes.myProperties}');
              } else {
                context.read<AddPropertyBloc>().add(
                      AddPropertyEvent.addProperty(
                        propertyModel: propertyModel,
                        roomModelList: roomDetails,
                      ),
                    );
              }

              context.read<UploadImageForPropertyCubit>().clear();
              context.read<UploadFileCubit>().clear();
              context.read<ExtraDetailsCubit>().clear();
              context.read<ExtraDetailsCubit>().clearPreviousState();
              context.read<SubDetailsCubit>().clear();
              context.read<SubDetailsCubit>().clearPreviousState();
              context.read<RulesDetailsCubit>().clear();
              context.read<RulesDetailsCubit>().clearPreviousState();
              context.read<RoomAddCubit>().clear();
            },
            child: state.maybeWhen(
              loading: () => CustomCircularProgressIndicator(),
              orElse: () => null,
            ),
          );
        },
      ),
    );
  }
}
