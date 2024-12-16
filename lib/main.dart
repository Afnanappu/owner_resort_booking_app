import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UploadedFileProvider(),)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routes,
      ),
    );
  }
}
