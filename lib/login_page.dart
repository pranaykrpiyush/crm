import 'dart:html';

import 'package:crm_app/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:form_validation/form_validation.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String email = '';
  String password = '';
  final formKey = GlobalKey<FormState>();
  String loginMessage = ' ';
  void displayToast() {
    Fluttertoast.showToast(msg: loginMessage);
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
                child: Image.asset('images/lo.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  color: Colors.white38,
                 // width: MediaQuery.of(context).size.width - 35,
                  // height: 25,
                  child: TextFormField(
                    controller: emailCtrl,
                    validator: (String? value) {
                      var validator = Validator(
                        validators: [RequiredValidator(), EmailValidator()],
                      );

                      return validator.validate(
                        context: context,
                        label: 'A valid email address',
                        value: value,
                      );
                    },
                    decoration: const InputDecoration(
                      //ontentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid)),
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 350,
                height: 55,
                child: TextButton(

                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Fluttertoast.showToast(msg: 'OTP sent successfully');
                     // Get.to(const OTPScreen());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OTPScreen(

                              )));
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0x003737c1),
                    ),
                  ),
                  child: const Text(
                    'Login with OTP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),


              TextButton(
                  onPressed: () {
                    //Get.to(() => );
                  },
                  child: Text(
                    "Don't have an account? Create here",
                    style: TextStyle(color: Colors.blue[800]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
