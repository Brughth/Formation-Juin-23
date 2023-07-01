import 'package:flutter/material.dart';
import 'package:formation_juin_23/chats/data/conversation.dart';

class ConversionWidget extends StatelessWidget {
  final Conversation conversation;
  const ConversionWidget({
    required this.conversation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundColor: Colors.black,
        radius: 40,
      ),
      title: Text(conversation.name),
      subtitle: Text(conversation.lastMessage),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Text(
              conversation.date,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "${conversation.unReadMessage}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
