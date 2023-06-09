import 'package:flutter/material.dart';

import 'home_screen.dart';
// import 'package:flutter/widgets.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
          backgroundColor: Colors.black,
        ),
        body: Container(
            decoration: const BoxDecoration(
              // color: Colors.amberAccent,
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 150),
                Color.fromARGB(255, 117, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: HomeScreen()),
      ),
    );
  }
}
