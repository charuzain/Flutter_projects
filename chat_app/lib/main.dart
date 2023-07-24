import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// add firebase to project
// https://firebase.google.com/docs/flutter/setup?platform=ios
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 12, 94, 12))),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return ChatScreen();
            }

            return HomeScreen();
          },
        )

        //  HomeScreen(),
        );
  }
}
