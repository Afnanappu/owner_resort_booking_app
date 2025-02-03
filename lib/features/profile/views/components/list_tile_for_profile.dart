import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

class ListTileForProfile extends StatelessWidget {
  const ListTileForProfile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          title,
          style: MyTextStyles.titleMediumSemiBoldBlack,
        ),
        onTap: onTap,
      ),
    );
  }
}
