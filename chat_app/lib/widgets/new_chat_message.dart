import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewChatMessage extends StatefulWidget {
  const NewChatMessage({super.key});

  @override
  State<NewChatMessage> createState() => _NewChatMessageState();
}

class _NewChatMessageState extends State<NewChatMessage> {
  final _messageController = TextEditingController();

  void submitMessage() async {
    final chatMessage = _messageController.text;

// validation
    if (chatMessage.trim().isEmpty) {
      return;
    }
// get user

    final user = FirebaseAuth.instance.currentUser!;

    // get userData as userName and other details are not stored using auth

    final userData =
        await FirebaseFirestore.instance.collection('user').doc(user.uid).get();


    // create new table (collection) chat
    FirebaseFirestore.instance.collection('chat').add({
      'message': chatMessage,
      'created at': DateTime.now(),
      'username': userData.data()!['username'],
      'userImage': userData.data()!['imageUrl']
    });

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
