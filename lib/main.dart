import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}
