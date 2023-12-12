import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/home_screen.dart';

import 'constants.dart';


class Chat extends StatefulWidget {
  static String id = "chat";
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String msg;
  var db = FirebaseFirestore.instance;
  final messageController = TextEditingController();

  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        print("**********************");
      }
      print("**********************");
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages = await db.collection('messages').get();
    print(messages);
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  void messageStream() async {
    print("**********************");
    print("**********************");
    var snapshots = await db
        .collection('messages')
        .snapshots(); //list of fututrss , listen to all the changes that happen to this collection
    // print(snapshots);
    await for (var msg in snapshots) {
      print(msg.docs);
      for (var snapshot in msg.docs) {
        print(snapshot.data());
      }
      print("**********************");
      print("**********************");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: [
            IconButton(
              onPressed: () async {
                print("**********************");
                print("**********************");
                print("**********************");
                // messageStream();
                // getMessages();
                await auth.signOut();
                Navigator.pushNamed(context, HomeScreen.id);
              },
              icon: Icon(
                Icons.logout,
              ),
            ),

          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: db.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    CircularProgressIndicator();
                  }
                  var msgs = snapshot.data?.docs;
                  List<Widget> msgWidget = [];
                  for (var msg in msgs!) {
                    var messageSender = msg['sender'];
                    msgWidget.add(Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: messageSender ==loggedInUser.email ?CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${msg['sender']}',
                            style: TextStyle(
                                color:messageSender ==loggedInUser.email? Colors.black54 : Colors.red,
                                fontSize: 12.0),
                          ),
                          Material(
                            elevation: 5.0,
                            color: messageSender ==loggedInUser.email? Colors.white : Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                '${msg['msg']}}',
                                style: TextStyle(color:messageSender ==loggedInUser.email? Colors.black : Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
                  }
                  return Expanded(
                    child: ListView(children: msgWidget),
                  );

                  // return Text("ff");
                },
              ),

              // .snapshot gives as a stream
              // turn stream of data (snapshot of widget) into actual widget everytime new data come through
              // setstate is called everytime there is new value in stream
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        print(value);
                        msg = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: 'Enter Message',
                        hintText: 'Enter Chat Message',
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  // ElevatedButton(onPressed: (){}, child: Text("Send")),
                  InkWell(
                    child: Text(
                      "Send",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      messageController.clear();
                      print(msg);
                      print("----------");
                      print(loggedInUser);
                      db
                          .collection('messages')
                          .add({'msg': msg, 'sender': loggedInUser.email});
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
