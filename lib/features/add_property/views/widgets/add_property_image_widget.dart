import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/data/models/picked_file_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';

class AddPropertyImageWidget extends StatelessWidget {
  const AddPropertyImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageForPropertyCubit,
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
    );
  }
}
