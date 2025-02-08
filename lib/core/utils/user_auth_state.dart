import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

bool userCurrentAuthState() {
  if (FirebaseAuth.instance.currentUser != null) {
    return true;
  }
  return false;
}

Future<void> logoutFromApp(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  // if (await GoogleSignIn().isSignedIn()) {
  //   GoogleSignIn().signOut();
  // }
  if (context.mounted) {
    context.go("/${AppRoutes.login}");
  }
}
