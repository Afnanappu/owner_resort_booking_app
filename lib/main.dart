import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/constants/theme.dart';

import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/authentication/repository/auth_repository.dart';
import 'package:owner_resort_booking_app/features/authentication/services/auth_services.dart';
import 'package:owner_resort_booking_app/features/authentication/view_model/bloc/bloc_auth/auth_bloc.dart';
import 'package:owner_resort_booking_app/core/cubit/cubit_upload_file/upload_file_cubit.dart';
import 'package:owner_resort_booking_app/routes/routes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    try {
      final deviceIp = '172.16.4.113';
      // final deviceIp = '192.168.1.78';

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
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => UploadFileCubit(),
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
