import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('created at', descending: true)
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
            // display message from bottom to top
            reverse: true,
            padding: EdgeInsets.only(bottom: 40, right: 30, left: 30),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            snapshot.data!.docs[index].data()['username'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(snapshot.data!.docs[index]
                                    .data()['message']),
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 25,
                        foregroundImage: NetworkImage(
                            snapshot.data!.docs[index].data()['userImage']),
                      )
                    ],
                  ),
                )

            // Row(
            //       children: [
            //         Text(snapshot.data!.docs[index].data()['message']),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         Text(snapshot.data!.docs[index].data()['username']),
            //       ],
            //     ),

            );
      },
    );
  }
}
