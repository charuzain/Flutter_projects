import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 78, 13, 150),
          Color.fromARGB(255, 117, 15, 168)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/quiz-logo.png', width: 300,
            ),
            const SizedBox(
              height: 80,
            ),
            const Text("Learn flutter the fun way!",
                style: TextStyle(color: Colors.white, fontSize: 24)),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                onPressed: () {
                  print("Pressed");
                },
                child: const Text(
                  "Start Quiz",
                ))
          ],
        ),
      ),
    );
  }
}
