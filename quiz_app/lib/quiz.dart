import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result.dart';

import 'data/question_bank.dart';

import 'home_screen.dart';
// import 'package:flutter/widgets.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? startScreen;
  List<String> answerChoosen = [];
  int correctAnswerCount = 0;

  @override
  void initState() {
    super.initState();
    startScreen = HomeScreen(changeScreen);
  }

  void changeScreen() {
    setState(() {
      startScreen = Questions(
          addToAnswerList: addToSelectedAnswerList,
          correctAnswerCount: correctAnswerCount,
          finalScore: finalScore);
    });
  }

  void addToSelectedAnswerList(String answer) {
    answerChoosen.add(answer);
    if (answerChoosen.length == questionBank.length) {
      print("o0jwwwwww");
      print("===========");
      print(correctAnswerCount);
      print("===========");
      // switch to result screen
      setState(() {
        startScreen = Result(correctAnswerCount: correctAnswerCount);
      });
    }
  }

  void finalScore() {
    correctAnswerCount++;
    print("===========");
    print(correctAnswerCount);
    print("===========");
  }

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
            child: startScreen),
      ),
    );
  }
}
