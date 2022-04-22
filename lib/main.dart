import 'package:crm_app/login_page.dart';
import 'package:crm_app/main_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     home: AnimatedSplashScreen(
       splash: 'images/splash.png',
       nextScreen: const LoginPage(),
       splashTransition: SplashTransition.rotationTransition,
       //pageTransitionType: PageTransitionType.scale,
     ),
    );
  }
}
