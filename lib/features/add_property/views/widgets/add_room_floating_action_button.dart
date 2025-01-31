import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/data/models/amenities_model.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/core/data/models/room_model.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_amenities_add/amenities_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_room_image/upload_image_for_room_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/views/components/unconstrained_bottom_floating_action.dart';

class AddRoomFloatingActionButton extends StatelessWidget {
  const AddRoomFloatingActionButton({
    super.key,
    required this.formKey,
    required this.roomTypeController,
    required this.roomIdController,
    required this.priceController,
    required this.areaController,
    required this.bedTypeController,
    required this.gustNumberController,
    required this.descriptionController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController roomTypeController;
  final TextEditingController roomIdController;
  final TextEditingController priceController;
  final TextEditingController areaController;
  final TextEditingController bedTypeController;
  final TextEditingController gustNumberController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    final addRoomCubit = context.read<RoomAddCubit>();
    final isEdit = addRoomCubit.getIndex != null;
    return UnconstrainedBottomFloatingAction(
      child: CustomElevatedButton(
        text: isEdit ? 'Edit' : 'Add',
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
          List<AmenitiesModel> amenities =
              context.read<AmenitiesAddCubit>().state.maybeWhen(
                    picked: (amenitiesList) => amenitiesList,
                    orElse: () => [],
                  );
          if (amenities.isEmpty) {
            showCustomSnackBar(
                context: context,
                message: 'Amenities is not added, try to add!');
            return;
          }

          //Adding room to cubit
          final roomModel = RoomModel(
            images: roomImages,
            roomType: roomTypeController.text.trim(),
            roomId: roomIdController.text.trim(),
            price: priceController.text.trim(),
            roomArea: areaController.text.trim(),
            bedType: bedTypeController.text.trim(),
            maxGustCount: gustNumberController.text.trim(),
            description: descriptionController.text.trim(),
            amenities: amenities,
            bookedDays: [],
          );

          if (isEdit) {
            addRoomCubit.updateRoom(addRoomCubit.getIndex!, roomModel);
            addRoomCubit.setIndex = null;
          } else {
            context.read<RoomAddCubit>().addRoom(roomModel);
          }

          //clearing the cubit data
          context.read<AmenitiesAddCubit>().clearAmenities();
          context.read<UploadImageForRoomCubit>().clear();
          context.pop();
        },
      ),
    );
  }
}
