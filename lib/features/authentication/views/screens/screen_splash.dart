import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/utils/user_auth_state.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (userCurrentAuthState()) {
          context.go("/${AppRoutes.dashboard}");
        } else {
          context.go("/${AppRoutes.login}");
        }
      },
    );
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
