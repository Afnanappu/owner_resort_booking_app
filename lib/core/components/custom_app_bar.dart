import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

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
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black12),
      centerTitle: true,
      title: Text(
        title,
        style: MyTextStyles.titleLargeSemiBoldBlack,
      ),

      // shape: Border(
      //   bottom: BorderSide(
      //     color: MyColors.greyLight,
      //     width: .5,
      //   ),
      // ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16);
}
