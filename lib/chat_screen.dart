import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          isThreeLine: true,
          hoverColor: Colors.white54,
          leading: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 100, height: 100),
            child: Container(
              // width: 200,
              //height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/image3.jpg'), fit: BoxFit.fill),
              ),
            ),
          ),
          selectedTileColor: Colors.white54,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'USERNAME ONE',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
              Column(
                children: [
                  const Text(
                    '10.30PM',
                    style: TextStyle(fontSize: 10, color: Colors.white54),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.access_time,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          subtitle: const Text(
            'RECENT CHATS WITH USERNAME ONE. DISPLAYING TEXT IN TWO LINES',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
