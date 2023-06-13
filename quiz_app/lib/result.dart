import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_bank.dart';

class Result extends StatelessWidget {
  Result(
      {required this.correctAnswerCount,
      required this.answerChoosen,
      super.key,
      required this.restartQuiz});
  int correctAnswerCount;
  List<String> answerChoosen;
  final VoidCallback restartQuiz;
  List<Map> getAnswerSummary() {
    List<Map> answerSummary = [];

    for (var i = 0; i < questionBank.length; i++) {
      answerSummary.add({
        'questionNo': i,
        'question': questionBank[i].question,
        'answer': questionBank[i].correctAnswer,
        'selectedAns': answerChoosen[i]
      });
    }

    return answerSummary;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You have answerd $correctAnswerCount question out of ${answerChoosen.length} questions correctly !',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...getAnswerSummary().map(
                  (item) => QuestionSummary(item: item),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton(
            onPressed: restartQuiz, child: const Text("Restart Quiz"))
      ],
    );
  }
}

class QuestionSummary extends StatelessWidget {
  QuestionSummary({
    required this.item,
    super.key,
  });

  Map<dynamic, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: item['answer'] == item['selectedAns']
                    ? Colors.green
                    : Color.fromARGB(255, 234, 102, 102),
                child: Text(
                  '${item['questionNo'] + 1}'.toString(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      item['question'],
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                    Text(item['answer'],
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start),
                    Text(item['selectedAns'],
                        style: TextStyle(
                          color: item['answer'] == item['selectedAns']
                              ? Colors.green
                              : Color.fromARGB(255, 234, 102, 102),
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
