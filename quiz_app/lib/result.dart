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
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You have answerd $correctAnswerCount correctly out of ${answerChoosen.length} questions',
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 300,
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
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${item['questionNo'] + 1}'.toString(),
            ),
            Expanded(child: Text(item['question'])),
          ],
        ),
        Text(item['answer'],
            style: const TextStyle(color: Colors.yellow),
            textAlign: TextAlign.start),
        Text(item['selectedAns'],
            style: TextStyle(
                color: item['answer'] == item['selectedAns']
                    ? Colors.green
                    : Colors.red)),
        const SizedBox(
          height: 3,
        )
      ],
    );
  }
}
