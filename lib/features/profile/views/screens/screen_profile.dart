import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/features/profile/views/components/list_tile_for_profile.dart';
import 'package:owner_resort_booking_app/features/profile/views/widgets/app_bar_for_profile.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarForProfile(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ListTileForProfile(
                //   icon: Icons.favorite_outline,
                //   title: 'Favorites',
                //   onTap: () {
                //     context.push("/${AppRoutes.favorite}");
                //   },
                // ),
                ListTileForProfile(
                  icon: Icons.payment_rounded,
                  title: 'Payment History',
                  onTap: () {
                    context.push("/${AppRoutes.paymentHistory}");
                  },
                ),
                ListTileForProfile(
                  icon: Icons.assessment_outlined,
                  title: 'Report',
                  onTap: () {
                    //TODO: Report
                  },
                ),
                ListTileForProfile(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {
                    context.push('/${AppRoutes.settings}');
                  },
                ),
                ListTileForProfile(
                  icon: Icons.support_agent_outlined,
                  title: 'Support',
                  onTap: () {
                    //TODO: support
                  },
                ),
                ListTileForProfile(
                  icon: Icons.info_outline,
                  title: 'About',
                  onTap: () {
                    context.push('/${AppRoutes.about}');
                  },
                ),
              ],
            ),
          )

          // ElevatedButton(
          //   onPressed: () async {
          //     await FirebaseAuth.instance.signOut();
          //     if (await GoogleSignIn().isSignedIn()) {
          //       GoogleSignIn().signOut();
          //     }
          //     if (context.mounted) {
          //       context.go("/${AppRoutes.login}");
          //     }
          //   },
          //   child: Text('Profile Screen'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     context.push("/${AppRoutes.paymentHistory}");
          //   },
          //   child: Text('Payment history screen'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     context.push("/${AppRoutes.favorite}");
          //   },
          //   child: Text('Favorite screen'),
          // ),
        ],
      ),
    );
  }
}
