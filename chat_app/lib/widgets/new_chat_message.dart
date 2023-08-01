import 'package:flutter/material.dart';

class NewChatMessage extends StatefulWidget {
  const NewChatMessage({super.key});

  @override
  State<NewChatMessage> createState() => _NewChatMessageState();
}

class _NewChatMessageState extends State<NewChatMessage> {
  final _messageController = TextEditingController();

  void submitMessage() {
    final chatMessage = _messageController.text;
    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              controller: _messageController,
              enableSuggestions: true,
              decoration:
                  const InputDecoration(labelText: "Enter chat message"),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          IconButton(onPressed: submitMessage, icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}
