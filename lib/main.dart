import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/authentication/repository/auth_repository.dart';
import 'package:owner_resort_booking_app/features/authentication/services/auth_services.dart';
import 'package:owner_resort_booking_app/features/authentication/view%20model/bloc/bloc_auth/auth_bloc.dart';
import 'package:owner_resort_booking_app/features/authentication/view%20model/providers/uploaded_file_provider.dart';
import 'package:owner_resort_booking_app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.setLoggingEnabled(true);
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
              create: (context) => AuthBloc(context.read<AuthRepository>())),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => UploadedFileProvider(),
            )
          ],
          child: MaterialApp.router(
            title: 'StayScape',
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
            // darkTheme: ThemeData.dark(),
            // theme: customTheme,
          ),
        ),
      ),
    );
  }
}
