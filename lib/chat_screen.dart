import 'package:crm_app/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:crm_app/models/chat_users_model.dart';
import 'package:get/get.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);


  @override
  ChatPageState createState() {
    return ChatPageState();
  }
}

class ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(()=>const ChatBubbles());
          },
          tooltip: "New message",
          backgroundColor: const Color.fromARGB(255, 55, 55, 193),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 55, 55, 193),
          actions: const [
            Icon(Icons.more_vert_rounded)
          ],
          title: const Text("My messages"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tab1",),
              Tab(text: "Tab2",),
              Tab(text: "Tab3",)
              
              
            ],
          ),
        ),

        body: ListView.builder(
          itemCount: chatItemData.length,
          itemBuilder: (context, i) => Column(
            children: <Widget>[

               ListTile(
                leading:  CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage:  NetworkImage(chatItemData[i].avatarUrl),
                ),
                title:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     Text(
                      chatItemData[i].name,
                      style:  const TextStyle(fontWeight: FontWeight.bold),
                    ),
                     Text(
                      chatItemData[i].time,
                      style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle:  Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child:  Text(
                    chatItemData[i].message,
                    style:  const TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
