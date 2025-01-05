import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_room_image/upload_image_for_room_cubit.dart';

class AddRoomImageWidget extends StatelessWidget {
  const AddRoomImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageForRoomCubit, UploadImageForRoomState>(
      builder: (context, state) {
        final List<PickedFileModel> pickedImages = state.maybeWhen(
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
            context.read<UploadImageForRoomCubit>().updateCurrentIndex = index;
          },
          onLongPressImage: () {
            final index = context.read<UploadImageForRoomCubit>().currentIndex;
            customAlertDialog(
              context: context,
              title: 'Remove image',
              content: 'Do you want to remove this from the list?',
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
            await context.read<UploadImageForRoomCubit>().pickImage();
          },
        );
      },
    );
  }
}
