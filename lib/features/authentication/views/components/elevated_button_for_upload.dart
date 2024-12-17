import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';

class ElevatedButtonForUpload extends StatelessWidget {
  const ElevatedButtonForUpload({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(
        'Upload',
        style: TextStyle(color: MyColors.orange),
      ),
      icon: Icon(
        Icons.upload_file_outlined,
        color: MyColors.orange,
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: MyColors.orange,
        ),
        backgroundColor: MyColors.scaffoldDefaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRad10),
        ),
        // backgroundColor: MyColors.orangeBackground,
      ),
    );
  }
}
