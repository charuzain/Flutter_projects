import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_bank.dart';

class Result extends StatelessWidget {
  Result(
      {required this.correctAnswerCount,
      required this.answerChoosen,
      super.key});
  int correctAnswerCount;
  List<String> answerChoosen;

  List<Map> getAnswerSummary() {
    List<Map> answerSummary = [];

    for (var i = 0; i < questionBank.length; i++) {
      answerSummary.add({
        'question': questionBank[i].question,
        'answer': questionBank[i].correctAnswer,
        'selectedAns': answerChoosen[i]
      });
    }

    return answerSummary;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(
            'You have answerd $correctAnswerCount correctly out of ${answerChoosen.length} questions',
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...getAnswerSummary().map((item) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['question']),
                  Text(item['answer'],
                      style: const TextStyle(color: Colors.yellow),
                      textAlign: TextAlign.start),
                  Text(item['selectedAns'],
                      style: TextStyle(
                          color: item['answer'] == item['selectedAns']
                              ? Colors.green
                              : Colors.red)),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              ),

          const SizedBox(
            height: 30,
          ),
          OutlinedButton(onPressed: () {}, child: const Text("Restart Quiz"))
        ],
      ),
    );
  }
}
