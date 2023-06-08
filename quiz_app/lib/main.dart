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
      appBar:
          AppBar(title: const Text("Quiz App"), backgroundColor: Colors.black),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 70, 8, 140),
            Color.fromARGB(255, 57, 7, 118)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/quiz-logo.png',
              // color: Color.fromARGB(100, 123, 111, 20),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text("Learn flutter the fun way!",
                style: TextStyle(color: Colors.white, fontSize: 30)),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton(
                style: ButtonStyle(elevation: MaterialStatePropertyAll(2)),
                onPressed: () {
                  print("Pressed");
                },
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
