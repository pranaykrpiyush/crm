import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';


import 'models/send_menu_items.dart';

class ChatBubbles extends StatefulWidget {
  const ChatBubbles({Key? key}) : super(key: key);

  @override
  _ChatBubblesState createState() => _ChatBubblesState();
}

class _ChatBubblesState extends State<ChatBubbles> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Username'),
          backgroundColor: const Color.fromARGB(255, 55, 55, 193),
        ),
        body: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<SendMenuItems> menuItems = [
    SendMenuItems(
        text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
    SendMenuItems(
        text: "Document", icons: Icons.insert_drive_file, color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
    SendMenuItems(
        text: "Location", icons: Icons.location_on, color: Colors.green),
    SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.purple),
  ];

  void showModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 100, 90, 255),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: const Color.fromARGB(255, 45, 201, 235),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: menuItems[index].color.shade50,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              menuItems[index].icons,
                              size: 20,
                              color: menuItems[index].color.shade400,
                            ),
                          ),
                          title: Text(menuItems[index].text),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        getSenderView(
            ChatBubbleClipper1(type: BubbleType.sendBubble), context),
        getReceiverView(
            ChatBubbleClipper1(type: BubbleType.receiverBubble), context),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 300,
        ),
        const SizedBox(
          width: 16,
        ),
        Align(

          alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.all(9),
            height: 90,
           // width: 20,
            //color: Color,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      fillColor: Colors.blueGrey[900],
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(
                  width: 15,
                  child: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    showModal();
                  },
                  child: Container(
                   // height: 40,
                    //width: 40,
                    decoration: BoxDecoration(
                      //color: Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 55, 55, 193),
                      size: 31,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getTitleText(String title) => Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      );

  getSenderView(CustomClipper clipper, BuildContext context) => ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 20),
        backGroundColor: const Color.fromARGB(255, 55, 55, 193),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  getReceiverView(CustomClipper clipper, BuildContext context) => ChatBubble(
        clipper: clipper,
        backGroundColor: const Color(0xffE7E7ED),
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: const Text(
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}
