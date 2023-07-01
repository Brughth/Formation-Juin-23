import 'package:flutter/material.dart';
import 'package:formation_juin_23/chats/data/conversation.dart';
import 'package:formation_juin_23/chats/presentation/conversion_widget.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Conversation> conversations = [
    Conversation(
        name: "Olice SONA",
        lastMessage: "yo bro !!",
        date: "hier",
        unReadMessage: 5),
    Conversation(
        name: "ToTO ",
        lastMessage: "yo bro !!",
        date: "hier",
        unReadMessage: 5),
    Conversation(
        name: "send stp",
        lastMessage: "send stp",
        date: "hier",
        unReadMessage: 5),
    Conversation(
        name: "send stp",
        lastMessage: "send stp",
        date: "hier",
        unReadMessage: 5),
    Conversation(
        name: "send stp",
        lastMessage: "send stp",
        date: "hier",
        unReadMessage: 5),
    Conversation(
        name: "send stp",
        lastMessage: "send stp",
        date: "hier",
        unReadMessage: 5),
    Conversation(
        name: "send stp",
        lastMessage: "send stp",
        date: "hier",
        unReadMessage: 5),
    Conversation(
        name: "send stp",
        lastMessage: "send stp",
        date: "hier",
        unReadMessage: 5),
    Conversation(
        name: "send stp",
        lastMessage: "send stp",
        date: "hier",
        unReadMessage: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: conversations
          .map(
            (item) => ConversionWidget(conversation: item),
          )
          .toList(),
    );
  }
}
