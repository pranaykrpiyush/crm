import 'dart:convert';

import 'package:crm_app/chat_screen.dart';
import 'package:crm_app/main_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';


class OTPScreen extends StatefulWidget {
  const OTPScreen({ this.email, required this.otp}) ;

  //final String? otp;
  final String? email;
  final int otp;
  //const OTPScreen({this.otp, this.email});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var message = "";
  var accessToken = "";
  var otpCtrl = TextEditingController();
  verifyOtp() async {
    var email = widget.email;
    //print(otpCtrl.text);
    //print(widget.otp.toString()==otpCtrl.text);
    if(otpCtrl.text == widget.otp.toString()) {
      var url = "https://app.crm-messaging.cloud/index.php/Api/getAccessToken?email=$email";
      http.Response response = await http.get(
        Uri.parse(url),
        // body: map,
      );
      print(response.statusCode);
      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        accessToken = data['accessToken'];

        Get.to(() => const ChatPage());
        setState(() {
          message = "Login Successful";
        });
      }
      else if (response.statusCode == 201) {
        message = "Something went wrong";
      }
      else if (response.statusCode == 401) {
        message = "Unauthorised";
      }
      else if (response.statusCode == 405) {
        message = "Method not allowed";
      }
      else if (response.statusCode == 406) {
        message = "Invalid parameter";
      }
    }
    else{
      message = "Invalid OTP, please try again";
    }
    Fluttertoast.showToast(msg: message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding:
                const EdgeInsets.all(30),
                child: Image.asset('images/lo.png'),
              ),
              Container(
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[900],
                      fontSize: 23),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  color: Colors.white38,
                 // width: MediaQuery.of(context).size.width - 25,
                  // height: 25,

                  child: TextFormField(
                    maxLength: 6,
                    controller: otpCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      //ontentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'OTP',

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
                  onPressed: verifyOtp,
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
                    'Verify OTP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}