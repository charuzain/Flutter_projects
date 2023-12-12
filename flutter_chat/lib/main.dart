import 'package:flutter/material.dart';
import 'package:flutter_chat/registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import 'chat.dart';
import 'home_screen.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScreen.id : (context) => HomeScreen(),
        Login.id : (context) => Login(),
        Registration.id : (context) => Registration(),
        Chat.id : (context) => Chat()
      },
      initialRoute: HomeScreen.id,
    );
  }
}

