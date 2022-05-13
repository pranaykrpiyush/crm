import 'dart:convert';
import 'package:crm_app/web_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:crm_app/chat_screen.dart';
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

  void userLogin() async {
    print("Login");
    email = emailCtrl.text;
    password = passwordCtrl.text;
    int otp;
    var map = Map<String, dynamic>();

    map['email'] = email;

    var url = 'https://app.crm-messaging.cloud/index.php/Api/auth';
    http.Response response = await http.post(
      Uri.parse(url),
      body: map,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      otp = data['otp'];
      print(data['status']);
      print(data['otp']);

      if (data['status'] == 200) {
        setState(() {
          loginMessage = 'OTP sent successfully';
          displayToast();
          Get.to(()=> OTPScreen(email: email,otp:otp));

        //  Navigator.push(context,
          //    MaterialPageRoute(builder: (context) => const OTPScreen()));
        });
        //  final SharedPreferences sharedPreferences =
        // await SharedPreferences.getInstance();
        //sharedPreferences.setBool('loggedIn', true);
      } else if (data['status'] == 201) {
        setState(() {
          loginMessage = 'Failed to send mail';
          displayToast();
        });
      } else if (data['status'] == 401) {
        setState(() {
          loginMessage = 'Unauthorised';
          displayToast();
        });
      } else if (data['status'] == 405) {
        setState(() {
          loginMessage = 'Method not allowed';
          displayToast();
        });
      }
      // else if (data['status'] == 406 ) {
      //   setState(() {
      //     loginMessage = 'Failed to send mail';
      //   });
      // }
      else {
        print("error");
        print(data['status']);
        setState(() {
          loginMessage = 'Please verify your email address';
          displayToast();
        });
      }
    } else {
      setState(() {
        loginMessage = 'Failed to connect to the server';
        displayToast();
        print('fail');
      });
    }
    //displayToast();
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
                padding: const EdgeInsets.all(30),
                child: Image.asset('images/lo.png'),
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
                      userLogin();
                    Fluttertoast.showToast(
                        msg: loginMessage,
                        backgroundColor:
                            const Color.fromARGB(255, 55, 55, 193));

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const OTPScreen()));
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 55, 55, 193),
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
                    Get.to(() =>const SignupScreen() );
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
