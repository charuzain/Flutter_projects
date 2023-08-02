import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('created at', descending: false)
          .snapshots(),
      builder: (ctx, snapshot) {
        // if connection state is  waiting display loading spinner
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Text("NO  DATA FOUND!!");
        }
        // if data is there and is empty list , there is no document
        if (snapshot.data!.docs.isEmpty) {
          return const Text("NO  DATA FOUND!!");
        }
        // if some error

        if (snapshot.hasError) {
          return const Center(
            child: Text("Some error occured"),
          );
        }

        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) =>
                Text(snapshot.data!.docs[index].data()['message']));
      },
    );
  }
}
