import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/data/view_model/bloc/bloc_notification/notification_bloc.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/core/utils/user_auth_state.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        context
            .read<NotificationBloc>()
            .add(NotificationEvent.updateNotification());
        if (userCurrentAuthState()) {
          context.go("/${AppRoutes.dashboard}");
        } else {
          context.go("/${AppRoutes.login}");
        }
        context.read<OwnerDataCubit>().fetchOwnerData();
      },
    );
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
