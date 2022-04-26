import 'package:chownow/constants/endpoints.dart';
import 'package:chownow/screens/landing.dart';
import 'package:chownow/screens/location.dart';
import 'package:chownow/screens/login.dart';
import 'package:chownow/screens/navigation.dart';
import 'package:chownow/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/authcontroller.dart';
import 'screens/timing.dart';

Future<void> main() async {
  // Get.put(AuthController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'GoMoBites',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: SplashScreen()
        // prefs!.getString('token') == 'null' || prefs!.getString('token') == null
        //     ? LoginScreen()
        //     : NavigationPage(),
        );
  }
}
