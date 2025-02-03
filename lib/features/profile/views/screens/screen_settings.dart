import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () async {
          await FirebaseAuth.instance.signOut();
          // if (await GoogleSignIn().isSignedIn()) {
          //   GoogleSignIn().signOut();
          // }
          if (context.mounted) {
            context.go("/${AppRoutes.login}");
          }
        },
        child: SizedBox(
          child: Column(
            children: [
              Icon(
                Icons.logout_outlined,
                color: MyColors.grey,
              ),
              Text('Log Out'),
            ],
          ),
        ),
      )),
    );
  }
}
