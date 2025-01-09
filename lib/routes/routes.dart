import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/navigation/screen_navigation.dart';
import 'package:owner_resort_booking_app/features/add_property/views/screens/screen_add_extra_details.dart';
import 'package:owner_resort_booking_app/features/add_property/views/screens/screen_add_property.dart';
import 'package:owner_resort_booking_app/features/add_property/views/screens/screen_add_sub_details.dart';
import 'package:owner_resort_booking_app/features/add_property/views/screens/screen_add_room.dart';
import 'package:owner_resort_booking_app/features/authentication/views/screens/screen_login.dart';
import 'package:owner_resort_booking_app/features/authentication/views/screens/screen_sign_up.dart';
import 'package:owner_resort_booking_app/features/authentication/views/screens/screen_splash.dart';
import 'package:owner_resort_booking_app/features/booking/views/screens/screen_booking.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/screens/screen_dashboard.dart';
import 'package:owner_resort_booking_app/features/google_map/views/screens/screen_google_map.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/screens/screen_my_properties.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/screens/screen_my_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/screens/screen_my_property_room_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/screens/screen_my_property_rooms.dart';
import 'package:owner_resort_booking_app/features/profile/views/screens/screen_profile.dart';
import 'package:owner_resort_booking_app/routes/custom_route_transition.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  observers: [
    MyNavigatorObserver(),
  ],
  routes: [
    GoRoute(
        path: '/${AppRoutes.splash}',
        pageBuilder: (_, state) {
          return customTransitionPage(
            state,
            ScreenSplash(),
          );
        }),
    GoRoute(
        name: 'login',
        path: '/${AppRoutes.login}',
        pageBuilder: (_, state) {
          return customTransitionPage(state, ScreenLogin());
        }),
    GoRoute(
      name: 'signup',
      path: '/${AppRoutes.signUp}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenSignUp()),
    ),
    GoRoute(
      path: '/${AppRoutes.myProperties}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenMyProperties(),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoutes.addProperties}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenAddProperty(),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoutes.addExtraDetails}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenAddExtraDetails(),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoutes.addExtraSubDetails}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenAddSubDetails(),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoutes.addRoom}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenAddRoom(),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoutes.myPropertyDetails}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenMyPropertyDetails(),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoutes.myPropertyRooms}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenMyPropertyRooms(),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoutes.googleMap}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenGoogleMap(),
        );
      },
    ),
    GoRoute(
      path: '/${AppRoutes.myPropertyRoomDetails}',
      pageBuilder: (context, state) {
        return customTransitionPage(
          state,
          ScreenMyPropertyRoomDetails(),
        );
      },
    ),

    //Bottom navigation bar screens
    StatefulShellRoute.indexedStack(
      pageBuilder: (_, state, navigationShell) => customTransitionPage(
        state,
        ScreenNavigation(
          navigationShell: navigationShell,
        ),
      ),
      branches: [
        StatefulShellBranch(
          initialLocation: '/${AppRoutes.dashboard}',
          navigatorKey: _sectionNavigatorKey,
          routes: [
            GoRoute(
              path: '/${AppRoutes.dashboard}',
              pageBuilder: (_, state) {
                return customTransitionPage(
                  state,
                  ScreenDashboard(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${AppRoutes.booking}',
              pageBuilder: (_, state) {
                return customTransitionPage(
                  state,
                  ScreenBooking(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${AppRoutes.profile}',
              pageBuilder: (_, state) {
                return customTransitionPage(
                  state,
                  ScreenProfile(),
                );
              },
            ),
          ],
        ),
      ],
    )
  ],
);

//This class is an observable class that will log every navigation changes. Put this class in an observer.
//Can customize out put of any navigation.
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('Push: =>');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('Pop: <=');
  }
}
