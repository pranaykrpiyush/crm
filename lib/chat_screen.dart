import 'dart:convert';

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
  Future<List> getChatData() async {
    var urll =
        "https://app.crm-messaging.cloud/index.php/Api/getConversationContact";
    final response = await http.get(Uri.parse(urll), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${widget.accessToken}',
    });
    var decodedResponse = jsonDecode(response.body);

    List contact = decodedResponse['data']['contactArr'];
    return contact;
  }

  @override
  void initState() {
    super.initState();
  }

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
        body: FutureBuilder(
          future: getChatData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(

                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: SizedBox(
                                height: 80,
                                child: Material(
                                  elevation: 5.0,
                                  child: ListTile(
                                    onTap: (){




                                    },
                                    tileColor: Colors.white,
                                    // shape: RoundedRectangleBorder( side:const BorderSide(color: Colors.black,width: 1.0),borderRadius: BorderRadius.circular(5),  ),
                                    selectedColor: Colors.grey,
                                    leading: const Icon(Icons.phone,color: Color.fromARGB(255, 55, 55, 193)),
                                    minVerticalPadding: 2,
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data[index]['contact'],
                                          style: const TextStyle(

                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(

                                          snapshot.data[index]['date'],
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w300
                                          ),

                                        )
                                      ],
                                    ),
                                    subtitle: Text(
                                      snapshot.data[index]['msg'],
                                      style: const TextStyle (fontSize: 15,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
