import 'package:crm_app/chat_bubble.dart';
import 'package:crm_app/login_page.dart';
import 'package:crm_app/main_page.dart';
import 'package:crm_app/models/splash_screen.dart';
import 'package:crm_app/otp_screen.dart';
import 'package:crm_app/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';

import 'chat_screen.dart';
void main() {
  runApp(const GetMaterialApp(home: MyApp()));
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
     home: const LoginPage() ,
    );
  }
}
