import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.mainWidget,
    this.innerPadding = 10,
  });

  final String image;
  final String title;
  final double innerPadding;
  final Widget? mainWidget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: EdgeInsets.all(innerPadding),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRad10),
              border: Border.all(color: MyColors.orange),
            ),
            child: mainWidget ??
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
          ),
          MySpaces.hSpace5,
          Text(
            title,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.orange,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
