import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';



class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  //final String? otp;
  //final String? email;
  //const OTPScreen({this.otp, this.email});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var otpCtrl = TextEditingController();
  verifyOtp() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const Color.fromARGB(255, 76, 95, 239),
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
    );
  }
}