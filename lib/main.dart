import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/constants/theme.dart';

import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/add_property/repository/add_property_repository.dart';
import 'package:owner_resort_booking_app/features/add_property/services/add_property_services.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit/amenities_add_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_bullet_point/bullet_point_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_category/category_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_room_image/upload_image_for_room_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
import 'package:owner_resort_booking_app/features/authentication/repository/auth_repository.dart';
import 'package:owner_resort_booking_app/features/authentication/services/auth_services.dart';
import 'package:owner_resort_booking_app/features/authentication/view_model/bloc/bloc_auth/auth_bloc.dart';
import 'package:owner_resort_booking_app/core/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/features/my_properties/repository/my_property_repository.dart';
import 'package:owner_resort_booking_app/features/my_properties/services/my_property_services.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_room_details/property_room_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_list/my_property_list_bloc.dart';
import 'package:owner_resort_booking_app/routes/routes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    try {
      final deviceIp = '10.0.14.31';

      await FirebaseAuth.instance.useAuthEmulator(deviceIp, 9099);
      FirebaseFirestore.instance.useFirestoreEmulator(deviceIp, 8089);
      log('Local firestore and auth is connected');
    } catch (e) {
      log(e.toString());
    }
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyScreenSize.initialize(context);
    print(MyScreenSize());

    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          log('User is currently signed out!');
        } else {
          log('User is signed in!');
        }
      },
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(AuthServices()),
        ),
        RepositoryProvider(
          create: (context) => AddPropertyRepository(
            addPropertyServices: AddPropertyServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => MyPropertyRepository(
            services: MyPropertyServices(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => UploadFileCubit(),
          ),
          BlocProvider(
            create: (context) => UploadImageForPropertyCubit(),
          ),
          BlocProvider(
            create: (context) => UploadImageForRoomCubit(),
          ),
          BlocProvider(
            create: (context) => RoomAddCubit(),
          ),
          BlocProvider(
            create: (context) =>
                AmenitiesAddCubit(context.read<AddPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                GetPropertyTypeCubit(context.read<AddPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                AddPropertyBloc(context.read<AddPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                MyPropertyListBloc(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PropertyDetailsBloc(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PropertyRoomDetailsBloc(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PropertyRoomListBloc(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) => BulletPointCubit(),
          ),
          BlocProvider(
            create: (context) => ExtraDetailsCubit(),
          ),
          BlocProvider(
            create: (context) => SubDetailsCubit(),
          ),
          BlocProvider(
            create: (context) => RulesDetailsCubit(),
          ),
        ],
        child: MaterialApp.router(
          title: 'StayScape',
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
          // darkTheme: ThemeData.dark(),
          theme: customTheme,
        ),
      ),
    );
  }
}
