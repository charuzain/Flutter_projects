import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App")),
      body: Column(
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            color: Color.fromARGB(100, 123, 111, 20),
          ),
          Text("ji"),
        ],
      ),
    );
  }
}
