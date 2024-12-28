import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/app_bar_for_dashboard.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/custom_widget_for_dashboard.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/custom_grid_tile.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/total_booking_container_widget.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenDashboard extends StatelessWidget {
  const ScreenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForHome(),
      body: ListView(
        shrinkWrap: true,
        children: [
          MySpaces.hSpace40,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomGridTile(
                image: 'assets/icons/house.png',
                title: "My\nProperties",
                onTap: () {
                  context.push('/${AppRoutes.myProperties}');
                },
              ),
              CustomGridTile(
                image: 'assets/icons/group.png',
                title: "My\nCustomers",
                onTap: () {},
              ),
              CustomGridTile(
                image: 'assets/icons/report.png',
                title: "Revenue &\nReport",
                onTap: () {},
                innerPadding: 15,
              ),
            ],
          ),
          MySpaces.hSpace40,
          CustomWidgetForHome(
            title: 'Total Booking',
            child: TotalBookingContainerWidget(),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              context.go('/${AppRoutes.login}');
            },
            child: Text('Log out'),
          ),
        ],
      ),
    );
  }
}