import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home Screen',
        actions: [
          ElevatedButton.icon(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then(
                (_) {
                  context.go("/${AppRoutes.login}");
                },
              );
            },
            label: Text('Log out'),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.go("/${AppRoutes.login}");
          },
          child: Text('Home Screen, Press to log out'),
        ),
      ),
    );
  }
}
