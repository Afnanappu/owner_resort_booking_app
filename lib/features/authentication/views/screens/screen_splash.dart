import 'package:flutter/material.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) async {
    //     context
    //         .read<NotificationBloc>()
    //         .add(NotificationEvent.updateNotification());
    //     if (userCurrentAuthState()) {
    //       context.go("/${AppRoutes.dashboard}");
    //     } else {
    //       context.go("/${AppRoutes.login}");
    //     }
    //   },
    // );
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
