import 'package:crm_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:crm_app/models/profile.dart';
import 'package:get/get.dart';
import 'package:crm_app/userdata.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: Container(
        child: ListView(

          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          //itemCount: 10,
          //itemBuilder: (BuildContext context, int index) {
            children:[

              Card(

                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(

                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      // leading: Container(
                      //   padding: const EdgeInsets.only(right: 12.0),
                      //   decoration: BoxDecoration(
                      //       border: Border(
                      //           right: new BorderSide(width: 1.0, color: Colors.white24))),
                      //   child: Icon(Icons.autorenew, color: Colors.white),
                      // ),
                      title:  Text(
                        "$userName",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children:  <Widget>[
                       //   Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("$emailId", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      ),
                ),
              ),
              Card(

                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      // leading: Container(
                      //   padding: const EdgeInsets.only(right: 12.0),
                      //   decoration: BoxDecoration(
                      //       border: Border(
                      //           right: new BorderSide(width: 1.0, color: Colors.white24))),
                      //   child: Icon(Icons.autorenew, color: Colors.white),
                      // ),
                      title:  const Text(
                        "Phone",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children:  <Widget>[
                          //Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("$phone", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      ),
                ),
              ),
              Card(
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      // leading: Container(
                      //   padding: const EdgeInsets.only(right: 12.0),
                      //   decoration: BoxDecoration(
                      //       border: Border(
                      //           right: new BorderSide(width: 1.0, color: Colors.white24))),
                      //   child: Icon(Icons.autorenew, color: Colors.white),
                      // ),
                      title: const Text(
                        "Credits",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children:  <Widget>[
                      //    Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("$credits", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      ),
                ),
              ),
              Card(
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      // leading: Container(
                      //   padding: const EdgeInsets.only(right: 12.0),
                      //   decoration: BoxDecoration(
                      //       border: Border(
                      //           right: new BorderSide(width: 1.0, color: Colors.white24))),
                      //   child: Icon(Icons.autorenew, color: Colors.white),
                      // ),
                      title: const Text(
                        "Plan",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children:  <Widget>[
                         // Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("$plan", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      ),
                ),
              ),
              Card(
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      // leading: Container(
                      //   padding: const EdgeInsets.only(right: 12.0),
                      //   decoration: BoxDecoration(
                      //       border: Border(
                      //           right: new BorderSide(width: 1.0, color: Colors.white24))),
                      //   child: Icon(Icons.autorenew, color: Colors.white),
                      // ),
                      title: const Text(
                        "Member type",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children:  <Widget>[
                         // Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("$memberType", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      ),
                ),
              ),
              TextButton(onPressed: (){Get.off(const LoginPage());}, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout,color: Colors.red,),
                  Text("Logout", style: TextStyle(color: Colors.red),),
                ],
              ))

    ],
    )

        ),
      );
     // bottomNavigationBar: makeBottom,

  }
}
