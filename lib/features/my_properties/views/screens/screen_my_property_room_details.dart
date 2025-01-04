import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';

class ScreenMyPropertyRoomDetails extends StatelessWidget {
  const ScreenMyPropertyRoomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details Resort',
        needUnderline: false,
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Add editing option here
            },
            icon: Icon(Icons.edit_note_outlined),
          ),
          MySpaces.hSpace5,
        ],
      ),

      // body: ,
    );
  }
}