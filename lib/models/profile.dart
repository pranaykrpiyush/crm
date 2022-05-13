import 'package:flutter/material.dart';

final makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    child: makeListTile,
  ),
);

final makeListTile = ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
          border: Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),
    title: const Text(
      "Name",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: const <Widget>[
        Icon(Icons.linear_scale, color: Colors.yellowAccent),
        Text(" Intermediate", style: TextStyle(color: Colors.white))
      ],
    ),
    trailing:
    const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
final makeBody = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return makeCard;
    },
  ),
);
final topAppBar = AppBar(
  elevation: 0.5,
  backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
  title: const Text("Profile"),

);
