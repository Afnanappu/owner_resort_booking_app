import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:owner_resort_booking_app/core/constants/theme.dart';
import 'package:owner_resort_booking_app/core/data/repository/owner_repository.dart';
import 'package:owner_resort_booking_app/core/data/repository/user_repository.dart';
import 'package:owner_resort_booking_app/core/data/services/notification_services.dart';
import 'package:owner_resort_booking_app/core/data/services/owner_services.dart';
import 'package:owner_resort_booking_app/core/data/services/review_services.dart';
import 'package:owner_resort_booking_app/core/data/services/transaction_services.dart';
import 'package:owner_resort_booking_app/core/data/services/user_services.dart';
import 'package:owner_resort_booking_app/core/data/view_model/bloc/bloc_notification/notification_bloc.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/utils/user_auth_state.dart';
import 'package:owner_resort_booking_app/features/add_property/repository/add_property_repository.dart';
import 'package:owner_resort_booking_app/features/add_property/services/add_property_services.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_amenities_add/amenities_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_bullet_point/bullet_point_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_category/category_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_room_image/upload_image_for_room_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/authentication/repository/auth_repository.dart';
import 'package:owner_resort_booking_app/features/authentication/services/auth_services.dart';
import 'package:owner_resort_booking_app/features/authentication/view_model/bloc/bloc_auth/auth_bloc.dart';
import 'package:owner_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:owner_resort_booking_app/features/dashboard/repository/dashboard_repository.dart';
import 'package:owner_resort_booking_app/features/dashboard/services/dashboard_service.dart';
import 'package:owner_resort_booking_app/features/dashboard/view_model/bloc/bloc_dashboard/dashboard_bloc.dart';
import 'package:owner_resort_booking_app/features/dashboard/view_model/bloc/bloc_revenue_and_report/revenue_and_report_bloc.dart';
import 'package:owner_resort_booking_app/features/dashboard/view_model/cubit/cubit/customers_cubit.dart';
import 'package:owner_resort_booking_app/features/my_bookings/repository/my_booking_repository.dart';
import 'package:owner_resort_booking_app/features/my_bookings/services/my_booking_services.dart';
import 'package:owner_resort_booking_app/features/my_bookings/view_model/bloc/bloc_booked_property_details/booked_property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_bookings/view_model/bloc/bloc_booked_property_list/booked_property_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/repository/my_property_repository.dart';
import 'package:owner_resort_booking_app/features/my_properties/services/my_property_services.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_list/my_property_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_room_details/property_room_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/cubit/filter_data_cubit.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/cubit/property_type_cubit.dart';
import 'package:owner_resort_booking_app/features/profile/repository/payment_history_repository.dart';
import 'package:owner_resort_booking_app/features/profile/services/payment_history_services.dart';
import 'package:owner_resort_booking_app/features/profile/view_model/bloc/payment_history_bloc.dart';
import 'package:owner_resort_booking_app/features/profile/view_model/cubit_report_issue/report_issue_cubit.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';
import 'package:owner_resort_booking_app/routes/routes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NotificationServices().onBackgroundMessages();

  final initialRoute = getInitialRoute();

  runApp(
    MultiRepositoryProvider(
      providers: [
        //Auth
        RepositoryProvider(
          create: (context) => AuthRepository(AuthServices()),
        ),
        RepositoryProvider(
          create: (context) => OwnerRepository(
            services: OwnerServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(
            services: UserServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => MyBookingRepository(
            services: MyBookingServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => PaymentHistoryRepository(
            paymentHistoryServices: PaymentHistoryServices(),
            transactionServices: TransactionServices(),
          ),
        ),

        //Add Property
        RepositoryProvider(
          create: (context) => AddPropertyRepository(
            addPropertyServices: AddPropertyServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ReportIssueCubit(),
        ),

        RepositoryProvider(
          create: (context) => DashboardRepository(
            DashboardService(),
          ),
        ),

        //My Property
        RepositoryProvider(
          create: (context) => MyPropertyRepository(
            services: MyPropertyServices(ReviewServices()),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          //notification
          BlocProvider(create: (context) {
            return NotificationBloc(NotificationServices());
          }),

          //Auth
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),

          //Common file upload
          BlocProvider(
            create: (context) => UploadFileCubit(),
          ),

          //Property image
          BlocProvider(
            create: (context) => UploadImageForPropertyCubit(),
          ),

          //Room image
          BlocProvider(
            create: (context) => UploadImageForRoomCubit(),
          ),

          //Room add
          BlocProvider(
            create: (context) =>
                RoomAddCubit(context.read<AddPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PaymentHistoryBloc(context.read<PaymentHistoryRepository>()),
          ),

          //google map
          BlocProvider(
            create: (context) => GoogleMapBloc(),
          ),

          //filter cubit
          BlocProvider(
            create: (context) => FilterDataCubit(),
          ),
          BlocProvider(
            create: (context) =>
                PropertyTypeCubit(context.read<MyPropertyRepository>()),
          ),

          //Amenities
          BlocProvider(
            create: (context) =>
                AmenitiesAddCubit(context.read<AddPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                DashboardBloc(context.read<DashboardRepository>()),
          ),

          //Add Property Category
          BlocProvider(
            create: (context) =>
                GetPropertyTypeCubit(context.read<AddPropertyRepository>()),
          ),

          // Add Property
          BlocProvider(
            create: (context) =>
                AddPropertyBloc(context.read<AddPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                BookedPropertyListBloc(context.read<MyBookingRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                OwnerDataCubit(context.read<OwnerRepository>()),
          ),

          // My Property
          BlocProvider(
            create: (context) =>
                MyPropertyListBloc(context.read<MyPropertyRepository>()),
          ),

          //Property Details
          BlocProvider(
            create: (context) =>
                PropertyDetailsBloc(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) => UserDataCubit(context.read<UserRepository>()),
          ),

          //Room Details
          BlocProvider(
            create: (context) =>
                PropertyRoomDetailsBloc(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                BookedPropertyDetailsBloc(context.read<MyBookingRepository>()),
          ),

          //Room List
          BlocProvider(
            create: (context) =>
                PropertyRoomListBloc(context.read<MyPropertyRepository>()),
          ),

          //Bullet points for property
          BlocProvider(
            create: (context) => BulletPointCubit(),
          ),

          //Add Property Extra details
          BlocProvider(
            create: (context) => ExtraDetailsCubit(),
          ),

          //Add Property Sub Details
          BlocProvider(
            create: (context) => SubDetailsCubit(),
          ),
          BlocProvider(
            create: (context) => CustomersCubit(
              context.read<DashboardRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => RevenueAndReportBloc(
                context.read<DashboardRepository>(),
                ),
          ),

          //Add Property Rules Details
          BlocProvider(
            create: (context) => RulesDetailsCubit(),
          ),
        ],
        child: MainApp(
          initialRoute: initialRoute,
        ),
      ),
    ),
  );
}

String getInitialRoute() {
  if (userCurrentAuthState()) {
    return AppRoutes.dashboard;
  } else {
    return AppRoutes.login;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.initialRoute,
  });

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    MyScreenSize.initialize(context);
    print(MyScreenSize());
    //initialize notification
    context.read<NotificationBloc>().add(
          NotificationEvent.initNotification(),
        );
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          log('User is currently signed out!');
        } else {
          log('User is signed in!');
        }
      },
    );

    return MaterialApp.router(
      title: 'StayScape',
      debugShowCheckedModeBanner: false,
      routerConfig: routes(initialRoute),
      // darkTheme: ThemeData.dark(),
      theme: customTheme,
    );
  }
}
