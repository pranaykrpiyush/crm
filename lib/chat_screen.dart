import 'dart:convert';

import 'package:crm_app/chat_bubble.dart';
import 'package:crm_app/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:crm_app/models/chat_users_model.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'models/default_chat_model.dart';

class ChatPage extends StatefulWidget {
  var accessToken;

  ChatPage({Key? key, this.accessToken}) : super(key: key);

  @override
  ChatPageState createState() {
    return ChatPageState();
  }
}

class ChatPageState extends State<ChatPage> {
 Future<List<ContactArr>> getChatData() async {
    var urll =
        "https://app.crm-messaging.cloud/index.php/Api/getConversationContact";
    final response = await http.get(Uri.parse(urll), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${widget.accessToken}',
    });
    var decodedResponse = jsonDecode(response.body);

    List contact = decodedResponse['data']['contactArr'];
    return decodedResponse.map((data)=> ContactArr.fromJson(data)).toList();




  }

  @override
  void initState() {
    futureData=getChatData();
    super.initState();
  }

  Future<List<ContactArr>>? futureData;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Get.to(()=>const ChatBubbles());
            getChatData();
          },
          tooltip: "New message",
          backgroundColor: const Color.fromARGB(255, 55, 55, 193),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 55, 55, 193),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              onPressed: () {
                Get.to(const ProfileScreen());
              },
            ),
          ],
          title: const Text("My messages"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Read",
              ),
              Tab(
                text: "Unread",
              )
            ],
          ),
        ),
        body: FutureBuilder<List<ContactArr>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ContactArr>? contact = snapshot.data;
              return ListView.builder(
                  itemCount: contact?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      color: Colors.white,
                      child: Center(
                        child: Text(contact?[index].contact ?? "error",style: const TextStyle(fontSize: 20),),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
