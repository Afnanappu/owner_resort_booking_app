import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/features/profile/views/components/profile_app_bar.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ProfileAppBar(
          
        ),
      ]),
    );
  }
}
