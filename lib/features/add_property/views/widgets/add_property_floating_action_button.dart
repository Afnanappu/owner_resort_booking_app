import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/core/models/property_model.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/unconstrained_bottom_floating_action.dart';
import 'package:owner_resort_booking_app/features/google_map/view_model/bloc/google_map_bloc.dart';

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
    return UnconstrainedBottomFloatingAction(
      child: BlocBuilder<AddPropertyBloc, AddPropertyState>(
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

              final roomPrice = roomDetails.fold(
                double.parse(roomDetails[0].price),
                (previousValue, element) =>
                    previousValue > double.parse(element.price)
                        ? double.parse(element.price)
                        : previousValue,
              );
              log('room price = $roomPrice');
              final propertyModel = PropertyModel(
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
                rating: 0,
                reviews: [],
              );
              // log(propertyModel.toString());
              context.read<AddPropertyBloc>().add(
                    AddPropertyEvent.addProperty(
                      propertyModel: propertyModel,
                      roomModelList: roomDetails,
                    ),
                  );
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
