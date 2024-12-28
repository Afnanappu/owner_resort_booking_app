import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';

class ScreenAddProperty extends StatelessWidget {
  const ScreenAddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            title: 'Add Property',
          )
        ],
      ),
    );
  }
}
