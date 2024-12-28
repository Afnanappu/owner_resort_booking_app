import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

class ScreenNavigation extends StatelessWidget {
  const ScreenNavigation({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  final double navIconSize = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/dashboard.png',
              height: navIconSize,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/calendar.png',
              height: navIconSize + 3,
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/person.png',
              height: navIconSize,
            ),
            label: 'Profile',
          ),
        ],
        elevation: 15,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onTap,
        fixedColor: MyColors.orange,
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
