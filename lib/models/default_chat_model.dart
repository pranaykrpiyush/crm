// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));



class Chat {
  Chat({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );


}

class Data {
  Data({
    required this.contactArr,
    required this.len,
    required this.fltr,
    required this.isRead,
    required this.provider,
  });

  final List<ContactArr> contactArr;
  final String len;
  final String fltr;
  final int isRead;
  final Provider provider;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    contactArr: List<ContactArr>.from(json["contactArr"].map((x) => ContactArr.fromJson(x))),
    len: json["len"],
    fltr: json["fltr"],
    isRead: json["isRead"],
    provider: Provider.fromJson(json["provider"]),
  );


}

class ContactArr {
  ContactArr({
    required this.contact,
    required this.name,
    required this.msg,
    required this.date,
    required this.log,
    required this.isRead,
    required this.owner,
    required this.ownerName,
    required this.conversationId,
  });

  final String contact;
  final String name;
  final String msg;
  final String date;
  final String log;
  final String isRead;
  final String owner;
  final String ownerName;
  final String conversationId;

  factory ContactArr.fromJson(Map<String, dynamic> json) => ContactArr(
    contact: json["contact"],
    name: json["name"],
    msg: json["msg"],
    date: json["date"],
    log: json["log"],
    isRead: json["isRead"],
    owner: json["owner"],
    ownerName: json["ownerName"],
    conversationId: json["conversationId"],
  );


}

class Provider {
  Provider({
    required this.name,
    required this.sms,
    required this.mms,
    required this.whatsapp,
    required this.providerDefault,
  });

  final String name;
  final int sms;
  final int mms;
  final int whatsapp;
  final String providerDefault;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    name: json["name"],
    sms: json["sms"],
    mms: json["mms"],
    whatsapp: json["whatsapp"],
    providerDefault: json["default"],
  );


}
