import 'dart:async';

import 'package:crm_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
    //  var prefs = await SharedPreferences.getInstance();
      //int? value = prefs.getInt('goal');
      //if (value != null && (value >= 1 && value <= 10000)) {
        //Get.to(() => const );
      //} else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset('images/logo.gif'),
        ),
      ),
    );
  }
}