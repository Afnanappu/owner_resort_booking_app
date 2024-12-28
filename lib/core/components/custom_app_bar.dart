import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions,
  });
  final String title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.black12),
          centerTitle: true,
          title: Text(
            title,
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          actions: actions,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MyScreenSize.width * .08),
          child: Divider(
            color: MyColors.greyLight,
            thickness: 0,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16);
}
